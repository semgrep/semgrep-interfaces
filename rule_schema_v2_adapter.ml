module Formula = struct

  (** Convert from original json to ATD-compatible json *)
  let normalize (orig : Yojson.Safe.t ) : Yojson.Safe.t =
    match orig with
    | `String str ->
        `List [`String "pattern"; `String str]
    | x -> x

  (** Convert from ATD-compatible json to original json *)
  let restore  (atd : Yojson.Safe.t) : Yojson.Safe.t =
    atd
  
end
