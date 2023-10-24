#!/usr/bin/env bash
# This script is used in CI to ensure that we don't introduce breaking changes to the semgrep_output_v1.atd file.
# We need this since the backend uses the latest ATD's to validate/parse JSON from all supported client versions.
# Adding fields as required breaks the backend when an older client doesn't send this field.
#
# The rough idea here is:
#  - Fetch the minimum supported version from the semgrep.dev API
#  - Enumerate all tags since the minimum version
#  - For each tag we need to support:
#    - Diff against origin/main to establish a baseline
#    - Diff against HEAD
#    - Diff the two diffs to see if new issues were introduced

set -u # no "-eo pipefail" because we do our own error handling

minimum="v$(curl -s https://semgrep.dev/api/check-version | jq -r '.versions.minimum')"
tags=$(git log --simplify-by-decoration --pretty=format:%D "${minimum}^!" origin/main | grep -o 'tag: [^,)]\+' | sed 's/^tag: //' | sort -n)

checked=()
errors=0
for tag in $tags; do
    commit=$(git rev-list -n 1 "$tag")
    if [[ "${checked[*]}" =~ "$commit" ]]; then
        echo "Skipping $tag because commit $commit has already been checked"
        continue
    fi
    checked+=("$commit")

    echo "Checking backward compatibility of semgrep_output_v1.atd against past version $tag"
    git difftool -x 'atddiff --backward' -y "$tag" "origin/main" semgrep_output_v1.atd > before.txt
    git difftool -x 'atddiff --backward' -y "$tag" "HEAD" semgrep_output_v1.atd > after.txt

    # neccesary because filenames have temp paths and line numbers can change without causing issues
    expr='s|File "/.*/\(.*.atd\)", line .*$|File "\1", line <removed for diff>|g'
    diff -u <(sed "$expr" before.txt) <(sed "$expr" after.txt)
    if [ "$?" -ne 0 ]; then
        echo "ERROR: semgrep_output_v1.atd is not backward compatible with $tag"
        errors=$((errors + 1))
    fi
done

if [ "$errors" -ne 0 ]; then
    exit 1
fi