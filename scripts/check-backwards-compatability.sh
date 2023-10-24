#!/bin/bash

# fetch minimum version and enumerate tags for supported releases
minimum="v$(curl -s https://semgrep.dev/api/check-version | jq -r '.versions.minimum')"
tags=$(git log --simplify-by-decoration --pretty=format:%D "${minimum}^!" origin/main | grep -o 'tag: [^,)]\+' | sed 's/^tag: //' | sort -n)

# check tags
checked=()
errors=0
for tag in $tags; do
    commit=$(git rev-list -n 1 "$tag")
    if [[ "${checked[*]}" =~ $commit ]]; then
        echo "Skipping $tag because commit $commit has already been checked"
        continue
    fi
    checked+=($commit)

    echo "Checking backward compatibility of semgrep_output_v1.atd against past version $tag"
    git difftool -x 'atddiff --backward' -y --trust-exit-code "$tag" semgrep_output_v1.atd

    if [ $? -ne 0 ]; then
        echo "ERROR: semgrep_output_v1.atd is not backward compatible with $tag"
        errors=$((errors + 1))
    fi
done

if [ $errors -ne 0 ]; then
    exit 1
fi