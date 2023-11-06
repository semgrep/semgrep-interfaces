(* ATD adapter for rule_schema_v2.atd
 * See https://atd.readthedocs.io/en/latest/atdgen.html#field-adapter-ocaml
 *)

module Formula = struct

  (** Convert from original json to ATD-compatible json *)
  let normalize (orig : Yojson.Safe.t ) : Yojson.Safe.t =
    match orig with
    | `String str ->
        `List [`String "pattern"; `String str]
    | x -> x

  (** Convert from ATD-compatible json to original json *)
  let restore  (_atd : Yojson.Safe.t) : Yojson.Safe.t =
    (* not needed for now; we care just about parsing *)
    failwith "Rule_schema_v2_adapter.Formula.restore not implemented"
end
