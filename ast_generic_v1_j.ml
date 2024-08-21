(* Auto-generated from "ast_generic_v1.atd" *)
[@@@ocaml.warning "-27-32-33-35-39"]

type class_kind = Ast_generic_v1_t.class_kind

type concat_string_kind = Ast_generic_v1_t.concat_string_kind

type const_type = Ast_generic_v1_t.const_type

type container_operator = Ast_generic_v1_t.container_operator

type function_kind = Ast_generic_v1_t.function_kind

type incr_decr = Ast_generic_v1_t.incr_decr

type keyword_attribute = Ast_generic_v1_t.keyword_attribute

type operator = Ast_generic_v1_t.operator

type prefix_postfix = Ast_generic_v1_t.prefix_postfix

type sid = Ast_generic_v1_t.sid

type special = Ast_generic_v1_t.special

type token_location = Ast_generic_v1_t.token_location = {
  str: string;
  charpos: int;
  line: int;
  column: int;
  filename: string
}

type token = Ast_generic_v1_t.token

type tok = Ast_generic_v1_t.tok

type 'a bracket = 'a Ast_generic_v1_t.bracket

type sc = Ast_generic_v1_t.sc

type variance = Ast_generic_v1_t.variance

type 'a wrap_ = 'a Ast_generic_v1_t.wrap_

type ident = Ast_generic_v1_t.ident

type dotted_ident = Ast_generic_v1_t.dotted_ident

type label = Ast_generic_v1_t.label

type literal = Ast_generic_v1_t.literal

type module_name = Ast_generic_v1_t.module_name

type resolved_name_kind = Ast_generic_v1_t.resolved_name_kind

type resolved_name = Ast_generic_v1_t.resolved_name

type todo_kind = Ast_generic_v1_t.todo_kind

type xml_kind = Ast_generic_v1_t.xml_kind

type alias = Ast_generic_v1_t.alias

and any = Ast_generic_v1_t.any

and argument = Ast_generic_v1_t.argument

and arguments = Ast_generic_v1_t.arguments

and attribute = Ast_generic_v1_t.attribute

and case = Ast_generic_v1_t.case

and case_and_body = Ast_generic_v1_t.case_and_body

and catch = Ast_generic_v1_t.catch

and catch_exn = Ast_generic_v1_t.catch_exn

and class_definition = Ast_generic_v1_t.class_definition = {
  ckind: class_kind wrap_;
  cextends: class_parent list;
  cimplements: type_ list;
  cmixins: type_ list;
  cparams: parameters;
  cbody: field list bracket
}

and class_parent = Ast_generic_v1_t.class_parent

and comprehension = Ast_generic_v1_t.comprehension

and condition = Ast_generic_v1_t.condition

and definition = Ast_generic_v1_t.definition

and definition_kind = Ast_generic_v1_t.definition_kind

and directive = Ast_generic_v1_t.directive

and entity = Ast_generic_v1_t.entity = {
  name: entity_name;
  attrs: attribute list;
  tparams: type_parameters
}

and entity_name = Ast_generic_v1_t.entity_name

and enum_entry_definition = Ast_generic_v1_t.enum_entry_definition = {
  ee_args: arguments option;
  ee_body: field list bracket option
}

and expr = Ast_generic_v1_t.expr

and field = Ast_generic_v1_t.field

and field_name = Ast_generic_v1_t.field_name

and finally = Ast_generic_v1_t.finally

and for_each = Ast_generic_v1_t.for_each

and for_header = Ast_generic_v1_t.for_header

and for_or_if_comp = Ast_generic_v1_t.for_or_if_comp

and for_var_or_expr = Ast_generic_v1_t.for_var_or_expr

and function_body = Ast_generic_v1_t.function_body

and function_definition = Ast_generic_v1_t.function_definition = {
  fkind: function_kind wrap_;
  fparams: parameters;
  frettype: type_ option;
  fbody: function_body
}

and id_info = Ast_generic_v1_t.id_info = {
  id_resolved: resolved_name option;
  id_type: type_ option;
  id_svalue: svalue option
}

and item = Ast_generic_v1_t.item

and label_ident = Ast_generic_v1_t.label_ident

and macro_definition = Ast_generic_v1_t.macro_definition = {
  macroparams: ident list;
  macrobody: any list
}

and module_definition = Ast_generic_v1_t.module_definition = {
  mbody: module_definition_kind
}

and module_definition_kind = Ast_generic_v1_t.module_definition_kind

and multi_for_each = Ast_generic_v1_t.multi_for_each

and name = Ast_generic_v1_t.name

and or_type_element = Ast_generic_v1_t.or_type_element

and parameter = Ast_generic_v1_t.parameter

and parameter_classic = Ast_generic_v1_t.parameter_classic = {
  pname: ident option;
  ptype: type_ option;
  pdefault: expr option;
  pattrs: attribute list;
  pinfo: id_info
}

and parameters = Ast_generic_v1_t.parameters

and pattern = Ast_generic_v1_t.pattern

and qualified_info = Ast_generic_v1_t.qualified_info = {
  name_last: (ident * type_arguments option);
  name_middle: qualifier option;
  name_top: tok option;
  name_info: id_info
}

and qualifier = Ast_generic_v1_t.qualifier

and stmt = Ast_generic_v1_t.stmt

and svalue = Ast_generic_v1_t.svalue

and type_ = Ast_generic_v1_t.type_

and type_argument = Ast_generic_v1_t.type_argument

and type_arguments = Ast_generic_v1_t.type_arguments

and type_definition = Ast_generic_v1_t.type_definition = {
  tbody: type_definition_kind
}

and type_definition_kind = Ast_generic_v1_t.type_definition_kind

and type_parameter = Ast_generic_v1_t.type_parameter

and type_parameter_classic = Ast_generic_v1_t.type_parameter_classic = {
  tp_id: ident;
  tp_attrs: attribute list;
  tp_bounds: type_ list;
  tp_default: type_ option;
  tp_variance: variance wrap_ option
}

and type_parameters = Ast_generic_v1_t.type_parameters

and variable_definition = Ast_generic_v1_t.variable_definition = {
  vinit: expr option;
  vtype: type_ option
}

and xml = Ast_generic_v1_t.xml = {
  xml_kind: xml_kind;
  xml_attrs: xml_attribute list;
  xml_body: xml_body list
}

and xml_attr_value = Ast_generic_v1_t.xml_attr_value

and xml_attribute = Ast_generic_v1_t.xml_attribute

and xml_body = Ast_generic_v1_t.xml_body

type program = Ast_generic_v1_t.program

let write__float_nullable = (
  Atdgen_runtime.Oj_run.write_nullable (
    Yojson.Safe.write_std_float
  )
)
let string_of__float_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__float_nullable ob x;
  Buffer.contents ob
let read__float_nullable = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      Atdgen_runtime.Oj_run.read_number
    ) p lb) : _ option)
)
let _float_nullable_of_string s =
  read__float_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__x_71cb4bf = (
  Atdgen_runtime.Oj_run.write_nullable (
    Atdgen_runtime.Oj_run.write_int64
  )
)
let string_of__x_71cb4bf ?(len = 1024) x =
  let ob = Buffer.create len in
  write__x_71cb4bf ob x;
  Buffer.contents ob
let read__x_71cb4bf = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      Atdgen_runtime.Oj_run.read_int64
    ) p lb) : _ option)
)
let _x_71cb4bf_of_string s =
  read__x_71cb4bf (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_class_kind = (
  fun ob x ->
    match x with
      | `Class -> Buffer.add_string ob "\"Class\""
      | `Interface -> Buffer.add_string ob "\"Interface\""
      | `Trait -> Buffer.add_string ob "\"Trait\""
      | `Object -> Buffer.add_string ob "\"Object\""
)
let string_of_class_kind ?(len = 1024) x =
  let ob = Buffer.create len in
  write_class_kind ob x;
  Buffer.contents ob
let read_class_kind = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Class" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Class
            | "Interface" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Interface
            | "Trait" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Trait
            | "Object" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Object
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "Class" ->
              `Class
            | "Interface" ->
              `Interface
            | "Trait" ->
              `Trait
            | "Object" ->
              `Object
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let class_kind_of_string s =
  read_class_kind (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_concat_string_kind = (
  fun ob x ->
    match x with
      | `InterpolatedConcat -> Buffer.add_string ob "\"InterpolatedConcat\""
      | `SequenceConcat -> Buffer.add_string ob "\"SequenceConcat\""
      | `FString x ->
        Buffer.add_string ob "[\"FString\",";
        (
          Yojson.Safe.write_string
        ) ob x;
        Buffer.add_char ob ']'
      | `TaggedTemplateLiteral -> Buffer.add_string ob "\"TaggedTemplateLiteral\""
)
let string_of_concat_string_kind ?(len = 1024) x =
  let ob = Buffer.create len in
  write_concat_string_kind ob x;
  Buffer.contents ob
let read_concat_string_kind = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "InterpolatedConcat" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `InterpolatedConcat
            | "SequenceConcat" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `SequenceConcat
            | "FString" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `FString x
            | "TaggedTemplateLiteral" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TaggedTemplateLiteral
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "InterpolatedConcat" ->
              `InterpolatedConcat
            | "SequenceConcat" ->
              `SequenceConcat
            | "TaggedTemplateLiteral" ->
              `TaggedTemplateLiteral
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "FString" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `FString x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let concat_string_kind_of_string s =
  read_concat_string_kind (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_const_type = (
  fun ob x ->
    match x with
      | `Cbool -> Buffer.add_string ob "\"Cbool\""
      | `Cint -> Buffer.add_string ob "\"Cint\""
      | `Cstr -> Buffer.add_string ob "\"Cstr\""
      | `Cany -> Buffer.add_string ob "\"Cany\""
)
let string_of_const_type ?(len = 1024) x =
  let ob = Buffer.create len in
  write_const_type ob x;
  Buffer.contents ob
let read_const_type = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Cbool" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Cbool
            | "Cint" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Cint
            | "Cstr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Cstr
            | "Cany" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Cany
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "Cbool" ->
              `Cbool
            | "Cint" ->
              `Cint
            | "Cstr" ->
              `Cstr
            | "Cany" ->
              `Cany
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let const_type_of_string s =
  read_const_type (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_container_operator = (
  fun ob x ->
    match x with
      | `Array -> Buffer.add_string ob "\"Array\""
      | `List -> Buffer.add_string ob "\"List\""
      | `Set -> Buffer.add_string ob "\"Set\""
      | `Dict -> Buffer.add_string ob "\"Dict\""
      | `Tuple -> Buffer.add_string ob "\"Tuple\""
)
let string_of_container_operator ?(len = 1024) x =
  let ob = Buffer.create len in
  write_container_operator ob x;
  Buffer.contents ob
let read_container_operator = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Array" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Array
            | "List" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `List
            | "Set" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Set
            | "Dict" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Dict
            | "Tuple" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Tuple
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "Array" ->
              `Array
            | "List" ->
              `List
            | "Set" ->
              `Set
            | "Dict" ->
              `Dict
            | "Tuple" ->
              `Tuple
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let container_operator_of_string s =
  read_container_operator (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_function_kind = (
  fun ob x ->
    match x with
      | `Function -> Buffer.add_string ob "\"Function\""
      | `Method -> Buffer.add_string ob "\"Method\""
      | `LambdaKind -> Buffer.add_string ob "\"LambdaKind\""
      | `Arrow -> Buffer.add_string ob "\"Arrow\""
      | `BlockCases -> Buffer.add_string ob "\"BlockCases\""
)
let string_of_function_kind ?(len = 1024) x =
  let ob = Buffer.create len in
  write_function_kind ob x;
  Buffer.contents ob
let read_function_kind = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Function" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Function
            | "Method" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Method
            | "LambdaKind" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `LambdaKind
            | "Arrow" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Arrow
            | "BlockCases" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `BlockCases
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "Function" ->
              `Function
            | "Method" ->
              `Method
            | "LambdaKind" ->
              `LambdaKind
            | "Arrow" ->
              `Arrow
            | "BlockCases" ->
              `BlockCases
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let function_kind_of_string s =
  read_function_kind (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_incr_decr = (
  fun ob x ->
    match x with
      | `Incr -> Buffer.add_string ob "\"Incr\""
      | `Decr -> Buffer.add_string ob "\"Decr\""
)
let string_of_incr_decr ?(len = 1024) x =
  let ob = Buffer.create len in
  write_incr_decr ob x;
  Buffer.contents ob
let read_incr_decr = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Incr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Incr
            | "Decr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Decr
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "Incr" ->
              `Incr
            | "Decr" ->
              `Decr
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let incr_decr_of_string s =
  read_incr_decr (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_keyword_attribute = (
  fun ob x ->
    match x with
      | `Static -> Buffer.add_string ob "\"Static\""
      | `Volatile -> Buffer.add_string ob "\"Volatile\""
      | `Extern -> Buffer.add_string ob "\"Extern\""
      | `Public -> Buffer.add_string ob "\"Public\""
      | `Private -> Buffer.add_string ob "\"Private\""
      | `Protected -> Buffer.add_string ob "\"Protected\""
      | `Abstract -> Buffer.add_string ob "\"Abstract\""
      | `Final -> Buffer.add_string ob "\"Final\""
      | `Override -> Buffer.add_string ob "\"Override\""
      | `RecordClass -> Buffer.add_string ob "\"RecordClass\""
      | `AnnotationClass -> Buffer.add_string ob "\"AnnotationClass\""
      | `EnumClass -> Buffer.add_string ob "\"EnumClass\""
      | `SealedClass -> Buffer.add_string ob "\"SealedClass\""
      | `Var -> Buffer.add_string ob "\"Var\""
      | `Let -> Buffer.add_string ob "\"Let\""
      | `Mutable -> Buffer.add_string ob "\"Mutable\""
      | `Const -> Buffer.add_string ob "\"Const\""
      | `Optional -> Buffer.add_string ob "\"Optional\""
      | `NotNull -> Buffer.add_string ob "\"NotNull\""
      | `Recursive -> Buffer.add_string ob "\"Recursive\""
      | `MutuallyRecursive -> Buffer.add_string ob "\"MutuallyRecursive\""
      | `Generator -> Buffer.add_string ob "\"Generator\""
      | `Async -> Buffer.add_string ob "\"Async\""
      | `Inline -> Buffer.add_string ob "\"Inline\""
      | `Ctor -> Buffer.add_string ob "\"Ctor\""
      | `Dtor -> Buffer.add_string ob "\"Dtor\""
      | `Getter -> Buffer.add_string ob "\"Getter\""
      | `Setter -> Buffer.add_string ob "\"Setter\""
      | `Unsafe -> Buffer.add_string ob "\"Unsafe\""
      | `DefaultImpl -> Buffer.add_string ob "\"DefaultImpl\""
      | `Lazy -> Buffer.add_string ob "\"Lazy\""
      | `Throws -> Buffer.add_string ob "\"Throws\""
      | `Rethrows -> Buffer.add_string ob "\"Rethrows\""
      | `OtherKeyword x ->
        Buffer.add_string ob "[\"OtherKeyword\",";
        (
          Yojson.Safe.write_string
        ) ob x;
        Buffer.add_char ob ']'
)
let string_of_keyword_attribute ?(len = 1024) x =
  let ob = Buffer.create len in
  write_keyword_attribute ob x;
  Buffer.contents ob
let read_keyword_attribute = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Static" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Static
            | "Volatile" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Volatile
            | "Extern" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Extern
            | "Public" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Public
            | "Private" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Private
            | "Protected" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Protected
            | "Abstract" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Abstract
            | "Final" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Final
            | "Override" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Override
            | "RecordClass" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `RecordClass
            | "AnnotationClass" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `AnnotationClass
            | "EnumClass" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `EnumClass
            | "SealedClass" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `SealedClass
            | "Var" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Var
            | "Let" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Let
            | "Mutable" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Mutable
            | "Const" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Const
            | "Optional" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Optional
            | "NotNull" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `NotNull
            | "Recursive" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Recursive
            | "MutuallyRecursive" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `MutuallyRecursive
            | "Generator" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Generator
            | "Async" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Async
            | "Inline" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Inline
            | "Ctor" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Ctor
            | "Dtor" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Dtor
            | "Getter" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Getter
            | "Setter" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Setter
            | "Unsafe" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Unsafe
            | "DefaultImpl" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `DefaultImpl
            | "Lazy" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Lazy
            | "Throws" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Throws
            | "Rethrows" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Rethrows
            | "OtherKeyword" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherKeyword x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "Static" ->
              `Static
            | "Volatile" ->
              `Volatile
            | "Extern" ->
              `Extern
            | "Public" ->
              `Public
            | "Private" ->
              `Private
            | "Protected" ->
              `Protected
            | "Abstract" ->
              `Abstract
            | "Final" ->
              `Final
            | "Override" ->
              `Override
            | "RecordClass" ->
              `RecordClass
            | "AnnotationClass" ->
              `AnnotationClass
            | "EnumClass" ->
              `EnumClass
            | "SealedClass" ->
              `SealedClass
            | "Var" ->
              `Var
            | "Let" ->
              `Let
            | "Mutable" ->
              `Mutable
            | "Const" ->
              `Const
            | "Optional" ->
              `Optional
            | "NotNull" ->
              `NotNull
            | "Recursive" ->
              `Recursive
            | "MutuallyRecursive" ->
              `MutuallyRecursive
            | "Generator" ->
              `Generator
            | "Async" ->
              `Async
            | "Inline" ->
              `Inline
            | "Ctor" ->
              `Ctor
            | "Dtor" ->
              `Dtor
            | "Getter" ->
              `Getter
            | "Setter" ->
              `Setter
            | "Unsafe" ->
              `Unsafe
            | "DefaultImpl" ->
              `DefaultImpl
            | "Lazy" ->
              `Lazy
            | "Throws" ->
              `Throws
            | "Rethrows" ->
              `Rethrows
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "OtherKeyword" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherKeyword x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let keyword_attribute_of_string s =
  read_keyword_attribute (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_operator = (
  fun ob x ->
    match x with
      | `Plus -> Buffer.add_string ob "\"Plus\""
      | `Minus -> Buffer.add_string ob "\"Minus\""
      | `Mult -> Buffer.add_string ob "\"Mult\""
      | `Div -> Buffer.add_string ob "\"Div\""
      | `Mod -> Buffer.add_string ob "\"Mod\""
      | `Pow -> Buffer.add_string ob "\"Pow\""
      | `FloorDiv -> Buffer.add_string ob "\"FloorDiv\""
      | `MatMult -> Buffer.add_string ob "\"MatMult\""
      | `LSL -> Buffer.add_string ob "\"LSL\""
      | `LSR -> Buffer.add_string ob "\"LSR\""
      | `ASR -> Buffer.add_string ob "\"ASR\""
      | `BitOr -> Buffer.add_string ob "\"BitOr\""
      | `BitXor -> Buffer.add_string ob "\"BitXor\""
      | `BitAnd -> Buffer.add_string ob "\"BitAnd\""
      | `BitNot -> Buffer.add_string ob "\"BitNot\""
      | `BitClear -> Buffer.add_string ob "\"BitClear\""
      | `And -> Buffer.add_string ob "\"And\""
      | `Or -> Buffer.add_string ob "\"Or\""
      | `Xor -> Buffer.add_string ob "\"Xor\""
      | `Not -> Buffer.add_string ob "\"Not\""
      | `Eq -> Buffer.add_string ob "\"Eq\""
      | `NotEq -> Buffer.add_string ob "\"NotEq\""
      | `PhysEq -> Buffer.add_string ob "\"PhysEq\""
      | `NotPhysEq -> Buffer.add_string ob "\"NotPhysEq\""
      | `Lt -> Buffer.add_string ob "\"Lt\""
      | `LtE -> Buffer.add_string ob "\"LtE\""
      | `Gt -> Buffer.add_string ob "\"Gt\""
      | `GtE -> Buffer.add_string ob "\"GtE\""
      | `Cmp -> Buffer.add_string ob "\"Cmp\""
      | `Concat -> Buffer.add_string ob "\"Concat\""
      | `Append -> Buffer.add_string ob "\"Append\""
      | `RegexpMatch -> Buffer.add_string ob "\"RegexpMatch\""
      | `NotMatch -> Buffer.add_string ob "\"NotMatch\""
      | `Range -> Buffer.add_string ob "\"Range\""
      | `RangeInclusive -> Buffer.add_string ob "\"RangeInclusive\""
      | `NotNullPostfix -> Buffer.add_string ob "\"NotNullPostfix\""
      | `Length -> Buffer.add_string ob "\"Length\""
      | `Elvis -> Buffer.add_string ob "\"Elvis\""
      | `Nullish -> Buffer.add_string ob "\"Nullish\""
      | `In -> Buffer.add_string ob "\"In\""
      | `NotIn -> Buffer.add_string ob "\"NotIn\""
      | `Is -> Buffer.add_string ob "\"Is\""
      | `NotIs -> Buffer.add_string ob "\"NotIs\""
      | `Background -> Buffer.add_string ob "\"Background\""
      | `Pipe -> Buffer.add_string ob "\"Pipe\""
      | `LDA -> Buffer.add_string ob "\"LDA\""
      | `RDA -> Buffer.add_string ob "\"RDA\""
      | `LSA -> Buffer.add_string ob "\"LSA\""
      | `RSA -> Buffer.add_string ob "\"RSA\""
)
let string_of_operator ?(len = 1024) x =
  let ob = Buffer.create len in
  write_operator ob x;
  Buffer.contents ob
let read_operator = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Plus" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Plus
            | "Minus" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Minus
            | "Mult" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Mult
            | "Div" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Div
            | "Mod" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Mod
            | "Pow" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Pow
            | "FloorDiv" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `FloorDiv
            | "MatMult" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `MatMult
            | "LSL" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `LSL
            | "LSR" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `LSR
            | "ASR" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ASR
            | "BitOr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `BitOr
            | "BitXor" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `BitXor
            | "BitAnd" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `BitAnd
            | "BitNot" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `BitNot
            | "BitClear" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `BitClear
            | "And" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `And
            | "Or" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Or
            | "Xor" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Xor
            | "Not" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Not
            | "Eq" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Eq
            | "NotEq" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `NotEq
            | "PhysEq" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PhysEq
            | "NotPhysEq" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `NotPhysEq
            | "Lt" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Lt
            | "LtE" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `LtE
            | "Gt" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Gt
            | "GtE" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `GtE
            | "Cmp" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Cmp
            | "Concat" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Concat
            | "Append" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Append
            | "RegexpMatch" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `RegexpMatch
            | "NotMatch" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `NotMatch
            | "Range" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Range
            | "RangeInclusive" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `RangeInclusive
            | "NotNullPostfix" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `NotNullPostfix
            | "Length" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Length
            | "Elvis" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Elvis
            | "Nullish" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Nullish
            | "In" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `In
            | "NotIn" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `NotIn
            | "Is" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Is
            | "NotIs" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `NotIs
            | "Background" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Background
            | "Pipe" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Pipe
            | "LDA" -> 
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `LDA
            | "RDA" -> 
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `RDA
            | "LSA" -> 
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `LSA
            | "RSA" -> 
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `RSA
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "Plus" ->
              `Plus
            | "Minus" ->
              `Minus
            | "Mult" ->
              `Mult
            | "Div" ->
              `Div
            | "Mod" ->
              `Mod
            | "Pow" ->
              `Pow
            | "FloorDiv" ->
              `FloorDiv
            | "MatMult" ->
              `MatMult
            | "LSL" ->
              `LSL
            | "LSR" ->
              `LSR
            | "ASR" ->
              `ASR
            | "BitOr" ->
              `BitOr
            | "BitXor" ->
              `BitXor
            | "BitAnd" ->
              `BitAnd
            | "BitNot" ->
              `BitNot
            | "BitClear" ->
              `BitClear
            | "And" ->
              `And
            | "Or" ->
              `Or
            | "Xor" ->
              `Xor
            | "Not" ->
              `Not
            | "Eq" ->
              `Eq
            | "NotEq" ->
              `NotEq
            | "PhysEq" ->
              `PhysEq
            | "NotPhysEq" ->
              `NotPhysEq
            | "Lt" ->
              `Lt
            | "LtE" ->
              `LtE
            | "Gt" ->
              `Gt
            | "GtE" ->
              `GtE
            | "Cmp" ->
              `Cmp
            | "Concat" ->
              `Concat
            | "Append" ->
              `Append
            | "RegexpMatch" ->
              `RegexpMatch
            | "NotMatch" ->
              `NotMatch
            | "Range" ->
              `Range
            | "RangeInclusive" ->
              `RangeInclusive
            | "NotNullPostfix" ->
              `NotNullPostfix
            | "Length" ->
              `Length
            | "Elvis" ->
              `Elvis
            | "Nullish" ->
              `Nullish
            | "In" ->
              `In
            | "NotIn" ->
              `NotIn
            | "Is" ->
              `Is
            | "NotIs" ->
              `NotIs
            | "Background" ->
              `Background
            | "LDA" ->
              `LDA
            | "RDA" ->
              `RDA
            | "LSA" ->
              `LSA
            | "RSA" ->
              `RSA
            | "Pipe" ->
              `Pipe
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let operator_of_string s =
  read_operator (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_prefix_postfix = (
  fun ob x ->
    match x with
      | `Prefix -> Buffer.add_string ob "\"Prefix\""
      | `Postfix -> Buffer.add_string ob "\"Postfix\""
)
let string_of_prefix_postfix ?(len = 1024) x =
  let ob = Buffer.create len in
  write_prefix_postfix ob x;
  Buffer.contents ob
let read_prefix_postfix = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Prefix" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Prefix
            | "Postfix" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Postfix
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "Prefix" ->
              `Prefix
            | "Postfix" ->
              `Postfix
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let prefix_postfix_of_string s =
  read_prefix_postfix (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_sid = (
  Yojson.Safe.write_int
)
let string_of_sid ?(len = 1024) x =
  let ob = Buffer.create len in
  write_sid ob x;
  Buffer.contents ob
let read_sid = (
  Atdgen_runtime.Oj_run.read_int
)
let sid_of_string s =
  read_sid (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_special = (
  fun ob x ->
    match x with
      | `This -> Buffer.add_string ob "\"This\""
      | `Super -> Buffer.add_string ob "\"Super\""
      | `Self -> Buffer.add_string ob "\"Self\""
      | `Parent -> Buffer.add_string ob "\"Parent\""
      | `Eval -> Buffer.add_string ob "\"Eval\""
      | `Typeof -> Buffer.add_string ob "\"Typeof\""
      | `Instanceof -> Buffer.add_string ob "\"Instanceof\""
      | `Sizeof -> Buffer.add_string ob "\"Sizeof\""
      | `Defined -> Buffer.add_string ob "\"Defined\""
      | `ConcatString x ->
        Buffer.add_string ob "[\"ConcatString\",";
        (
          write_concat_string_kind
        ) ob x;
        Buffer.add_char ob ']'
      | `EncodedString x ->
        Buffer.add_string ob "[\"EncodedString\",";
        (
          Yojson.Safe.write_string
        ) ob x;
        Buffer.add_char ob ']'
      | `InterpolatedElement -> Buffer.add_string ob "\"InterpolatedElement\""
      | `Spread -> Buffer.add_string ob "\"Spread\""
      | `HashSplat -> Buffer.add_string ob "\"HashSplat\""
      | `ForOf -> Buffer.add_string ob "\"ForOf\""
      | `Op x ->
        Buffer.add_string ob "[\"Op\",";
        (
          write_operator
        ) ob x;
        Buffer.add_char ob ']'
      | `IncrDecr x ->
        Buffer.add_string ob "[\"IncrDecr\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_incr_decr
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_prefix_postfix
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Require -> Buffer.add_string ob "\"Require\""
      | `OtherSpecial x ->
        Buffer.add_string ob "[\"OtherSpecial\",";
        (
          Yojson.Safe.write_string
        ) ob x;
        Buffer.add_char ob ']'
)
let string_of_special ?(len = 1024) x =
  let ob = Buffer.create len in
  write_special ob x;
  Buffer.contents ob
let read_special = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "This" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `This
            | "Super" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Super
            | "Self" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Self
            | "Parent" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Parent
            | "Eval" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Eval
            | "Typeof" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Typeof
            | "Instanceof" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Instanceof
            | "Sizeof" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Sizeof
            | "Defined" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Defined
            | "ConcatString" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_concat_string_kind
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ConcatString x
            | "EncodedString" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `EncodedString x
            | "InterpolatedElement" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `InterpolatedElement
            | "Spread" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Spread
            | "HashSplat" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `HashSplat
            | "ForOf" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ForOf
            | "Op" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_operator
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Op x
            | "IncrDecr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_incr_decr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_prefix_postfix
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `IncrDecr x
            | "Require" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Require
            | "OtherSpecial" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherSpecial x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "This" ->
              `This
            | "Super" ->
              `Super
            | "Self" ->
              `Self
            | "Parent" ->
              `Parent
            | "Eval" ->
              `Eval
            | "Typeof" ->
              `Typeof
            | "Instanceof" ->
              `Instanceof
            | "Sizeof" ->
              `Sizeof
            | "Defined" ->
              `Defined
            | "InterpolatedElement" ->
              `InterpolatedElement
            | "Spread" ->
              `Spread
            | "HashSplat" ->
              `HashSplat
            | "ForOf" ->
              `ForOf
            | "Require" ->
              `Require
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "ConcatString" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_concat_string_kind
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ConcatString x
            | "EncodedString" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `EncodedString x
            | "Op" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_operator
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Op x
            | "IncrDecr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_incr_decr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_prefix_postfix
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `IncrDecr x
            | "OtherSpecial" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherSpecial x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let special_of_string s =
  read_special (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_token_location : _ -> token_location -> _ = (
  fun ob (x : token_location) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"str\":";
    (
      Yojson.Safe.write_string
    )
      ob x.str;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"charpos\":";
    (
      Yojson.Safe.write_int
    )
      ob x.charpos;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"line\":";
    (
      Yojson.Safe.write_int
    )
      ob x.line;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"column\":";
    (
      Yojson.Safe.write_int
    )
      ob x.column;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"filename\":";
    (
      Yojson.Safe.write_string
    )
      ob x.filename;
    Buffer.add_char ob '}';
)
let string_of_token_location ?(len = 1024) x =
  let ob = Buffer.create len in
  write_token_location ob x;
  Buffer.contents ob
let read_token_location = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_str = ref (None) in
    let field_charpos = ref (None) in
    let field_line = ref (None) in
    let field_column = ref (None) in
    let field_filename = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 3 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'r' then (
                  0
                )
                else (
                  -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                  2
                )
                else (
                  -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'n' then (
                  3
                )
                else (
                  -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' then (
                  4
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_str := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_charpos := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 2 ->
            field_line := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 3 ->
            field_column := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_int
                ) p lb
              )
            );
          | 4 ->
            field_filename := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'r' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'l' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'e' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'n' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'h' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_str := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_charpos := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 2 ->
              field_line := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 3 ->
              field_column := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 4 ->
              field_filename := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            str = (match !field_str with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "str");
            charpos = (match !field_charpos with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "charpos");
            line = (match !field_line with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "line");
            column = (match !field_column with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "column");
            filename = (match !field_filename with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "filename");
          }
         : token_location)
      )
)
let token_location_of_string s =
  read_token_location (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_token = (
  fun ob x ->
    match x with
      | `OriginTok x ->
        Buffer.add_string ob "[\"OriginTok\",";
        (
          write_token_location
        ) ob x;
        Buffer.add_char ob ']'
      | `FakeTok x ->
        Buffer.add_string ob "[\"FakeTok\",";
        (
          Yojson.Safe.write_string
        ) ob x;
        Buffer.add_char ob ']'
)
let string_of_token ?(len = 1024) x =
  let ob = Buffer.create len in
  write_token ob x;
  Buffer.contents ob
let read_token = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "OriginTok" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_token_location
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OriginTok x
            | "FakeTok" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `FakeTok x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "OriginTok" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_token_location
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OriginTok x
            | "FakeTok" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `FakeTok x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let token_of_string s =
  read_token (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_tok = (
  write_token
)
let string_of_tok ?(len = 1024) x =
  let ob = Buffer.create len in
  write_tok ob x;
  Buffer.contents ob
let read_tok = (
  read_token
)
let tok_of_string s =
  read_tok (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__bool_wrap = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      Yojson.Safe.write_bool
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of__bool_wrap ?(len = 1024) x =
  let ob = Buffer.create len in
  write__bool_wrap ob x;
  Buffer.contents ob
let read__bool_wrap = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            Atdgen_runtime.Oj_run.read_bool
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
let _bool_wrap_of_string s =
  read__bool_wrap (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__class_kind_wrap = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write_class_kind
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of__class_kind_wrap ?(len = 1024) x =
  let ob = Buffer.create len in
  write__class_kind_wrap ob x;
  Buffer.contents ob
let read__class_kind_wrap = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_class_kind
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
let _class_kind_wrap_of_string s =
  read__class_kind_wrap (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__float_nullable_wrap = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write__float_nullable
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of__float_nullable_wrap ?(len = 1024) x =
  let ob = Buffer.create len in
  write__float_nullable_wrap ob x;
  Buffer.contents ob
let read__float_nullable_wrap = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read__float_nullable
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
let _float_nullable_wrap_of_string s =
  read__float_nullable_wrap (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__function_kind_wrap = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write_function_kind
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of__function_kind_wrap ?(len = 1024) x =
  let ob = Buffer.create len in
  write__function_kind_wrap ob x;
  Buffer.contents ob
let read__function_kind_wrap = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_function_kind
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
let _function_kind_wrap_of_string s =
  read__function_kind_wrap (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__int_wrap = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      Yojson.Safe.write_int
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of__int_wrap ?(len = 1024) x =
  let ob = Buffer.create len in
  write__int_wrap ob x;
  Buffer.contents ob
let read__int_wrap = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            Atdgen_runtime.Oj_run.read_int
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
let _int_wrap_of_string s =
  read__int_wrap (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__keyword_attribute_wrap = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write_keyword_attribute
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of__keyword_attribute_wrap ?(len = 1024) x =
  let ob = Buffer.create len in
  write__keyword_attribute_wrap ob x;
  Buffer.contents ob
let read__keyword_attribute_wrap = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_keyword_attribute
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
let _keyword_attribute_wrap_of_string s =
  read__keyword_attribute_wrap (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__operator_wrap = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write_operator
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of__operator_wrap ?(len = 1024) x =
  let ob = Buffer.create len in
  write__operator_wrap ob x;
  Buffer.contents ob
let read__operator_wrap = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_operator
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
let _operator_wrap_of_string s =
  read__operator_wrap (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__special_wrap = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write_special
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of__special_wrap ?(len = 1024) x =
  let ob = Buffer.create len in
  write__special_wrap ob x;
  Buffer.contents ob
let read__special_wrap = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_special
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
let _special_wrap_of_string s =
  read__special_wrap (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__string_wrap = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      Yojson.Safe.write_string
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of__string_wrap ?(len = 1024) x =
  let ob = Buffer.create len in
  write__string_wrap ob x;
  Buffer.contents ob
let read__string_wrap = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            Atdgen_runtime.Oj_run.read_string
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
let _string_wrap_of_string s =
  read__string_wrap (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__string_wrap_bracket = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      write__string_wrap
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of__string_wrap_bracket ?(len = 1024) x =
  let ob = Buffer.create len in
  write__string_wrap_bracket ob x;
  Buffer.contents ob
let read__string_wrap_bracket = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read__string_wrap
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
let _string_wrap_bracket_of_string s =
  read__string_wrap_bracket (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__string_wrap_nullable = (
  Atdgen_runtime.Oj_run.write_nullable (
    write__string_wrap
  )
)
let string_of__string_wrap_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__string_wrap_nullable ob x;
  Buffer.contents ob
let read__string_wrap_nullable = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read__string_wrap
    ) p lb) : _ option)
)
let _string_wrap_nullable_of_string s =
  read__string_wrap_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__tok_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_tok
  )
)
let string_of__tok_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__tok_option ob x;
  Buffer.contents ob
let read__tok_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _tok_option_of_string s =
  read__tok_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__x_b40703a = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write__x_71cb4bf
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of__x_b40703a ?(len = 1024) x =
  let ob = Buffer.create len in
  write__x_b40703a ob x;
  Buffer.contents ob
let read__x_b40703a = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read__x_71cb4bf
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
let _x_b40703a_of_string s =
  read__x_b40703a (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_ident = (
  write__string_wrap
)
let string_of_ident ?(len = 1024) x =
  let ob = Buffer.create len in
  write_ident ob x;
  Buffer.contents ob
let read_ident = (
  read__string_wrap
)
let ident_of_string s =
  read_ident (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__ident_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_ident
  )
)
let string_of__ident_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__ident_list ob x;
  Buffer.contents ob
let read__ident_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_ident
  )
)
let _ident_list_of_string s =
  read__ident_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__ident_nullable = (
  Atdgen_runtime.Oj_run.write_nullable (
    write_ident
  )
)
let string_of__ident_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__ident_nullable ob x;
  Buffer.contents ob
let read__ident_nullable = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read_ident
    ) p lb) : _ option)
)
let _ident_nullable_of_string s =
  read__ident_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_dotted_ident = (
  write__ident_list
)
let string_of_dotted_ident ?(len = 1024) x =
  let ob = Buffer.create len in
  write_dotted_ident ob x;
  Buffer.contents ob
let read_dotted_ident = (
  read__ident_list
)
let dotted_ident_of_string s =
  read_dotted_ident (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__dotted_ident_nullable = (
  Atdgen_runtime.Oj_run.write_nullable (
    write_dotted_ident
  )
)
let string_of__dotted_ident_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__dotted_ident_nullable ob x;
  Buffer.contents ob
let read__dotted_ident_nullable = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read_dotted_ident
    ) p lb) : _ option)
)
let _dotted_ident_nullable_of_string s =
  read__dotted_ident_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_label = (
  write_ident
)
let string_of_label ?(len = 1024) x =
  let ob = Buffer.create len in
  write_label ob x;
  Buffer.contents ob
let read_label = (
  read_ident
)
let label_of_string s =
  read_label (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_literal = (
  fun ob x ->
    match x with
      | `Bool x ->
        Buffer.add_string ob "[\"Bool\",";
        (
          write__bool_wrap
        ) ob x;
        Buffer.add_char ob ']'
      | `Int x ->
        Buffer.add_string ob "[\"Int\",";
        (
          write__x_b40703a
        ) ob x;
        Buffer.add_char ob ']'
      | `Float x ->
        Buffer.add_string ob "[\"Float\",";
        (
          write__float_nullable_wrap
        ) ob x;
        Buffer.add_char ob ']'
      | `Char x ->
        Buffer.add_string ob "[\"Char\",";
        (
          write__string_wrap
        ) ob x;
        Buffer.add_char ob ']'
      | `String x ->
        Buffer.add_string ob "[\"String\",";
        (
          write__string_wrap
        ) ob x;
        Buffer.add_char ob ']'
      | `Regexp x ->
        Buffer.add_string ob "[\"Regexp\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write__string_wrap_bracket
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__string_wrap_nullable
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Atom x ->
        Buffer.add_string ob "[\"Atom\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__string_wrap
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Unit x ->
        Buffer.add_string ob "[\"Unit\",";
        (
          write_tok
        ) ob x;
        Buffer.add_char ob ']'
      | `Null x ->
        Buffer.add_string ob "[\"Null\",";
        (
          write_tok
        ) ob x;
        Buffer.add_char ob ']'
      | `Undefined x ->
        Buffer.add_string ob "[\"Undefined\",";
        (
          write_tok
        ) ob x;
        Buffer.add_char ob ']'
      | `Imag x ->
        Buffer.add_string ob "[\"Imag\",";
        (
          write__string_wrap
        ) ob x;
        Buffer.add_char ob ']'
      | `Ratio x ->
        Buffer.add_string ob "[\"Ratio\",";
        (
          write__string_wrap
        ) ob x;
        Buffer.add_char ob ']'
)
let string_of_literal ?(len = 1024) x =
  let ob = Buffer.create len in
  write_literal ob x;
  Buffer.contents ob
let read_literal = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Bool" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__bool_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Bool x
            | "Int" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__x_b40703a
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Int x
            | "Float" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__float_nullable_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Float x
            | "Char" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__string_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Char x
            | "String" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__string_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `String x
            | "Regexp" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__string_wrap_bracket
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__string_wrap_nullable
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Regexp x
            | "Atom" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__string_wrap
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Atom x
            | "Unit" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Unit x
            | "Null" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Null x
            | "Undefined" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Undefined x
            | "Imag" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__string_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Imag x
            | "Ratio" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__string_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Ratio x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Bool" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__bool_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Bool x
            | "Int" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__x_b40703a
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Int x
            | "Float" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__float_nullable_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Float x
            | "Char" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__string_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Char x
            | "String" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__string_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `String x
            | "Regexp" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__string_wrap_bracket
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__string_wrap_nullable
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Regexp x
            | "Atom" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__string_wrap
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Atom x
            | "Unit" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Unit x
            | "Null" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Null x
            | "Undefined" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Undefined x
            | "Imag" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__string_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Imag x
            | "Ratio" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__string_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Ratio x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let literal_of_string s =
  read_literal (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_module_name = (
  fun ob x ->
    match x with
      | `DottedName x ->
        Buffer.add_string ob "[\"DottedName\",";
        (
          write_dotted_ident
        ) ob x;
        Buffer.add_char ob ']'
      | `FileName x ->
        Buffer.add_string ob "[\"FileName\",";
        (
          write__string_wrap
        ) ob x;
        Buffer.add_char ob ']'
)
let string_of_module_name ?(len = 1024) x =
  let ob = Buffer.create len in
  write_module_name ob x;
  Buffer.contents ob
let read_module_name = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "DottedName" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_dotted_ident
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `DottedName x
            | "FileName" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__string_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `FileName x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "DottedName" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_dotted_ident
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `DottedName x
            | "FileName" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__string_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `FileName x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let module_name_of_string s =
  read_module_name (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_resolved_name_kind = (
  fun ob x ->
    match x with
      | `Global -> Buffer.add_string ob "\"Global\""
      | `Local -> Buffer.add_string ob "\"Local\""
      | `Param -> Buffer.add_string ob "\"Param\""
      | `ImportedEntity x ->
        Buffer.add_string ob "[\"ImportedEntity\",";
        (
          write_dotted_ident
        ) ob x;
        Buffer.add_char ob ']'
      | `ImportedModule x ->
        Buffer.add_string ob "[\"ImportedModule\",";
        (
          write_module_name
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherResolvedNameKind x ->
        Buffer.add_string ob "[\"OtherResolvedNameKind\",";
        (
          Yojson.Safe.write_string
        ) ob x;
        Buffer.add_char ob ']'
)
let string_of_resolved_name_kind ?(len = 1024) x =
  let ob = Buffer.create len in
  write_resolved_name_kind ob x;
  Buffer.contents ob
let read_resolved_name_kind = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Global" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Global
            | "Local" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Local
            | "Param" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Param
            | "ImportedEntity" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_dotted_ident
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ImportedEntity x
            | "ImportedModule" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_module_name
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ImportedModule x
            | "OtherResolvedNameKind" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherResolvedNameKind x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "Global" ->
              `Global
            | "Local" ->
              `Local
            | "Param" ->
              `Param
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "ImportedEntity" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_dotted_ident
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ImportedEntity x
            | "ImportedModule" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_module_name
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ImportedModule x
            | "OtherResolvedNameKind" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherResolvedNameKind x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let resolved_name_kind_of_string s =
  read_resolved_name_kind (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_resolved_name = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write_resolved_name_kind
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_sid
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of_resolved_name ?(len = 1024) x =
  let ob = Buffer.create len in
  write_resolved_name ob x;
  Buffer.contents ob
let read_resolved_name = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_resolved_name_kind
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_sid
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
let resolved_name_of_string s =
  read_resolved_name (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__resolved_name_option = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_resolved_name
  )
)
let string_of__resolved_name_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__resolved_name_option ob x;
  Buffer.contents ob
let read__resolved_name_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_resolved_name
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_resolved_name
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let _resolved_name_option_of_string s =
  read__resolved_name_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_sc = (
  write_tok
)
let string_of_sc ?(len = 1024) x =
  let ob = Buffer.create len in
  write_sc ob x;
  Buffer.contents ob
let read_sc = (
  read_tok
)
let sc_of_string s =
  read_sc (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_todo_kind = (
  write__string_wrap
)
let string_of_todo_kind ?(len = 1024) x =
  let ob = Buffer.create len in
  write_todo_kind ob x;
  Buffer.contents ob
let read_todo_kind = (
  read__string_wrap
)
let todo_kind_of_string s =
  read_todo_kind (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_variance = (
  fun ob x ->
    match x with
      | `Covariant -> Buffer.add_string ob "\"Covariant\""
      | `Contravariant -> Buffer.add_string ob "\"Contravariant\""
)
let string_of_variance ?(len = 1024) x =
  let ob = Buffer.create len in
  write_variance ob x;
  Buffer.contents ob
let read_variance = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Covariant" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Covariant
            | "Contravariant" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Contravariant
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "Covariant" ->
              `Covariant
            | "Contravariant" ->
              `Contravariant
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let variance_of_string s =
  read_variance (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__variance_wrap = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write_variance
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of__variance_wrap ?(len = 1024) x =
  let ob = Buffer.create len in
  write__variance_wrap ob x;
  Buffer.contents ob
let read__variance_wrap = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_variance
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
let _variance_wrap_of_string s =
  read__variance_wrap (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__variance_wrap_nullable = (
  Atdgen_runtime.Oj_run.write_nullable (
    write__variance_wrap
  )
)
let string_of__variance_wrap_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__variance_wrap_nullable ob x;
  Buffer.contents ob
let read__variance_wrap_nullable = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read__variance_wrap
    ) p lb) : _ option)
)
let _variance_wrap_nullable_of_string s =
  read__variance_wrap_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_xml_kind = (
  fun ob x ->
    match x with
      | `XmlClassic x ->
        Buffer.add_string ob "[\"XmlClassic\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _, _ = x in
            (
              write_ident
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, _, x = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `XmlSingleton x ->
        Buffer.add_string ob "[\"XmlSingleton\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_ident
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `XmlFragment x ->
        Buffer.add_string ob "[\"XmlFragment\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
let string_of_xml_kind ?(len = 1024) x =
  let ob = Buffer.create len in
  write_xml_kind ob x;
  Buffer.contents ob
let read_xml_kind = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "XmlClassic" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x3 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2, x3)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2; 3 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `XmlClassic x
            | "XmlSingleton" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `XmlSingleton x
            | "XmlFragment" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `XmlFragment x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "XmlClassic" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x3 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2, x3)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2; 3 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `XmlClassic x
            | "XmlSingleton" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `XmlSingleton x
            | "XmlFragment" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `XmlFragment x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
let xml_kind_of_string s =
  read_xml_kind (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let rec write__alias_nullable ob x = (
  Atdgen_runtime.Oj_run.write_nullable (
    write_alias
  )
) ob x
and string_of__alias_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__alias_nullable ob x;
  Buffer.contents ob
and write__any_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_any
  )
) ob x
and string_of__any_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__any_list ob x;
  Buffer.contents ob
and write__argument_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_argument
  )
) ob x
and string_of__argument_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__argument_list ob x;
  Buffer.contents ob
and write__argument_list_bracket = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      write__argument_list
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of__argument_list_bracket ?(len = 1024) x =
  let ob = Buffer.create len in
  write__argument_list_bracket ob x;
  Buffer.contents ob
and write__arguments_nullable ob x = (
  Atdgen_runtime.Oj_run.write_nullable (
    write_arguments
  )
) ob x
and string_of__arguments_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__arguments_nullable ob x;
  Buffer.contents ob
and write__attribute_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_attribute
  )
) ob x
and string_of__attribute_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__attribute_list ob x;
  Buffer.contents ob
and write__bool_wrap_type_nullable ob x = (
  Atdgen_runtime.Oj_run.write_nullable (
    fun ob x ->
      Buffer.add_char ob '[';
      (let x, _ = x in
      (
        write__bool_wrap
      ) ob x
      );
      Buffer.add_char ob ',';
      (let _, x = x in
      (
        write_type_
      ) ob x
      );
      Buffer.add_char ob ']';
  )
) ob x
and string_of__bool_wrap_type_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__bool_wrap_type_nullable ob x;
  Buffer.contents ob
and write__bracket_0ecc50b = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      fun ob x ->
        Buffer.add_char ob '[';
        (let x, _, _ = x in
        (
          write__expr_nullable
        ) ob x
        );
        Buffer.add_char ob ',';
        (let _, x, _ = x in
        (
          write__expr_nullable
        ) ob x
        );
        Buffer.add_char ob ',';
        (let _, _, x = x in
        (
          write__expr_nullable
        ) ob x
        );
        Buffer.add_char ob ']';
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of__bracket_0ecc50b ?(len = 1024) x =
  let ob = Buffer.create len in
  write__bracket_0ecc50b ob x;
  Buffer.contents ob
and write__case_and_body_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_case_and_body
  )
) ob x
and string_of__case_and_body_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__case_and_body_list ob x;
  Buffer.contents ob
and write__case_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_case
  )
) ob x
and string_of__case_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__case_list ob x;
  Buffer.contents ob
and write__catch_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_catch
  )
) ob x
and string_of__catch_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__catch_list ob x;
  Buffer.contents ob
and write__class_parent_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_class_parent
  )
) ob x
and string_of__class_parent_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__class_parent_list ob x;
  Buffer.contents ob
and write__comprehension_bracket = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      write_comprehension
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of__comprehension_bracket ?(len = 1024) x =
  let ob = Buffer.create len in
  write__comprehension_bracket ob x;
  Buffer.contents ob
and write__condition_nullable ob x = (
  Atdgen_runtime.Oj_run.write_nullable (
    write_condition
  )
) ob x
and string_of__condition_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__condition_nullable ob x;
  Buffer.contents ob
and write__dotted_ident_pattern_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    fun ob x ->
      Buffer.add_char ob '[';
      (let x, _ = x in
      (
        write_dotted_ident
      ) ob x
      );
      Buffer.add_char ob ',';
      (let _, x = x in
      (
        write_pattern
      ) ob x
      );
      Buffer.add_char ob ']';
  )
) ob x
and string_of__dotted_ident_pattern_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__dotted_ident_pattern_list ob x;
  Buffer.contents ob
and write__dotted_ident_pattern_list_bracket = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      write__dotted_ident_pattern_list
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of__dotted_ident_pattern_list_bracket ?(len = 1024) x =
  let ob = Buffer.create len in
  write__dotted_ident_pattern_list_bracket ob x;
  Buffer.contents ob
and write__expr_bracket = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      write_expr
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of__expr_bracket ?(len = 1024) x =
  let ob = Buffer.create len in
  write__expr_bracket ob x;
  Buffer.contents ob
and write__expr_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_expr
  )
) ob x
and string_of__expr_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__expr_list ob x;
  Buffer.contents ob
and write__expr_list_bracket = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      write__expr_list
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of__expr_list_bracket ?(len = 1024) x =
  let ob = Buffer.create len in
  write__expr_list_bracket ob x;
  Buffer.contents ob
and write__expr_nullable ob x = (
  Atdgen_runtime.Oj_run.write_nullable (
    write_expr
  )
) ob x
and string_of__expr_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__expr_nullable ob x;
  Buffer.contents ob
and write__expr_nullable_bracket = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      write__expr_nullable
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of__expr_nullable_bracket ?(len = 1024) x =
  let ob = Buffer.create len in
  write__expr_nullable_bracket ob x;
  Buffer.contents ob
and write__expr_option ob x = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_expr
  )
) ob x
and string_of__expr_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__expr_option ob x;
  Buffer.contents ob
and write__field_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_field
  )
) ob x
and string_of__field_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__field_list ob x;
  Buffer.contents ob
and write__field_list_bracket = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      write__field_list
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of__field_list_bracket ?(len = 1024) x =
  let ob = Buffer.create len in
  write__field_list_bracket ob x;
  Buffer.contents ob
and write__field_list_bracket_nullable ob x = (
  Atdgen_runtime.Oj_run.write_nullable (
    write__field_list_bracket
  )
) ob x
and string_of__field_list_bracket_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__field_list_bracket_nullable ob x;
  Buffer.contents ob
and write__finally_nullable ob x = (
  Atdgen_runtime.Oj_run.write_nullable (
    write_finally
  )
) ob x
and string_of__finally_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__finally_nullable ob x;
  Buffer.contents ob
and write__for_or_if_comp_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_for_or_if_comp
  )
) ob x
and string_of__for_or_if_comp_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__for_or_if_comp_list ob x;
  Buffer.contents ob
and write__for_var_or_expr_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_for_var_or_expr
  )
) ob x
and string_of__for_var_or_expr_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__for_var_or_expr_list ob x;
  Buffer.contents ob
and write__ident_alias_nullable_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    fun ob x ->
      Buffer.add_char ob '[';
      (let x, _ = x in
      (
        write_ident
      ) ob x
      );
      Buffer.add_char ob ',';
      (let _, x = x in
      (
        write__alias_nullable
      ) ob x
      );
      Buffer.add_char ob ']';
  )
) ob x
and string_of__ident_alias_nullable_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__ident_alias_nullable_list ob x;
  Buffer.contents ob
and write__ident_type_arguments_nullable_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    fun ob x ->
      Buffer.add_char ob '[';
      (let x, _ = x in
      (
        write_ident
      ) ob x
      );
      Buffer.add_char ob ',';
      (let _, x = x in
      (
        write__type_arguments_nullable
      ) ob x
      );
      Buffer.add_char ob ']';
  )
) ob x
and string_of__ident_type_arguments_nullable_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__ident_type_arguments_nullable_list ob x;
  Buffer.contents ob
and write__item_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_item
  )
) ob x
and string_of__item_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__item_list ob x;
  Buffer.contents ob
and write__multi_for_each_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_multi_for_each
  )
) ob x
and string_of__multi_for_each_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__multi_for_each_list ob x;
  Buffer.contents ob
and write__or_type_element_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_or_type_element
  )
) ob x
and string_of__or_type_element_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__or_type_element_list ob x;
  Buffer.contents ob
and write__parameter_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_parameter
  )
) ob x
and string_of__parameter_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__parameter_list ob x;
  Buffer.contents ob
and write__pattern_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_pattern
  )
) ob x
and string_of__pattern_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__pattern_list ob x;
  Buffer.contents ob
and write__pattern_list_bracket = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      write__pattern_list
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of__pattern_list_bracket ?(len = 1024) x =
  let ob = Buffer.create len in
  write__pattern_list_bracket ob x;
  Buffer.contents ob
and write__qualifier_option ob x = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_qualifier
  )
) ob x
and string_of__qualifier_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__qualifier_option ob x;
  Buffer.contents ob
and write__stmt_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_stmt
  )
) ob x
and string_of__stmt_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__stmt_list ob x;
  Buffer.contents ob
and write__stmt_list_bracket = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      write__stmt_list
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of__stmt_list_bracket ?(len = 1024) x =
  let ob = Buffer.create len in
  write__stmt_list_bracket ob x;
  Buffer.contents ob
and write__stmt_nullable ob x = (
  Atdgen_runtime.Oj_run.write_nullable (
    write_stmt
  )
) ob x
and string_of__stmt_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__stmt_nullable ob x;
  Buffer.contents ob
and write__svalue_option ob x = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_svalue
  )
) ob x
and string_of__svalue_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__svalue_option ob x;
  Buffer.contents ob
and write__type_argument_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_type_argument
  )
) ob x
and string_of__type_argument_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__type_argument_list ob x;
  Buffer.contents ob
and write__type_argument_list_bracket = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      write__type_argument_list
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of__type_argument_list_bracket ?(len = 1024) x =
  let ob = Buffer.create len in
  write__type_argument_list_bracket ob x;
  Buffer.contents ob
and write__type_arguments_nullable ob x = (
  Atdgen_runtime.Oj_run.write_nullable (
    write_type_arguments
  )
) ob x
and string_of__type_arguments_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__type_arguments_nullable ob x;
  Buffer.contents ob
and write__type_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_type_
  )
) ob x
and string_of__type_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__type_list ob x;
  Buffer.contents ob
and write__type_list_bracket = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      write__type_list
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of__type_list_bracket ?(len = 1024) x =
  let ob = Buffer.create len in
  write__type_list_bracket ob x;
  Buffer.contents ob
and write__type_nullable ob x = (
  Atdgen_runtime.Oj_run.write_nullable (
    write_type_
  )
) ob x
and string_of__type_nullable ?(len = 1024) x =
  let ob = Buffer.create len in
  write__type_nullable ob x;
  Buffer.contents ob
and write__type_option ob x = (
  Atdgen_runtime.Oj_run.write_std_option (
    write_type_
  )
) ob x
and string_of__type_option ?(len = 1024) x =
  let ob = Buffer.create len in
  write__type_option ob x;
  Buffer.contents ob
and write__type_parameter_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_type_parameter
  )
) ob x
and string_of__type_parameter_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__type_parameter_list ob x;
  Buffer.contents ob
and write__xml_attribute_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_xml_attribute
  )
) ob x
and string_of__xml_attribute_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__xml_attribute_list ob x;
  Buffer.contents ob
and write__xml_body_list ob x = (
  Atdgen_runtime.Oj_run.write_list (
    write_xml_body
  )
) ob x
and string_of__xml_body_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__xml_body_list ob x;
  Buffer.contents ob
and write_alias = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write_ident
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_id_info
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of_alias ?(len = 1024) x =
  let ob = Buffer.create len in
  write_alias ob x;
  Buffer.contents ob
and write_any = (
  fun ob x ->
    match x with
      | `E x ->
        Buffer.add_string ob "[\"E\",";
        (
          write_expr
        ) ob x;
        Buffer.add_char ob ']'
      | `S x ->
        Buffer.add_string ob "[\"S\",";
        (
          write_stmt
        ) ob x;
        Buffer.add_char ob ']'
      | `T x ->
        Buffer.add_string ob "[\"T\",";
        (
          write_type_
        ) ob x;
        Buffer.add_char ob ']'
      | `P x ->
        Buffer.add_string ob "[\"P\",";
        (
          write_pattern
        ) ob x;
        Buffer.add_char ob ']'
      | `At x ->
        Buffer.add_string ob "[\"At\",";
        (
          write_attribute
        ) ob x;
        Buffer.add_char ob ']'
      | `Fld x ->
        Buffer.add_string ob "[\"Fld\",";
        (
          write_field
        ) ob x;
        Buffer.add_char ob ']'
      | `Ar x ->
        Buffer.add_string ob "[\"Ar\",";
        (
          write_argument
        ) ob x;
        Buffer.add_char ob ']'
      | `Pa x ->
        Buffer.add_string ob "[\"Pa\",";
        (
          write_parameter
        ) ob x;
        Buffer.add_char ob ']'
      | `Ta x ->
        Buffer.add_string ob "[\"Ta\",";
        (
          write_type_argument
        ) ob x;
        Buffer.add_char ob ']'
      | `Tp x ->
        Buffer.add_string ob "[\"Tp\",";
        (
          write_type_parameter
        ) ob x;
        Buffer.add_char ob ']'
      | `Ce x ->
        Buffer.add_string ob "[\"Ce\",";
        (
          write_catch_exn
        ) ob x;
        Buffer.add_char ob ']'
      | `Cs x ->
        Buffer.add_string ob "[\"Cs\",";
        (
          write_case
        ) ob x;
        Buffer.add_char ob ']'
      | `ForOrIfComp x ->
        Buffer.add_string ob "[\"ForOrIfComp\",";
        (
          write_for_or_if_comp
        ) ob x;
        Buffer.add_char ob ']'
      | `En x ->
        Buffer.add_string ob "[\"En\",";
        (
          write_entity
        ) ob x;
        Buffer.add_char ob ']'
      | `I x ->
        Buffer.add_string ob "[\"I\",";
        (
          write_ident
        ) ob x;
        Buffer.add_char ob ']'
      | `Modn x ->
        Buffer.add_string ob "[\"Modn\",";
        (
          write_module_name
        ) ob x;
        Buffer.add_char ob ']'
      | `Di x ->
        Buffer.add_string ob "[\"Di\",";
        (
          write_dotted_ident
        ) ob x;
        Buffer.add_char ob ']'
      | `Lbli x ->
        Buffer.add_string ob "[\"Lbli\",";
        (
          write_label_ident
        ) ob x;
        Buffer.add_char ob ']'
      | `Str x ->
        Buffer.add_string ob "[\"Str\",";
        (
          write__string_wrap
        ) ob x;
        Buffer.add_char ob ']'
      | `Tk x ->
        Buffer.add_string ob "[\"Tk\",";
        (
          write_tok
        ) ob x;
        Buffer.add_char ob ']'
      | `TodoK x ->
        Buffer.add_string ob "[\"TodoK\",";
        (
          write_todo_kind
        ) ob x;
        Buffer.add_char ob ']'
      | `Anys x ->
        Buffer.add_string ob "[\"Anys\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_any ?(len = 1024) x =
  let ob = Buffer.create len in
  write_any ob x;
  Buffer.contents ob
and write_argument = (
  fun ob x ->
    match x with
      | `Arg x ->
        Buffer.add_string ob "[\"Arg\",";
        (
          write_expr
        ) ob x;
        Buffer.add_char ob ']'
      | `ArgKwd x ->
        Buffer.add_string ob "[\"ArgKwd\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_ident
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `ArgKwdOptional x ->
        Buffer.add_string ob "[\"ArgKwdOptional\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_ident
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `ArgType x ->
        Buffer.add_string ob "[\"ArgType\",";
        (
          write_type_
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherArg x ->
        Buffer.add_string ob "[\"OtherArg\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_argument ?(len = 1024) x =
  let ob = Buffer.create len in
  write_argument ob x;
  Buffer.contents ob
and write_arguments ob x = (
  write__argument_list_bracket
) ob x
and string_of_arguments ?(len = 1024) x =
  let ob = Buffer.create len in
  write_arguments ob x;
  Buffer.contents ob
and write_attribute = (
  fun ob x ->
    match x with
      | `KeywordAttr x ->
        Buffer.add_string ob "[\"KeywordAttr\",";
        (
          write__keyword_attribute_wrap
        ) ob x;
        Buffer.add_char ob ']'
      | `NamedAttr x ->
        Buffer.add_string ob "[\"NamedAttr\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_name
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_arguments
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherAttribute x ->
        Buffer.add_string ob "[\"OtherAttribute\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_attribute ?(len = 1024) x =
  let ob = Buffer.create len in
  write_attribute ob x;
  Buffer.contents ob
and write_case = (
  fun ob x ->
    match x with
      | `Case x ->
        Buffer.add_string ob "[\"Case\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_pattern
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Default x ->
        Buffer.add_string ob "[\"Default\",";
        (
          write_tok
        ) ob x;
        Buffer.add_char ob ']'
      | `CaseEqualExpr x ->
        Buffer.add_string ob "[\"CaseEqualExpr\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherCase x ->
        Buffer.add_string ob "[\"OtherCase\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_case ?(len = 1024) x =
  let ob = Buffer.create len in
  write_case ob x;
  Buffer.contents ob
and write_case_and_body = (
  fun ob x ->
    match x with
      | `CasesAndBody x ->
        Buffer.add_string ob "[\"CasesAndBody\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write__case_list
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_stmt
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_case_and_body ?(len = 1024) x =
  let ob = Buffer.create len in
  write_case_and_body ob x;
  Buffer.contents ob
and write_catch = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      write_catch_exn
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_stmt
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of_catch ?(len = 1024) x =
  let ob = Buffer.create len in
  write_catch ob x;
  Buffer.contents ob
and write_catch_exn = (
  fun ob x ->
    match x with
      | `CatchPattern x ->
        Buffer.add_string ob "[\"CatchPattern\",";
        (
          write_pattern
        ) ob x;
        Buffer.add_char ob ']'
      | `CatchParam x ->
        Buffer.add_string ob "[\"CatchParam\",";
        (
          write_parameter_classic
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherCatch x ->
        Buffer.add_string ob "[\"OtherCatch\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_catch_exn ?(len = 1024) x =
  let ob = Buffer.create len in
  write_catch_exn ob x;
  Buffer.contents ob
and write_class_definition : _ -> class_definition -> _ = (
  fun ob (x : class_definition) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"ckind\":";
    (
      write__class_kind_wrap
    )
      ob x.ckind;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"cextends\":";
    (
      write__class_parent_list
    )
      ob x.cextends;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"cimplements\":";
    (
      write__type_list
    )
      ob x.cimplements;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"cmixins\":";
    (
      write__type_list
    )
      ob x.cmixins;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"cparams\":";
    (
      write_parameters
    )
      ob x.cparams;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"cbody\":";
    (
      write__field_list_bracket
    )
      ob x.cbody;
    Buffer.add_char ob '}';
)
and string_of_class_definition ?(len = 1024) x =
  let ob = Buffer.create len in
  write_class_definition ob x;
  Buffer.contents ob
and write_class_parent = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write_type_
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write__arguments_nullable
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of_class_parent ?(len = 1024) x =
  let ob = Buffer.create len in
  write_class_parent ob x;
  Buffer.contents ob
and write_comprehension = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write_expr
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write__for_or_if_comp_list
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of_comprehension ?(len = 1024) x =
  let ob = Buffer.create len in
  write_comprehension ob x;
  Buffer.contents ob
and write_condition = (
  fun ob x ->
    match x with
      | `Cond x ->
        Buffer.add_string ob "[\"Cond\",";
        (
          write_expr
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherCond x ->
        Buffer.add_string ob "[\"OtherCond\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_condition ?(len = 1024) x =
  let ob = Buffer.create len in
  write_condition ob x;
  Buffer.contents ob
and write_definition = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write_entity
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_definition_kind
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of_definition ?(len = 1024) x =
  let ob = Buffer.create len in
  write_definition ob x;
  Buffer.contents ob
and write_definition_kind = (
  fun ob x ->
    match x with
      | `FuncDef x ->
        Buffer.add_string ob "[\"FuncDef\",";
        (
          write_function_definition
        ) ob x;
        Buffer.add_char ob ']'
      | `VarDef x ->
        Buffer.add_string ob "[\"VarDef\",";
        (
          write_variable_definition
        ) ob x;
        Buffer.add_char ob ']'
      | `ClassDef x ->
        Buffer.add_string ob "[\"ClassDef\",";
        (
          write_class_definition
        ) ob x;
        Buffer.add_char ob ']'
      | `EnumEntryDef x ->
        Buffer.add_string ob "[\"EnumEntryDef\",";
        (
          write_enum_entry_definition
        ) ob x;
        Buffer.add_char ob ']'
      | `TypeDef x ->
        Buffer.add_string ob "[\"TypeDef\",";
        (
          write_type_definition
        ) ob x;
        Buffer.add_char ob ']'
      | `ModuleDef x ->
        Buffer.add_string ob "[\"ModuleDef\",";
        (
          write_module_definition
        ) ob x;
        Buffer.add_char ob ']'
      | `MacroDef x ->
        Buffer.add_string ob "[\"MacroDef\",";
        (
          write_macro_definition
        ) ob x;
        Buffer.add_char ob ']'
      | `Signature x ->
        Buffer.add_string ob "[\"Signature\",";
        (
          write_type_
        ) ob x;
        Buffer.add_char ob ']'
      | `UseOuterDecl x ->
        Buffer.add_string ob "[\"UseOuterDecl\",";
        (
          write_tok
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherDef x ->
        Buffer.add_string ob "[\"OtherDef\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_definition_kind ?(len = 1024) x =
  let ob = Buffer.create len in
  write_definition_kind ob x;
  Buffer.contents ob
and write_directive = (
  fun ob x ->
    match x with
      | `ImportFrom x ->
        Buffer.add_string ob "[\"ImportFrom\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_module_name
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write__ident_alias_nullable_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `ImportAs x ->
        Buffer.add_string ob "[\"ImportAs\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_module_name
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write__alias_nullable
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `ImportAll x ->
        Buffer.add_string ob "[\"ImportAll\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_module_name
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Package x ->
        Buffer.add_string ob "[\"Package\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_dotted_ident
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `PackageEnd x ->
        Buffer.add_string ob "[\"PackageEnd\",";
        (
          write_tok
        ) ob x;
        Buffer.add_char ob ']'
      | `Pragma x ->
        Buffer.add_string ob "[\"Pragma\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_ident
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherDirective x ->
        Buffer.add_string ob "[\"OtherDirective\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_directive ?(len = 1024) x =
  let ob = Buffer.create len in
  write_directive ob x;
  Buffer.contents ob
and write_entity : _ -> entity -> _ = (
  fun ob (x : entity) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"name\":";
    (
      write_entity_name
    )
      ob x.name;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"attrs\":";
    (
      write__attribute_list
    )
      ob x.attrs;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"tparams\":";
    (
      write_type_parameters
    )
      ob x.tparams;
    Buffer.add_char ob '}';
)
and string_of_entity ?(len = 1024) x =
  let ob = Buffer.create len in
  write_entity ob x;
  Buffer.contents ob
and write_entity_name = (
  fun ob x ->
    match x with
      | `EN x ->
        Buffer.add_string ob "[\"EN\",";
        (
          write_name
        ) ob x;
        Buffer.add_char ob ']'
      | `EDynamic x ->
        Buffer.add_string ob "[\"EDynamic\",";
        (
          write_expr
        ) ob x;
        Buffer.add_char ob ']'
      | `EPattern x ->
        Buffer.add_string ob "[\"EPattern\",";
        (
          write_pattern
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherEntity x ->
        Buffer.add_string ob "[\"OtherEntity\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_entity_name ?(len = 1024) x =
  let ob = Buffer.create len in
  write_entity_name ob x;
  Buffer.contents ob
and write_enum_entry_definition : _ -> enum_entry_definition -> _ = (
  fun ob (x : enum_entry_definition) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"ee_args\":";
    (
      write__arguments_nullable
    )
      ob x.ee_args;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"ee_body\":";
    (
      write__field_list_bracket_nullable
    )
      ob x.ee_body;
    Buffer.add_char ob '}';
)
and string_of_enum_entry_definition ?(len = 1024) x =
  let ob = Buffer.create len in
  write_enum_entry_definition ob x;
  Buffer.contents ob
and write_expr = (
  fun ob x ->
    match x with
      | `L x ->
        Buffer.add_string ob "[\"L\",";
        (
          write_literal
        ) ob x;
        Buffer.add_char ob ']'
      | `Container x ->
        Buffer.add_string ob "[\"Container\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_container_operator
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__expr_list_bracket
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Comprehension x ->
        Buffer.add_string ob "[\"Comprehension\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_container_operator
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__comprehension_bracket
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Record x ->
        Buffer.add_string ob "[\"Record\",";
        (
          write__field_list_bracket
        ) ob x;
        Buffer.add_char ob ']'
      | `Constructor x ->
        Buffer.add_string ob "[\"Constructor\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_name
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__expr_list_bracket
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `N x ->
        Buffer.add_string ob "[\"N\",";
        (
          write_name
        ) ob x;
        Buffer.add_char ob ']'
      | `IdSpecial x ->
        Buffer.add_string ob "[\"IdSpecial\",";
        (
          write__special_wrap
        ) ob x;
        Buffer.add_char ob ']'
      | `Call x ->
        Buffer.add_string ob "[\"Call\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_arguments
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `New x ->
        Buffer.add_string ob "[\"New\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_type_
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_arguments
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Xml x ->
        Buffer.add_string ob "[\"Xml\",";
        (
          write_xml
        ) ob x;
        Buffer.add_char ob ']'
      | `Assign x ->
        Buffer.add_string ob "[\"Assign\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `AssignOp x ->
        Buffer.add_string ob "[\"AssignOp\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write__operator_wrap
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `LetPattern x ->
        Buffer.add_string ob "[\"LetPattern\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_pattern
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `DotAccess x ->
        Buffer.add_string ob "[\"DotAccess\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_field_name
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `ArrayAccess x ->
        Buffer.add_string ob "[\"ArrayAccess\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__expr_bracket
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `SliceAccess x ->
        Buffer.add_string ob "[\"SliceAccess\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__bracket_0ecc50b
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Lambda x ->
        Buffer.add_string ob "[\"Lambda\",";
        (
          write_function_definition
        ) ob x;
        Buffer.add_char ob ']'
      | `AnonClass x ->
        Buffer.add_string ob "[\"AnonClass\",";
        (
          write_class_definition
        ) ob x;
        Buffer.add_char ob ']'
      | `Conditional x ->
        Buffer.add_string ob "[\"Conditional\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Yield x ->
        Buffer.add_string ob "[\"Yield\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write__expr_nullable
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              Yojson.Safe.write_bool
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Await x ->
        Buffer.add_string ob "[\"Await\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Cast x ->
        Buffer.add_string ob "[\"Cast\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_type_
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Seq x ->
        Buffer.add_string ob "[\"Seq\",";
        (
          write__expr_list
        ) ob x;
        Buffer.add_char ob ']'
      | `Ref x ->
        Buffer.add_string ob "[\"Ref\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `DeRef x ->
        Buffer.add_string ob "[\"DeRef\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Ellipsis x ->
        Buffer.add_string ob "[\"Ellipsis\",";
        (
          write_tok
        ) ob x;
        Buffer.add_char ob ']'
      | `ParenExpr x ->
        Buffer.add_string ob "[\"ParenExpr\",";
        (
          write__expr_bracket
        ) ob x;
        Buffer.add_char ob ']'
      | `StmtExpr x ->
        Buffer.add_string ob "[\"StmtExpr\",";
        (
          write_stmt
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherExpr x ->
        Buffer.add_string ob "[\"OtherExpr\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_expr ?(len = 1024) x =
  let ob = Buffer.create len in
  write_expr ob x;
  Buffer.contents ob
and write_field = (
  fun ob x ->
    match x with
      | `F x ->
        Buffer.add_string ob "[\"F\",";
        (
          write_stmt
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_field ?(len = 1024) x =
  let ob = Buffer.create len in
  write_field ob x;
  Buffer.contents ob
and write_field_name = (
  fun ob x ->
    match x with
      | `FN x ->
        Buffer.add_string ob "[\"FN\",";
        (
          write_name
        ) ob x;
        Buffer.add_char ob ']'
      | `FDynamic x ->
        Buffer.add_string ob "[\"FDynamic\",";
        (
          write_expr
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_field_name ?(len = 1024) x =
  let ob = Buffer.create len in
  write_field_name ob x;
  Buffer.contents ob
and write_finally = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_stmt
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of_finally ?(len = 1024) x =
  let ob = Buffer.create len in
  write_finally ob x;
  Buffer.contents ob
and write_for_each = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_pattern
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_expr
    ) ob x
    );
    Buffer.add_char ob ']';
)
and string_of_for_each ?(len = 1024) x =
  let ob = Buffer.create len in
  write_for_each ob x;
  Buffer.contents ob
and write_for_header = (
  fun ob x ->
    match x with
      | `ForClassic x ->
        Buffer.add_string ob "[\"ForClassic\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write__for_var_or_expr_list
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write__expr_nullable
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write__expr_nullable
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `ForEach x ->
        Buffer.add_string ob "[\"ForEach\",";
        (
          write_for_each
        ) ob x;
        Buffer.add_char ob ']'
      | `MultiForEach x ->
        Buffer.add_string ob "[\"MultiForEach\",";
        (
          write__multi_for_each_list
        ) ob x;
        Buffer.add_char ob ']'
      | `ForIn x ->
        Buffer.add_string ob "[\"ForIn\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write__for_var_or_expr_list
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__expr_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_for_header ?(len = 1024) x =
  let ob = Buffer.create len in
  write_for_header ob x;
  Buffer.contents ob
and write_for_or_if_comp = (
  fun ob x ->
    match x with
      | `CompFor x ->
        Buffer.add_string ob "[\"CompFor\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _, _ = x in
            (
              write_pattern
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `CompIf x ->
        Buffer.add_string ob "[\"CompIf\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_for_or_if_comp ?(len = 1024) x =
  let ob = Buffer.create len in
  write_for_or_if_comp ob x;
  Buffer.contents ob
and write_for_var_or_expr = (
  fun ob x ->
    match x with
      | `ForInitVar x ->
        Buffer.add_string ob "[\"ForInitVar\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_entity
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_variable_definition
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `ForInitExpr x ->
        Buffer.add_string ob "[\"ForInitExpr\",";
        (
          write_expr
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_for_var_or_expr ?(len = 1024) x =
  let ob = Buffer.create len in
  write_for_var_or_expr ob x;
  Buffer.contents ob
and write_function_body = (
  fun ob x ->
    match x with
      | `FBStmt x ->
        Buffer.add_string ob "[\"FBStmt\",";
        (
          write_stmt
        ) ob x;
        Buffer.add_char ob ']'
      | `FBExpr x ->
        Buffer.add_string ob "[\"FBExpr\",";
        (
          write_expr
        ) ob x;
        Buffer.add_char ob ']'
      | `FBDecl x ->
        Buffer.add_string ob "[\"FBDecl\",";
        (
          write_sc
        ) ob x;
        Buffer.add_char ob ']'
      | `FBNothing -> Buffer.add_string ob "\"FBNothing\""
)
and string_of_function_body ?(len = 1024) x =
  let ob = Buffer.create len in
  write_function_body ob x;
  Buffer.contents ob
and write_function_definition : _ -> function_definition -> _ = (
  fun ob (x : function_definition) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"fkind\":";
    (
      write__function_kind_wrap
    )
      ob x.fkind;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"fparams\":";
    (
      write_parameters
    )
      ob x.fparams;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"frettype\":";
    (
      write__type_nullable
    )
      ob x.frettype;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"fbody\":";
    (
      write_function_body
    )
      ob x.fbody;
    Buffer.add_char ob '}';
)
and string_of_function_definition ?(len = 1024) x =
  let ob = Buffer.create len in
  write_function_definition ob x;
  Buffer.contents ob
and write_id_info : _ -> id_info -> _ = (
  fun ob (x : id_info) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    (match x.id_resolved with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"id_resolved\":";
      (
        write_resolved_name
      )
        ob x;
    );
    (match x.id_type with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"id_type\":";
      (
        write_type_
      )
        ob x;
    );
    (match x.id_svalue with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"id_svalue\":";
      (
        write_svalue
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
and string_of_id_info ?(len = 1024) x =
  let ob = Buffer.create len in
  write_id_info ob x;
  Buffer.contents ob
and write_item ob x = (
  write_stmt
) ob x
and string_of_item ?(len = 1024) x =
  let ob = Buffer.create len in
  write_item ob x;
  Buffer.contents ob
and write_label_ident = (
  fun ob x ->
    match x with
      | `LNone -> Buffer.add_string ob "\"LNone\""
      | `LId x ->
        Buffer.add_string ob "[\"LId\",";
        (
          write_label
        ) ob x;
        Buffer.add_char ob ']'
      | `LInt x ->
        Buffer.add_string ob "[\"LInt\",";
        (
          write__int_wrap
        ) ob x;
        Buffer.add_char ob ']'
      | `LDynamic x ->
        Buffer.add_string ob "[\"LDynamic\",";
        (
          write_expr
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_label_ident ?(len = 1024) x =
  let ob = Buffer.create len in
  write_label_ident ob x;
  Buffer.contents ob
and write_macro_definition : _ -> macro_definition -> _ = (
  fun ob (x : macro_definition) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"macroparams\":";
    (
      write__ident_list
    )
      ob x.macroparams;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"macrobody\":";
    (
      write__any_list
    )
      ob x.macrobody;
    Buffer.add_char ob '}';
)
and string_of_macro_definition ?(len = 1024) x =
  let ob = Buffer.create len in
  write_macro_definition ob x;
  Buffer.contents ob
and write_module_definition : _ -> module_definition -> _ = (
  fun ob (x : module_definition) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"mbody\":";
    (
      write_module_definition_kind
    )
      ob x.mbody;
    Buffer.add_char ob '}';
)
and string_of_module_definition ?(len = 1024) x =
  let ob = Buffer.create len in
  write_module_definition ob x;
  Buffer.contents ob
and write_module_definition_kind = (
  fun ob x ->
    match x with
      | `ModuleAlias x ->
        Buffer.add_string ob "[\"ModuleAlias\",";
        (
          write_dotted_ident
        ) ob x;
        Buffer.add_char ob ']'
      | `ModuleStruct x ->
        Buffer.add_string ob "[\"ModuleStruct\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write__dotted_ident_nullable
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__item_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherModule x ->
        Buffer.add_string ob "[\"OtherModule\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_module_definition_kind ?(len = 1024) x =
  let ob = Buffer.create len in
  write_module_definition_kind ob x;
  Buffer.contents ob
and write_multi_for_each = (
  fun ob x ->
    match x with
      | `FE x ->
        Buffer.add_string ob "[\"FE\",";
        (
          write_for_each
        ) ob x;
        Buffer.add_char ob ']'
      | `FECond x ->
        Buffer.add_string ob "[\"FECond\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_for_each
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_multi_for_each ?(len = 1024) x =
  let ob = Buffer.create len in
  write_multi_for_each ob x;
  Buffer.contents ob
and write_name = (
  fun ob x ->
    match x with
      | `Id x ->
        Buffer.add_string ob "[\"Id\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_ident
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_id_info
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `IdQualified x ->
        Buffer.add_string ob "[\"IdQualified\",";
        (
          write_qualified_info
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_name ?(len = 1024) x =
  let ob = Buffer.create len in
  write_name ob x;
  Buffer.contents ob
and write_or_type_element = (
  fun ob x ->
    match x with
      | `OrConstructor x ->
        Buffer.add_string ob "[\"OrConstructor\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_ident
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__type_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `OrEnum x ->
        Buffer.add_string ob "[\"OrEnum\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_ident
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__expr_nullable
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `OrUnion x ->
        Buffer.add_string ob "[\"OrUnion\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_ident
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_type_
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherOr x ->
        Buffer.add_string ob "[\"OtherOr\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_or_type_element ?(len = 1024) x =
  let ob = Buffer.create len in
  write_or_type_element ob x;
  Buffer.contents ob
and write_parameter = (
  fun ob x ->
    match x with
      | `ParamClassic x ->
        Buffer.add_string ob "[\"ParamClassic\",";
        (
          write_parameter_classic
        ) ob x;
        Buffer.add_char ob ']'
      | `ParamPattern x ->
        Buffer.add_string ob "[\"ParamPattern\",";
        (
          write_pattern
        ) ob x;
        Buffer.add_char ob ']'
      | `ParamRest x ->
        Buffer.add_string ob "[\"ParamRest\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_parameter_classic
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `ParamHashSplat x ->
        Buffer.add_string ob "[\"ParamHashSplat\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_parameter_classic
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherParam x ->
        Buffer.add_string ob "[\"OtherParam\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_parameter ?(len = 1024) x =
  let ob = Buffer.create len in
  write_parameter ob x;
  Buffer.contents ob
and write_parameter_classic : _ -> parameter_classic -> _ = (
  fun ob (x : parameter_classic) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"pname\":";
    (
      write__ident_nullable
    )
      ob x.pname;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"ptype\":";
    (
      write__type_nullable
    )
      ob x.ptype;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"pdefault\":";
    (
      write__expr_nullable
    )
      ob x.pdefault;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"pattrs\":";
    (
      write__attribute_list
    )
      ob x.pattrs;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"pinfo\":";
    (
      write_id_info
    )
      ob x.pinfo;
    Buffer.add_char ob '}';
)
and string_of_parameter_classic ?(len = 1024) x =
  let ob = Buffer.create len in
  write_parameter_classic ob x;
  Buffer.contents ob
and write_parameters ob x = (
  write__parameter_list
) ob x
and string_of_parameters ?(len = 1024) x =
  let ob = Buffer.create len in
  write_parameters ob x;
  Buffer.contents ob
and write_pattern = (
  fun ob x ->
    match x with
      | `PatLiteral x ->
        Buffer.add_string ob "[\"PatLiteral\",";
        (
          write_literal
        ) ob x;
        Buffer.add_char ob ']'
      | `PatConstructor x ->
        Buffer.add_string ob "[\"PatConstructor\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_name
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__pattern_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `PatRecord x ->
        Buffer.add_string ob "[\"PatRecord\",";
        (
          write__dotted_ident_pattern_list_bracket
        ) ob x;
        Buffer.add_char ob ']'
      | `PatId x ->
        Buffer.add_string ob "[\"PatId\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_ident
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_id_info
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `PatTuple x ->
        Buffer.add_string ob "[\"PatTuple\",";
        (
          write__pattern_list_bracket
        ) ob x;
        Buffer.add_char ob ']'
      | `PatList x ->
        Buffer.add_string ob "[\"PatList\",";
        (
          write__pattern_list_bracket
        ) ob x;
        Buffer.add_char ob ']'
      | `PatKeyVal x ->
        Buffer.add_string ob "[\"PatKeyVal\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_pattern
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_pattern
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `PatWildcard x ->
        Buffer.add_string ob "[\"PatWildcard\",";
        (
          write_tok
        ) ob x;
        Buffer.add_char ob ']'
      | `PatDisj x ->
        Buffer.add_string ob "[\"PatDisj\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_pattern
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_pattern
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `PatTyped x ->
        Buffer.add_string ob "[\"PatTyped\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_pattern
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_type_
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `PatWhen x ->
        Buffer.add_string ob "[\"PatWhen\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_pattern
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `PatAs x ->
        Buffer.add_string ob "[\"PatAs\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_pattern
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              fun ob x ->
                Buffer.add_char ob '[';
                (let x, _ = x in
                (
                  write_ident
                ) ob x
                );
                Buffer.add_char ob ',';
                (let _, x = x in
                (
                  write_id_info
                ) ob x
                );
                Buffer.add_char ob ']';
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `PatType x ->
        Buffer.add_string ob "[\"PatType\",";
        (
          write_type_
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherPat x ->
        Buffer.add_string ob "[\"OtherPat\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_pattern ?(len = 1024) x =
  let ob = Buffer.create len in
  write_pattern ob x;
  Buffer.contents ob
and write_qualified_info : _ -> qualified_info -> _ = (
  fun ob (x : qualified_info) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"name_last\":";
    (
      fun ob x ->
        Buffer.add_char ob '[';
        (let x, _ = x in
        (
          write_ident
        ) ob x
        );
        Buffer.add_char ob ',';
        (let _, x = x in
        (
          write__type_arguments_nullable
        ) ob x
        );
        Buffer.add_char ob ']';
    )
      ob x.name_last;
    (match x.name_middle with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"name_middle\":";
      (
        write_qualifier
      )
        ob x;
    );
    (match x.name_top with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"name_top\":";
      (
        write_tok
      )
        ob x;
    );
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"name_info\":";
    (
      write_id_info
    )
      ob x.name_info;
    Buffer.add_char ob '}';
)
and string_of_qualified_info ?(len = 1024) x =
  let ob = Buffer.create len in
  write_qualified_info ob x;
  Buffer.contents ob
and write_qualifier = (
  fun ob x ->
    match x with
      | `QDots x ->
        Buffer.add_string ob "[\"QDots\",";
        (
          write__ident_type_arguments_nullable_list
        ) ob x;
        Buffer.add_char ob ']'
      | `QExpr x ->
        Buffer.add_string ob "[\"QExpr\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_qualifier ?(len = 1024) x =
  let ob = Buffer.create len in
  write_qualifier ob x;
  Buffer.contents ob
and write_stmt = (
  fun ob x ->
    match x with
      | `ExprStmt x ->
        Buffer.add_string ob "[\"ExprStmt\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_sc
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Block x ->
        Buffer.add_string ob "[\"Block\",";
        (
          write__stmt_list_bracket
        ) ob x;
        Buffer.add_char ob ']'
      | `If x ->
        Buffer.add_string ob "[\"If\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _, _ = x in
            (
              write_condition
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x, _ = x in
            (
              write_stmt
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, _, x = x in
            (
              write__stmt_nullable
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `While x ->
        Buffer.add_string ob "[\"While\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_condition
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_stmt
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Return x ->
        Buffer.add_string ob "[\"Return\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write__expr_nullable
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_sc
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `DoWhile x ->
        Buffer.add_string ob "[\"DoWhile\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_stmt
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `For x ->
        Buffer.add_string ob "[\"For\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_for_header
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_stmt
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Switch x ->
        Buffer.add_string ob "[\"Switch\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write__condition_nullable
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write__case_and_body_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Continue x ->
        Buffer.add_string ob "[\"Continue\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_label_ident
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_sc
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Break x ->
        Buffer.add_string ob "[\"Break\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_label_ident
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_sc
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Label x ->
        Buffer.add_string ob "[\"Label\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_label
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_stmt
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Goto x ->
        Buffer.add_string ob "[\"Goto\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_label
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Throw x ->
        Buffer.add_string ob "[\"Throw\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_expr
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_sc
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Try x ->
        Buffer.add_string ob "[\"Try\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _, _ = x in
            (
              write_stmt
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x, _ = x in
            (
              write__catch_list
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, _, x = x in
            (
              write__finally_nullable
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `WithUsingResource x ->
        Buffer.add_string ob "[\"WithUsingResource\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write__stmt_list
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_stmt
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `Assert x ->
        Buffer.add_string ob "[\"Assert\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_arguments
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_sc
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `DefStmt x ->
        Buffer.add_string ob "[\"DefStmt\",";
        (
          write_definition
        ) ob x;
        Buffer.add_char ob ']'
      | `DirectiveStmt x ->
        Buffer.add_string ob "[\"DirectiveStmt\",";
        (
          write_directive
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherStmt x ->
        Buffer.add_string ob "[\"OtherStmt\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_stmt ?(len = 1024) x =
  let ob = Buffer.create len in
  write_stmt ob x;
  Buffer.contents ob
and write_svalue = (
  fun ob x ->
    match x with
      | `Lit x ->
        Buffer.add_string ob "[\"Lit\",";
        (
          write_literal
        ) ob x;
        Buffer.add_char ob ']'
      | `Cst x ->
        Buffer.add_string ob "[\"Cst\",";
        (
          write_const_type
        ) ob x;
        Buffer.add_char ob ']'
      | `Sym x ->
        Buffer.add_string ob "[\"Sym\",";
        (
          write_expr
        ) ob x;
        Buffer.add_char ob ']'
      | `NotCst -> Buffer.add_string ob "\"NotCst\""
)
and string_of_svalue ?(len = 1024) x =
  let ob = Buffer.create len in
  write_svalue ob x;
  Buffer.contents ob
and write_type_ = (
  fun ob x ->
    match x with
      | `TyN x ->
        Buffer.add_string ob "[\"TyN\",";
        (
          write_name
        ) ob x;
        Buffer.add_char ob ']'
      | `TyApply x ->
        Buffer.add_string ob "[\"TyApply\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_type_
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_type_arguments
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `TyFun x ->
        Buffer.add_string ob "[\"TyFun\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write__parameter_list
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_type_
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `TyArray x ->
        Buffer.add_string ob "[\"TyArray\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write__expr_nullable_bracket
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_type_
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `TyTuple x ->
        Buffer.add_string ob "[\"TyTuple\",";
        (
          write__type_list_bracket
        ) ob x;
        Buffer.add_char ob ']'
      | `TyVar x ->
        Buffer.add_string ob "[\"TyVar\",";
        (
          write_ident
        ) ob x;
        Buffer.add_char ob ']'
      | `TyAny x ->
        Buffer.add_string ob "[\"TyAny\",";
        (
          write_tok
        ) ob x;
        Buffer.add_char ob ']'
      | `TyPointer x ->
        Buffer.add_string ob "[\"TyPointer\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_type_
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `TyRef x ->
        Buffer.add_string ob "[\"TyRef\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_type_
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `TyQuestion x ->
        Buffer.add_string ob "[\"TyQuestion\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_type_
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `TyRest x ->
        Buffer.add_string ob "[\"TyRest\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write_type_
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `TyAnd x ->
        Buffer.add_string ob "[\"TyAnd\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_type_
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_type_
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `TyOr x ->
        Buffer.add_string ob "[\"TyOr\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_type_
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_type_
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `TyRecordAnon x ->
        Buffer.add_string ob "[\"TyRecordAnon\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write__class_kind_wrap
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__field_list_bracket
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `TyExpr x ->
        Buffer.add_string ob "[\"TyExpr\",";
        (
          write_expr
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherType x ->
        Buffer.add_string ob "[\"OtherType\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_type_ ?(len = 1024) x =
  let ob = Buffer.create len in
  write_type_ ob x;
  Buffer.contents ob
and write_type_argument = (
  fun ob x ->
    match x with
      | `TA x ->
        Buffer.add_string ob "[\"TA\",";
        (
          write_type_
        ) ob x;
        Buffer.add_char ob ']'
      | `TAWildcard x ->
        Buffer.add_string ob "[\"TAWildcard\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__bool_wrap_type_nullable
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `TAExpr x ->
        Buffer.add_string ob "[\"TAExpr\",";
        (
          write_expr
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherTypeArg x ->
        Buffer.add_string ob "[\"OtherTypeArg\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_type_argument ?(len = 1024) x =
  let ob = Buffer.create len in
  write_type_argument ob x;
  Buffer.contents ob
and write_type_arguments ob x = (
  write__type_argument_list_bracket
) ob x
and string_of_type_arguments ?(len = 1024) x =
  let ob = Buffer.create len in
  write_type_arguments ob x;
  Buffer.contents ob
and write_type_definition : _ -> type_definition -> _ = (
  fun ob (x : type_definition) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"tbody\":";
    (
      write_type_definition_kind
    )
      ob x.tbody;
    Buffer.add_char ob '}';
)
and string_of_type_definition ?(len = 1024) x =
  let ob = Buffer.create len in
  write_type_definition ob x;
  Buffer.contents ob
and write_type_definition_kind = (
  fun ob x ->
    match x with
      | `OrType x ->
        Buffer.add_string ob "[\"OrType\",";
        (
          write__or_type_element_list
        ) ob x;
        Buffer.add_char ob ']'
      | `AndType x ->
        Buffer.add_string ob "[\"AndType\",";
        (
          write__field_list_bracket
        ) ob x;
        Buffer.add_char ob ']'
      | `AliasType x ->
        Buffer.add_string ob "[\"AliasType\",";
        (
          write_type_
        ) ob x;
        Buffer.add_char ob ']'
      | `NewType x ->
        Buffer.add_string ob "[\"NewType\",";
        (
          write_type_
        ) ob x;
        Buffer.add_char ob ']'
      | `AbstractType x ->
        Buffer.add_string ob "[\"AbstractType\",";
        (
          write_tok
        ) ob x;
        Buffer.add_char ob ']'
      | `Exception x ->
        Buffer.add_string ob "[\"Exception\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_ident
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__type_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherTypeKind x ->
        Buffer.add_string ob "[\"OtherTypeKind\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_type_definition_kind ?(len = 1024) x =
  let ob = Buffer.create len in
  write_type_definition_kind ob x;
  Buffer.contents ob
and write_type_parameter = (
  fun ob x ->
    match x with
      | `TP x ->
        Buffer.add_string ob "[\"TP\",";
        (
          write_type_parameter_classic
        ) ob x;
        Buffer.add_char ob ']'
      | `OtherTypeParam x ->
        Buffer.add_string ob "[\"OtherTypeParam\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _ = x in
            (
              write_todo_kind
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x = x in
            (
              write__any_list
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_type_parameter ?(len = 1024) x =
  let ob = Buffer.create len in
  write_type_parameter ob x;
  Buffer.contents ob
and write_type_parameter_classic : _ -> type_parameter_classic -> _ = (
  fun ob (x : type_parameter_classic) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"tp_id\":";
    (
      write_ident
    )
      ob x.tp_id;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"tp_attrs\":";
    (
      write__attribute_list
    )
      ob x.tp_attrs;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"tp_bounds\":";
    (
      write__type_list
    )
      ob x.tp_bounds;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"tp_default\":";
    (
      write__type_nullable
    )
      ob x.tp_default;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"tp_variance\":";
    (
      write__variance_wrap_nullable
    )
      ob x.tp_variance;
    Buffer.add_char ob '}';
)
and string_of_type_parameter_classic ?(len = 1024) x =
  let ob = Buffer.create len in
  write_type_parameter_classic ob x;
  Buffer.contents ob
and write_type_parameters ob x = (
  write__type_parameter_list
) ob x
and string_of_type_parameters ?(len = 1024) x =
  let ob = Buffer.create len in
  write_type_parameters ob x;
  Buffer.contents ob
and write_variable_definition : _ -> variable_definition -> _ = (
  fun ob (x : variable_definition) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    (match x.vinit with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"vinit\":";
      (
        write_expr
      )
        ob x;
    );
    (match x.vtype with None -> () | Some x ->
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"vtype\":";
      (
        write_type_
      )
        ob x;
    );
    Buffer.add_char ob '}';
)
and string_of_variable_definition ?(len = 1024) x =
  let ob = Buffer.create len in
  write_variable_definition ob x;
  Buffer.contents ob
and write_xml : _ -> xml -> _ = (
  fun ob (x : xml) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"xml_kind\":";
    (
      write_xml_kind
    )
      ob x.xml_kind;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"xml_attrs\":";
    (
      write__xml_attribute_list
    )
      ob x.xml_attrs;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"xml_body\":";
    (
      write__xml_body_list
    )
      ob x.xml_body;
    Buffer.add_char ob '}';
)
and string_of_xml ?(len = 1024) x =
  let ob = Buffer.create len in
  write_xml ob x;
  Buffer.contents ob
and write_xml_attr_value ob x = (
  write_expr
) ob x
and string_of_xml_attr_value ?(len = 1024) x =
  let ob = Buffer.create len in
  write_xml_attr_value ob x;
  Buffer.contents ob
and write_xml_attribute = (
  fun ob x ->
    match x with
      | `XmlAttr x ->
        Buffer.add_string ob "[\"XmlAttr\",";
        (
          fun ob x ->
            Buffer.add_char ob '[';
            (let x, _, _ = x in
            (
              write_ident
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, x, _ = x in
            (
              write_tok
            ) ob x
            );
            Buffer.add_char ob ',';
            (let _, _, x = x in
            (
              write_xml_attr_value
            ) ob x
            );
            Buffer.add_char ob ']';
        ) ob x;
        Buffer.add_char ob ']'
      | `XmlAttrExpr x ->
        Buffer.add_string ob "[\"XmlAttrExpr\",";
        (
          write__expr_bracket
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_xml_attribute ?(len = 1024) x =
  let ob = Buffer.create len in
  write_xml_attribute ob x;
  Buffer.contents ob
and write_xml_body = (
  fun ob x ->
    match x with
      | `XmlText x ->
        Buffer.add_string ob "[\"XmlText\",";
        (
          write__string_wrap
        ) ob x;
        Buffer.add_char ob ']'
      | `XmlExpr x ->
        Buffer.add_string ob "[\"XmlExpr\",";
        (
          write__expr_nullable_bracket
        ) ob x;
        Buffer.add_char ob ']'
      | `XmlXml x ->
        Buffer.add_string ob "[\"XmlXml\",";
        (
          write_xml
        ) ob x;
        Buffer.add_char ob ']'
)
and string_of_xml_body ?(len = 1024) x =
  let ob = Buffer.create len in
  write_xml_body ob x;
  Buffer.contents ob
let rec read__alias_nullable p lb = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read_alias
    ) p lb) : _ option)
) p lb
and _alias_nullable_of_string s =
  read__alias_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__any_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_any
  )
) p lb
and _any_list_of_string s =
  read__any_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__argument_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_argument
  )
) p lb
and _argument_list_of_string s =
  read__argument_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__argument_list_bracket = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read__argument_list
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
and _argument_list_bracket_of_string s =
  read__argument_list_bracket (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__arguments_nullable p lb = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read_arguments
    ) p lb) : _ option)
) p lb
and _arguments_nullable_of_string s =
  read__arguments_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__attribute_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_attribute
  )
) p lb
and _attribute_list_of_string s =
  read__attribute_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__bool_wrap_type_nullable p lb = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      fun p lb ->
        Yojson.Safe.read_space p lb;
        let std_tuple = Yojson.Safe.start_any_tuple p lb in
        let len = ref 0 in
        let end_of_tuple = ref false in
        (try
          let x0 =
            let x =
              (
                read__bool_wrap
              ) p lb
            in
            incr len;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
            x
          in
          let x1 =
            let x =
              (
                read_type_
              ) p lb
            in
            incr len;
            (try
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_tuple_sep2 p std_tuple lb;
            with Yojson.End_of_tuple -> end_of_tuple := true);
            x
          in
          if not !end_of_tuple then (
            try
              while true do
                Yojson.Safe.skip_json p lb;
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_tuple_sep2 p std_tuple lb;
              done
            with Yojson.End_of_tuple -> ()
          );
          (x0, x1)
        with Yojson.End_of_tuple ->
          Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
    ) p lb) : _ option)
) p lb
and _bool_wrap_type_nullable_of_string s =
  read__bool_wrap_type_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__bracket_0ecc50b = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            fun p lb ->
              Yojson.Safe.read_space p lb;
              let std_tuple = Yojson.Safe.start_any_tuple p lb in
              let len = ref 0 in
              let end_of_tuple = ref false in
              (try
                let x0 =
                  let x =
                    (
                      read__expr_nullable
                    ) p lb
                  in
                  incr len;
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                  x
                in
                let x1 =
                  let x =
                    (
                      read__expr_nullable
                    ) p lb
                  in
                  incr len;
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                  x
                in
                let x2 =
                  let x =
                    (
                      read__expr_nullable
                    ) p lb
                  in
                  incr len;
                  (try
                    Yojson.Safe.read_space p lb;
                    Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                  with Yojson.End_of_tuple -> end_of_tuple := true);
                  x
                in
                if not !end_of_tuple then (
                  try
                    while true do
                      Yojson.Safe.skip_json p lb;
                      Yojson.Safe.read_space p lb;
                      Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                    done
                  with Yojson.End_of_tuple -> ()
                );
                (x0, x1, x2)
              with Yojson.End_of_tuple ->
                Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
and _bracket_0ecc50b_of_string s =
  read__bracket_0ecc50b (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__case_and_body_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_case_and_body
  )
) p lb
and _case_and_body_list_of_string s =
  read__case_and_body_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__case_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_case
  )
) p lb
and _case_list_of_string s =
  read__case_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__catch_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_catch
  )
) p lb
and _catch_list_of_string s =
  read__catch_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__class_parent_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_class_parent
  )
) p lb
and _class_parent_list_of_string s =
  read__class_parent_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__comprehension_bracket = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_comprehension
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
and _comprehension_bracket_of_string s =
  read__comprehension_bracket (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__condition_nullable p lb = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read_condition
    ) p lb) : _ option)
) p lb
and _condition_nullable_of_string s =
  read__condition_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__dotted_ident_pattern_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      let std_tuple = Yojson.Safe.start_any_tuple p lb in
      let len = ref 0 in
      let end_of_tuple = ref false in
      (try
        let x0 =
          let x =
            (
              read_dotted_ident
            ) p lb
          in
          incr len;
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          x
        in
        let x1 =
          let x =
            (
              read_pattern
            ) p lb
          in
          incr len;
          (try
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          with Yojson.End_of_tuple -> end_of_tuple := true);
          x
        in
        if not !end_of_tuple then (
          try
            while true do
              Yojson.Safe.skip_json p lb;
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_tuple_sep2 p std_tuple lb;
            done
          with Yojson.End_of_tuple -> ()
        );
        (x0, x1)
      with Yojson.End_of_tuple ->
        Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
  )
) p lb
and _dotted_ident_pattern_list_of_string s =
  read__dotted_ident_pattern_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__dotted_ident_pattern_list_bracket = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read__dotted_ident_pattern_list
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
and _dotted_ident_pattern_list_bracket_of_string s =
  read__dotted_ident_pattern_list_bracket (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__expr_bracket = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_expr
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
and _expr_bracket_of_string s =
  read__expr_bracket (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__expr_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_expr
  )
) p lb
and _expr_list_of_string s =
  read__expr_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__expr_list_bracket = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read__expr_list
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
and _expr_list_bracket_of_string s =
  read__expr_list_bracket (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__expr_nullable p lb = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read_expr
    ) p lb) : _ option)
) p lb
and _expr_nullable_of_string s =
  read__expr_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__expr_nullable_bracket = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read__expr_nullable
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
and _expr_nullable_bracket_of_string s =
  read__expr_nullable_bracket (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__expr_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and _expr_option_of_string s =
  read__expr_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__field_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_field
  )
) p lb
and _field_list_of_string s =
  read__field_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__field_list_bracket = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read__field_list
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
and _field_list_bracket_of_string s =
  read__field_list_bracket (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__field_list_bracket_nullable p lb = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read__field_list_bracket
    ) p lb) : _ option)
) p lb
and _field_list_bracket_nullable_of_string s =
  read__field_list_bracket_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__finally_nullable p lb = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read_finally
    ) p lb) : _ option)
) p lb
and _finally_nullable_of_string s =
  read__finally_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__for_or_if_comp_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_for_or_if_comp
  )
) p lb
and _for_or_if_comp_list_of_string s =
  read__for_or_if_comp_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__for_var_or_expr_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_for_var_or_expr
  )
) p lb
and _for_var_or_expr_list_of_string s =
  read__for_var_or_expr_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__ident_alias_nullable_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      let std_tuple = Yojson.Safe.start_any_tuple p lb in
      let len = ref 0 in
      let end_of_tuple = ref false in
      (try
        let x0 =
          let x =
            (
              read_ident
            ) p lb
          in
          incr len;
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          x
        in
        let x1 =
          let x =
            (
              read__alias_nullable
            ) p lb
          in
          incr len;
          (try
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          with Yojson.End_of_tuple -> end_of_tuple := true);
          x
        in
        if not !end_of_tuple then (
          try
            while true do
              Yojson.Safe.skip_json p lb;
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_tuple_sep2 p std_tuple lb;
            done
          with Yojson.End_of_tuple -> ()
        );
        (x0, x1)
      with Yojson.End_of_tuple ->
        Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
  )
) p lb
and _ident_alias_nullable_list_of_string s =
  read__ident_alias_nullable_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__ident_type_arguments_nullable_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      let std_tuple = Yojson.Safe.start_any_tuple p lb in
      let len = ref 0 in
      let end_of_tuple = ref false in
      (try
        let x0 =
          let x =
            (
              read_ident
            ) p lb
          in
          incr len;
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          x
        in
        let x1 =
          let x =
            (
              read__type_arguments_nullable
            ) p lb
          in
          incr len;
          (try
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          with Yojson.End_of_tuple -> end_of_tuple := true);
          x
        in
        if not !end_of_tuple then (
          try
            while true do
              Yojson.Safe.skip_json p lb;
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_tuple_sep2 p std_tuple lb;
            done
          with Yojson.End_of_tuple -> ()
        );
        (x0, x1)
      with Yojson.End_of_tuple ->
        Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
  )
) p lb
and _ident_type_arguments_nullable_list_of_string s =
  read__ident_type_arguments_nullable_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__item_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_item
  )
) p lb
and _item_list_of_string s =
  read__item_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__multi_for_each_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_multi_for_each
  )
) p lb
and _multi_for_each_list_of_string s =
  read__multi_for_each_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__or_type_element_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_or_type_element
  )
) p lb
and _or_type_element_list_of_string s =
  read__or_type_element_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__parameter_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_parameter
  )
) p lb
and _parameter_list_of_string s =
  read__parameter_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__pattern_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_pattern
  )
) p lb
and _pattern_list_of_string s =
  read__pattern_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__pattern_list_bracket = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read__pattern_list
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
and _pattern_list_bracket_of_string s =
  read__pattern_list_bracket (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__qualifier_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_qualifier
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_qualifier
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and _qualifier_option_of_string s =
  read__qualifier_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__stmt_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_stmt
  )
) p lb
and _stmt_list_of_string s =
  read__stmt_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__stmt_list_bracket = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read__stmt_list
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
and _stmt_list_bracket_of_string s =
  read__stmt_list_bracket (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__stmt_nullable p lb = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read_stmt
    ) p lb) : _ option)
) p lb
and _stmt_nullable_of_string s =
  read__stmt_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__svalue_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_svalue
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_svalue
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and _svalue_option_of_string s =
  read__svalue_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__type_argument_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_type_argument
  )
) p lb
and _type_argument_list_of_string s =
  read__type_argument_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__type_argument_list_bracket = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read__type_argument_list
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
and _type_argument_list_bracket_of_string s =
  read__type_argument_list_bracket (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__type_arguments_nullable p lb = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read_type_arguments
    ) p lb) : _ option)
) p lb
and _type_arguments_nullable_of_string s =
  read__type_arguments_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__type_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_type_
  )
) p lb
and _type_list_of_string s =
  read__type_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__type_list_bracket = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read__type_list
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
and _type_list_bracket_of_string s =
  read__type_list_bracket (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__type_nullable p lb = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    (if Yojson.Safe.read_null_if_possible p lb then None
    else Some ((
      read_type_
    ) p lb) : _ option)
) p lb
and _type_nullable_of_string s =
  read__type_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__type_option = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "None" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (None : _ option)
            | "Some" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "None" ->
              (None : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Some" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              (Some x : _ option)
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and _type_option_of_string s =
  read__type_option (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__type_parameter_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_type_parameter
  )
) p lb
and _type_parameter_list_of_string s =
  read__type_parameter_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__xml_attribute_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_xml_attribute
  )
) p lb
and _xml_attribute_list_of_string s =
  read__xml_attribute_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read__xml_body_list p lb = (
  Atdgen_runtime.Oj_run.read_list (
    read_xml_body
  )
) p lb
and _xml_body_list_of_string s =
  read__xml_body_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_alias = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_ident
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_id_info
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
and alias_of_string s =
  read_alias (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_any = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "E" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `E x
            | "S" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_stmt
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `S x
            | "T" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `T x
            | "P" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_pattern
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `P x
            | "At" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_attribute
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `At x
            | "Fld" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_field
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Fld x
            | "Ar" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_argument
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Ar x
            | "Pa" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_parameter
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Pa x
            | "Ta" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_type_argument
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Ta x
            | "Tp" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_type_parameter
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Tp x
            | "Ce" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_catch_exn
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Ce x
            | "Cs" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_case
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Cs x
            | "ForOrIfComp" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_for_or_if_comp
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ForOrIfComp x
            | "En" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_entity
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `En x
            | "I" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_ident
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `I x
            | "Modn" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_module_name
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Modn x
            | "Di" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_dotted_ident
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Di x
            | "Lbli" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_label_ident
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Lbli x
            | "Str" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__string_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Str x
            | "Tk" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Tk x
            | "TodoK" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_todo_kind
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TodoK x
            | "Anys" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Anys x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "E" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `E x
            | "S" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_stmt
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `S x
            | "T" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `T x
            | "P" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_pattern
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `P x
            | "At" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_attribute
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `At x
            | "Fld" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_field
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Fld x
            | "Ar" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_argument
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Ar x
            | "Pa" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_parameter
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Pa x
            | "Ta" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_type_argument
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Ta x
            | "Tp" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_type_parameter
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Tp x
            | "Ce" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_catch_exn
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Ce x
            | "Cs" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_case
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Cs x
            | "ForOrIfComp" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_for_or_if_comp
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ForOrIfComp x
            | "En" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_entity
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `En x
            | "I" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_ident
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `I x
            | "Modn" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_module_name
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Modn x
            | "Di" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_dotted_ident
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Di x
            | "Lbli" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_label_ident
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Lbli x
            | "Str" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__string_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Str x
            | "Tk" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Tk x
            | "TodoK" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_todo_kind
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TodoK x
            | "Anys" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Anys x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and any_of_string s =
  read_any (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_argument = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Arg" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Arg x
            | "ArgKwd" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ArgKwd x
            | "ArgKwdOptional" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ArgKwdOptional x
            | "ArgType" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ArgType x
            | "OtherArg" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherArg x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Arg" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Arg x
            | "ArgKwd" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ArgKwd x
            | "ArgKwdOptional" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ArgKwdOptional x
            | "ArgType" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ArgType x
            | "OtherArg" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherArg x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and argument_of_string s =
  read_argument (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_arguments p lb = (
  read__argument_list_bracket
) p lb
and arguments_of_string s =
  read_arguments (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_attribute = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "KeywordAttr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__keyword_attribute_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `KeywordAttr x
            | "NamedAttr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_name
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_arguments
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `NamedAttr x
            | "OtherAttribute" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherAttribute x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "KeywordAttr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__keyword_attribute_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `KeywordAttr x
            | "NamedAttr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_name
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_arguments
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `NamedAttr x
            | "OtherAttribute" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherAttribute x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and attribute_of_string s =
  read_attribute (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_case = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Case" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Case x
            | "Default" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Default x
            | "CaseEqualExpr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `CaseEqualExpr x
            | "OtherCase" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherCase x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Case" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Case x
            | "Default" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Default x
            | "CaseEqualExpr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `CaseEqualExpr x
            | "OtherCase" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherCase x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and case_of_string s =
  read_case (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_case_and_body = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "CasesAndBody" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__case_list
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `CasesAndBody x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "CasesAndBody" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__case_list
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `CasesAndBody x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and case_and_body_of_string s =
  read_case_and_body (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_catch = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_catch_exn
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_stmt
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
and catch_of_string s =
  read_catch (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_catch_exn = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "CatchPattern" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_pattern
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `CatchPattern x
            | "CatchParam" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_parameter_classic
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `CatchParam x
            | "OtherCatch" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherCatch x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "CatchPattern" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_pattern
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `CatchPattern x
            | "CatchParam" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_parameter_classic
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `CatchParam x
            | "OtherCatch" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherCatch x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and catch_exn_of_string s =
  read_catch_exn (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_class_definition = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_ckind = ref (None) in
    let field_cextends = ref (None) in
    let field_cimplements = ref (None) in
    let field_cmixins = ref (None) in
    let field_cparams = ref (None) in
    let field_cbody = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 5 -> (
                if String.unsafe_get s pos = 'c' then (
                  match String.unsafe_get s (pos+1) with
                    | 'b' -> (
                        if String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'y' then (
                          5
                        )
                        else (
                          -1
                        )
                      )
                    | 'k' -> (
                        if String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'd' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
                else (
                  -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'c' then (
                  match String.unsafe_get s (pos+1) with
                    | 'm' -> (
                        if String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'x' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 's' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | 'p' -> (
                        if String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 's' then (
                          4
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
                else (
                  -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 's' then (
                  2
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_ckind := (
              Some (
                (
                  read__class_kind_wrap
                ) p lb
              )
            );
          | 1 ->
            field_cextends := (
              Some (
                (
                  read__class_parent_list
                ) p lb
              )
            );
          | 2 ->
            field_cimplements := (
              Some (
                (
                  read__type_list
                ) p lb
              )
            );
          | 3 ->
            field_cmixins := (
              Some (
                (
                  read__type_list
                ) p lb
              )
            );
          | 4 ->
            field_cparams := (
              Some (
                (
                  read_parameters
                ) p lb
              )
            );
          | 5 ->
            field_cbody := (
              Some (
                (
                  read__field_list_bracket
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 5 -> (
                  if String.unsafe_get s pos = 'c' then (
                    match String.unsafe_get s (pos+1) with
                      | 'b' -> (
                          if String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'y' then (
                            5
                          )
                          else (
                            -1
                          )
                        )
                      | 'k' -> (
                          if String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'd' then (
                            0
                          )
                          else (
                            -1
                          )
                        )
                      | _ -> (
                          -1
                        )
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'c' then (
                    match String.unsafe_get s (pos+1) with
                      | 'm' -> (
                          if String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'x' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 's' then (
                            3
                          )
                          else (
                            -1
                          )
                        )
                      | 'p' -> (
                          if String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 's' then (
                            4
                          )
                          else (
                            -1
                          )
                        )
                      | _ -> (
                          -1
                        )
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'x' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'm' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 's' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_ckind := (
                Some (
                  (
                    read__class_kind_wrap
                  ) p lb
                )
              );
            | 1 ->
              field_cextends := (
                Some (
                  (
                    read__class_parent_list
                  ) p lb
                )
              );
            | 2 ->
              field_cimplements := (
                Some (
                  (
                    read__type_list
                  ) p lb
                )
              );
            | 3 ->
              field_cmixins := (
                Some (
                  (
                    read__type_list
                  ) p lb
                )
              );
            | 4 ->
              field_cparams := (
                Some (
                  (
                    read_parameters
                  ) p lb
                )
              );
            | 5 ->
              field_cbody := (
                Some (
                  (
                    read__field_list_bracket
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            ckind = (match !field_ckind with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "ckind");
            cextends = (match !field_cextends with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "cextends");
            cimplements = (match !field_cimplements with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "cimplements");
            cmixins = (match !field_cmixins with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "cmixins");
            cparams = (match !field_cparams with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "cparams");
            cbody = (match !field_cbody with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "cbody");
          }
         : class_definition)
      )
)
and class_definition_of_string s =
  read_class_definition (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_class_parent = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_type_
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read__arguments_nullable
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
and class_parent_of_string s =
  read_class_parent (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_comprehension = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_expr
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read__for_or_if_comp_list
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
and comprehension_of_string s =
  read_comprehension (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_condition = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Cond" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Cond x
            | "OtherCond" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherCond x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Cond" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Cond x
            | "OtherCond" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherCond x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and condition_of_string s =
  read_condition (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_definition = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_entity
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_definition_kind
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
and definition_of_string s =
  read_definition (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_definition_kind = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "FuncDef" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_function_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `FuncDef x
            | "VarDef" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_variable_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `VarDef x
            | "ClassDef" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_class_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ClassDef x
            | "EnumEntryDef" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_enum_entry_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `EnumEntryDef x
            | "TypeDef" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_type_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TypeDef x
            | "ModuleDef" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_module_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ModuleDef x
            | "MacroDef" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_macro_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `MacroDef x
            | "Signature" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Signature x
            | "UseOuterDecl" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `UseOuterDecl x
            | "OtherDef" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherDef x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "FuncDef" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_function_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `FuncDef x
            | "VarDef" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_variable_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `VarDef x
            | "ClassDef" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_class_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ClassDef x
            | "EnumEntryDef" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_enum_entry_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `EnumEntryDef x
            | "TypeDef" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_type_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TypeDef x
            | "ModuleDef" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_module_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ModuleDef x
            | "MacroDef" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_macro_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `MacroDef x
            | "Signature" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Signature x
            | "UseOuterDecl" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `UseOuterDecl x
            | "OtherDef" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherDef x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and definition_kind_of_string s =
  read_definition_kind (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_directive = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "ImportFrom" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_module_name
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read__ident_alias_nullable_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ImportFrom x
            | "ImportAs" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_module_name
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read__alias_nullable
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ImportAs x
            | "ImportAll" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_module_name
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ImportAll x
            | "Package" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_dotted_ident
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Package x
            | "PackageEnd" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PackageEnd x
            | "Pragma" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Pragma x
            | "OtherDirective" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherDirective x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "ImportFrom" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_module_name
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read__ident_alias_nullable_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ImportFrom x
            | "ImportAs" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_module_name
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read__alias_nullable
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ImportAs x
            | "ImportAll" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_module_name
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ImportAll x
            | "Package" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_dotted_ident
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Package x
            | "PackageEnd" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `PackageEnd x
            | "Pragma" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Pragma x
            | "OtherDirective" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherDirective x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and directive_of_string s =
  read_directive (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_entity = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_name = ref (None) in
    let field_attrs = ref (None) in
    let field_tparams = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  0
                )
                else (
                  -1
                )
              )
            | 5 -> (
                if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 's' then (
                  2
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_name := (
              Some (
                (
                  read_entity_name
                ) p lb
              )
            );
          | 1 ->
            field_attrs := (
              Some (
                (
                  read__attribute_list
                ) p lb
              )
            );
          | 2 ->
            field_tparams := (
              Some (
                (
                  read_type_parameters
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 's' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_name := (
                Some (
                  (
                    read_entity_name
                  ) p lb
                )
              );
            | 1 ->
              field_attrs := (
                Some (
                  (
                    read__attribute_list
                  ) p lb
                )
              );
            | 2 ->
              field_tparams := (
                Some (
                  (
                    read_type_parameters
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            name = (match !field_name with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "name");
            attrs = (match !field_attrs with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "attrs");
            tparams = (match !field_tparams with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "tparams");
          }
         : entity)
      )
)
and entity_of_string s =
  read_entity (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_entity_name = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "EN" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_name
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `EN x
            | "EDynamic" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `EDynamic x
            | "EPattern" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_pattern
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `EPattern x
            | "OtherEntity" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherEntity x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "EN" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_name
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `EN x
            | "EDynamic" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `EDynamic x
            | "EPattern" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_pattern
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `EPattern x
            | "OtherEntity" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherEntity x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and entity_name_of_string s =
  read_entity_name (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_enum_entry_definition = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_ee_args = ref (None) in
    let field_ee_body = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          if len = 7 && String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = '_' then (
            match String.unsafe_get s (pos+3) with
              | 'a' -> (
                  if String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 's' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 'b' -> (
                  if String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'y' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
          )
          else (
            -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_ee_args := (
              Some (
                (
                  read__arguments_nullable
                ) p lb
              )
            );
          | 1 ->
            field_ee_body := (
              Some (
                (
                  read__field_list_bracket_nullable
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 7 && String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = '_' then (
              match String.unsafe_get s (pos+3) with
                | 'a' -> (
                    if String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 's' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 'b' -> (
                    if String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'y' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_ee_args := (
                Some (
                  (
                    read__arguments_nullable
                  ) p lb
                )
              );
            | 1 ->
              field_ee_body := (
                Some (
                  (
                    read__field_list_bracket_nullable
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            ee_args = (match !field_ee_args with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "ee_args");
            ee_body = (match !field_ee_body with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "ee_body");
          }
         : enum_entry_definition)
      )
)
and enum_entry_definition_of_string s =
  read_enum_entry_definition (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_expr = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "L" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_literal
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `L x
            | "Container" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_container_operator
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_list_bracket
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Container x
            | "Comprehension" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_container_operator
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__comprehension_bracket
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Comprehension x
            | "Record" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__field_list_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Record x
            | "Constructor" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_name
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_list_bracket
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Constructor x
            | "N" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_name
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `N x
            | "IdSpecial" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__special_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `IdSpecial x
            | "Call" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_arguments
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Call x
            | "New" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_arguments
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `New x
            | "Xml" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_xml
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Xml x
            | "Assign" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Assign x
            | "AssignOp" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__operator_wrap
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `AssignOp x
            | "LetPattern" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `LetPattern x
            | "DotAccess" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_field_name
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `DotAccess x
            | "ArrayAccess" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_bracket
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ArrayAccess x
            | "SliceAccess" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__bracket_0ecc50b
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `SliceAccess x
            | "Lambda" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_function_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Lambda x
            | "AnonClass" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_class_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `AnonClass x
            | "Conditional" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Conditional x
            | "Yield" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_nullable
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            Atdgen_runtime.Oj_run.read_bool
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Yield x
            | "Await" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Await x
            | "Cast" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Cast x
            | "Seq" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__expr_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Seq x
            | "Ref" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Ref x
            | "DeRef" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `DeRef x
            | "Ellipsis" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Ellipsis x
            | "ParenExpr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__expr_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ParenExpr x
            | "StmtExpr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_stmt
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `StmtExpr x
            | "OtherExpr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherExpr x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "L" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_literal
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `L x
            | "Container" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_container_operator
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_list_bracket
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Container x
            | "Comprehension" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_container_operator
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__comprehension_bracket
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Comprehension x
            | "Record" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__field_list_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Record x
            | "Constructor" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_name
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_list_bracket
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Constructor x
            | "N" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_name
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `N x
            | "IdSpecial" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__special_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `IdSpecial x
            | "Call" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_arguments
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Call x
            | "New" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_arguments
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `New x
            | "Xml" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_xml
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Xml x
            | "Assign" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Assign x
            | "AssignOp" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__operator_wrap
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `AssignOp x
            | "LetPattern" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `LetPattern x
            | "DotAccess" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_field_name
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `DotAccess x
            | "ArrayAccess" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_bracket
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ArrayAccess x
            | "SliceAccess" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__bracket_0ecc50b
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `SliceAccess x
            | "Lambda" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_function_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Lambda x
            | "AnonClass" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_class_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `AnonClass x
            | "Conditional" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Conditional x
            | "Yield" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_nullable
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            Atdgen_runtime.Oj_run.read_bool
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Yield x
            | "Await" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Await x
            | "Cast" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Cast x
            | "Seq" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__expr_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Seq x
            | "Ref" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Ref x
            | "DeRef" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `DeRef x
            | "Ellipsis" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Ellipsis x
            | "ParenExpr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__expr_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ParenExpr x
            | "StmtExpr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_stmt
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `StmtExpr x
            | "OtherExpr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherExpr x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and expr_of_string s =
  read_expr (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_field = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "F" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_stmt
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `F x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "F" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_stmt
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `F x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and field_of_string s =
  read_field (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_field_name = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "FN" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_name
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `FN x
            | "FDynamic" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `FDynamic x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "FN" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_name
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `FN x
            | "FDynamic" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `FDynamic x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and field_name_of_string s =
  read_field_name (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_finally = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_stmt
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
and finally_of_string s =
  read_finally (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_for_each = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_pattern
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_expr
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
and for_each_of_string s =
  read_for_each (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_for_header = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "ForClassic" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__for_var_or_expr_list
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_nullable
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read__expr_nullable
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ForClassic x
            | "ForEach" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_for_each
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ForEach x
            | "MultiForEach" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__multi_for_each_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `MultiForEach x
            | "ForIn" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__for_var_or_expr_list
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ForIn x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "ForClassic" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__for_var_or_expr_list
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_nullable
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read__expr_nullable
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ForClassic x
            | "ForEach" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_for_each
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ForEach x
            | "MultiForEach" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__multi_for_each_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `MultiForEach x
            | "ForIn" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__for_var_or_expr_list
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ForIn x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and for_header_of_string s =
  read_for_header (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_for_or_if_comp = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "CompFor" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x3 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2, x3)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2; 3 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `CompFor x
            | "CompIf" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `CompIf x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "CompFor" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x3 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2, x3)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2; 3 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `CompFor x
            | "CompIf" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `CompIf x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and for_or_if_comp_of_string s =
  read_for_or_if_comp (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_for_var_or_expr = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "ForInitVar" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_entity
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_variable_definition
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ForInitVar x
            | "ForInitExpr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ForInitExpr x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "ForInitVar" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_entity
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_variable_definition
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ForInitVar x
            | "ForInitExpr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ForInitExpr x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and for_var_or_expr_of_string s =
  read_for_var_or_expr (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_function_body = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "FBStmt" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_stmt
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `FBStmt x
            | "FBExpr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `FBExpr x
            | "FBDecl" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_sc
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `FBDecl x
            | "FBNothing" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `FBNothing
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "FBNothing" ->
              `FBNothing
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "FBStmt" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_stmt
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `FBStmt x
            | "FBExpr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `FBExpr x
            | "FBDecl" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_sc
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `FBDecl x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and function_body_of_string s =
  read_function_body (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_function_definition = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_fkind = ref (None) in
    let field_fparams = ref (None) in
    let field_frettype = ref (None) in
    let field_fbody = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 5 -> (
                if String.unsafe_get s pos = 'f' then (
                  match String.unsafe_get s (pos+1) with
                    | 'b' -> (
                        if String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'y' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | 'k' -> (
                        if String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'd' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
                else (
                  -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'y' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'e' then (
                  2
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_fkind := (
              Some (
                (
                  read__function_kind_wrap
                ) p lb
              )
            );
          | 1 ->
            field_fparams := (
              Some (
                (
                  read_parameters
                ) p lb
              )
            );
          | 2 ->
            field_frettype := (
              Some (
                (
                  read__type_nullable
                ) p lb
              )
            );
          | 3 ->
            field_fbody := (
              Some (
                (
                  read_function_body
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 5 -> (
                  if String.unsafe_get s pos = 'f' then (
                    match String.unsafe_get s (pos+1) with
                      | 'b' -> (
                          if String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'y' then (
                            3
                          )
                          else (
                            -1
                          )
                        )
                      | 'k' -> (
                          if String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'd' then (
                            0
                          )
                          else (
                            -1
                          )
                        )
                      | _ -> (
                          -1
                        )
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'y' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'e' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_fkind := (
                Some (
                  (
                    read__function_kind_wrap
                  ) p lb
                )
              );
            | 1 ->
              field_fparams := (
                Some (
                  (
                    read_parameters
                  ) p lb
                )
              );
            | 2 ->
              field_frettype := (
                Some (
                  (
                    read__type_nullable
                  ) p lb
                )
              );
            | 3 ->
              field_fbody := (
                Some (
                  (
                    read_function_body
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            fkind = (match !field_fkind with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "fkind");
            fparams = (match !field_fparams with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "fparams");
            frettype = (match !field_frettype with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "frettype");
            fbody = (match !field_fbody with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "fbody");
          }
         : function_definition)
      )
)
and function_definition_of_string s =
  read_function_definition (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_id_info = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_id_resolved = ref (None) in
    let field_id_type = ref (None) in
    let field_id_svalue = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 7 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'y' && String.unsafe_get s (pos+5) = 'p' && String.unsafe_get s (pos+6) = 'e' then (
                  1
                )
                else (
                  -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'v' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'e' then (
                  2
                )
                else (
                  -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'v' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'd' then (
                  0
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_id_resolved := (
                Some (
                  (
                    read_resolved_name
                  ) p lb
                )
              );
            )
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_id_type := (
                Some (
                  (
                    read_type_
                  ) p lb
                )
              );
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_id_svalue := (
                Some (
                  (
                    read_svalue
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 7 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'y' && String.unsafe_get s (pos+5) = 'p' && String.unsafe_get s (pos+6) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'v' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'e' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'v' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_id_resolved := (
                  Some (
                    (
                      read_resolved_name
                    ) p lb
                  )
                );
              )
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_id_type := (
                  Some (
                    (
                      read_type_
                    ) p lb
                  )
                );
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_id_svalue := (
                  Some (
                    (
                      read_svalue
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            id_resolved = !field_id_resolved;
            id_type = !field_id_type;
            id_svalue = !field_id_svalue;
          }
         : id_info)
      )
)
and id_info_of_string s =
  read_id_info (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_item p lb = (
  read_stmt
) p lb
and item_of_string s =
  read_item (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_label_ident = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "LNone" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `LNone
            | "LId" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_label
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `LId x
            | "LInt" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__int_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `LInt x
            | "LDynamic" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `LDynamic x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "LNone" ->
              `LNone
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "LId" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_label
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `LId x
            | "LInt" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__int_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `LInt x
            | "LDynamic" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `LDynamic x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and label_ident_of_string s =
  read_label_ident (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_macro_definition = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_macroparams = ref (None) in
    let field_macrobody = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 9 -> (
                if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'y' then (
                  1
                )
                else (
                  -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'p' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'm' && String.unsafe_get s (pos+10) = 's' then (
                  0
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_macroparams := (
              Some (
                (
                  read__ident_list
                ) p lb
              )
            );
          | 1 ->
            field_macrobody := (
              Some (
                (
                  read__any_list
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 9 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'y' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'p' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'm' && String.unsafe_get s (pos+10) = 's' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_macroparams := (
                Some (
                  (
                    read__ident_list
                  ) p lb
                )
              );
            | 1 ->
              field_macrobody := (
                Some (
                  (
                    read__any_list
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            macroparams = (match !field_macroparams with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "macroparams");
            macrobody = (match !field_macrobody with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "macrobody");
          }
         : macro_definition)
      )
)
and macro_definition_of_string s =
  read_macro_definition (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_module_definition = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_mbody = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          if len = 5 && String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'y' then (
            0
          )
          else (
            -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_mbody := (
              Some (
                (
                  read_module_definition_kind
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 5 && String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'y' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_mbody := (
                Some (
                  (
                    read_module_definition_kind
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            mbody = (match !field_mbody with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "mbody");
          }
         : module_definition)
      )
)
and module_definition_of_string s =
  read_module_definition (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_module_definition_kind = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "ModuleAlias" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_dotted_ident
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ModuleAlias x
            | "ModuleStruct" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__dotted_ident_nullable
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__item_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ModuleStruct x
            | "OtherModule" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherModule x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "ModuleAlias" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_dotted_ident
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ModuleAlias x
            | "ModuleStruct" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__dotted_ident_nullable
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__item_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ModuleStruct x
            | "OtherModule" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherModule x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and module_definition_kind_of_string s =
  read_module_definition_kind (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_multi_for_each = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "FE" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_for_each
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `FE x
            | "FECond" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_for_each
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `FECond x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "FE" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_for_each
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `FE x
            | "FECond" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_for_each
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `FECond x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and multi_for_each_of_string s =
  read_multi_for_each (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_name = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Id" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_id_info
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Id x
            | "IdQualified" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_qualified_info
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `IdQualified x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Id" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_id_info
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Id x
            | "IdQualified" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_qualified_info
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `IdQualified x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and name_of_string s =
  read_name (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_or_type_element = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "OrConstructor" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__type_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OrConstructor x
            | "OrEnum" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_nullable
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OrEnum x
            | "OrUnion" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OrUnion x
            | "OtherOr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherOr x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "OrConstructor" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__type_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OrConstructor x
            | "OrEnum" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_nullable
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OrEnum x
            | "OrUnion" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OrUnion x
            | "OtherOr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherOr x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and or_type_element_of_string s =
  read_or_type_element (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_parameter = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "ParamClassic" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_parameter_classic
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ParamClassic x
            | "ParamPattern" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_pattern
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ParamPattern x
            | "ParamRest" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_parameter_classic
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ParamRest x
            | "ParamHashSplat" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_parameter_classic
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ParamHashSplat x
            | "OtherParam" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherParam x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "ParamClassic" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_parameter_classic
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ParamClassic x
            | "ParamPattern" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_pattern
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ParamPattern x
            | "ParamRest" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_parameter_classic
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ParamRest x
            | "ParamHashSplat" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_parameter_classic
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ParamHashSplat x
            | "OtherParam" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherParam x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and parameter_of_string s =
  read_parameter (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_parameter_classic = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_pname = ref (None) in
    let field_ptype = ref (None) in
    let field_pdefault = ref (None) in
    let field_pattrs = ref (None) in
    let field_pinfo = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 5 -> (
                if String.unsafe_get s pos = 'p' then (
                  match String.unsafe_get s (pos+1) with
                    | 'i' -> (
                        if String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'f' && String.unsafe_get s (pos+4) = 'o' then (
                          4
                        )
                        else (
                          -1
                        )
                      )
                    | 'n' -> (
                        if String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'e' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | 't' -> (
                        if String.unsafe_get s (pos+2) = 'y' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'e' then (
                          1
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
                else (
                  -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 's' then (
                  3
                )
                else (
                  -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'd' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'f' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 't' then (
                  2
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_pname := (
              Some (
                (
                  read__ident_nullable
                ) p lb
              )
            );
          | 1 ->
            field_ptype := (
              Some (
                (
                  read__type_nullable
                ) p lb
              )
            );
          | 2 ->
            field_pdefault := (
              Some (
                (
                  read__expr_nullable
                ) p lb
              )
            );
          | 3 ->
            field_pattrs := (
              Some (
                (
                  read__attribute_list
                ) p lb
              )
            );
          | 4 ->
            field_pinfo := (
              Some (
                (
                  read_id_info
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 5 -> (
                  if String.unsafe_get s pos = 'p' then (
                    match String.unsafe_get s (pos+1) with
                      | 'i' -> (
                          if String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'f' && String.unsafe_get s (pos+4) = 'o' then (
                            4
                          )
                          else (
                            -1
                          )
                        )
                      | 'n' -> (
                          if String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'e' then (
                            0
                          )
                          else (
                            -1
                          )
                        )
                      | 't' -> (
                          if String.unsafe_get s (pos+2) = 'y' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'e' then (
                            1
                          )
                          else (
                            -1
                          )
                        )
                      | _ -> (
                          -1
                        )
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 's' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'd' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'f' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 't' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_pname := (
                Some (
                  (
                    read__ident_nullable
                  ) p lb
                )
              );
            | 1 ->
              field_ptype := (
                Some (
                  (
                    read__type_nullable
                  ) p lb
                )
              );
            | 2 ->
              field_pdefault := (
                Some (
                  (
                    read__expr_nullable
                  ) p lb
                )
              );
            | 3 ->
              field_pattrs := (
                Some (
                  (
                    read__attribute_list
                  ) p lb
                )
              );
            | 4 ->
              field_pinfo := (
                Some (
                  (
                    read_id_info
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            pname = (match !field_pname with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "pname");
            ptype = (match !field_ptype with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "ptype");
            pdefault = (match !field_pdefault with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "pdefault");
            pattrs = (match !field_pattrs with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "pattrs");
            pinfo = (match !field_pinfo with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "pinfo");
          }
         : parameter_classic)
      )
)
and parameter_classic_of_string s =
  read_parameter_classic (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_parameters p lb = (
  read__parameter_list
) p lb
and parameters_of_string s =
  read_parameters (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_pattern = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "PatLiteral" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_literal
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PatLiteral x
            | "PatConstructor" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_name
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__pattern_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PatConstructor x
            | "PatRecord" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__dotted_ident_pattern_list_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PatRecord x
            | "PatId" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_id_info
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PatId x
            | "PatTuple" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__pattern_list_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PatTuple x
            | "PatList" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__pattern_list_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PatList x
            | "PatKeyVal" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PatKeyVal x
            | "PatWildcard" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PatWildcard x
            | "PatDisj" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PatDisj x
            | "PatTyped" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PatTyped x
            | "PatWhen" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PatWhen x
            | "PatAs" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            fun p lb ->
                              Yojson.Safe.read_space p lb;
                              let std_tuple = Yojson.Safe.start_any_tuple p lb in
                              let len = ref 0 in
                              let end_of_tuple = ref false in
                              (try
                                let x0 =
                                  let x =
                                    (
                                      read_ident
                                    ) p lb
                                  in
                                  incr len;
                                  Yojson.Safe.read_space p lb;
                                  Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                                  x
                                in
                                let x1 =
                                  let x =
                                    (
                                      read_id_info
                                    ) p lb
                                  in
                                  incr len;
                                  (try
                                    Yojson.Safe.read_space p lb;
                                    Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                                  with Yojson.End_of_tuple -> end_of_tuple := true);
                                  x
                                in
                                if not !end_of_tuple then (
                                  try
                                    while true do
                                      Yojson.Safe.skip_json p lb;
                                      Yojson.Safe.read_space p lb;
                                      Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                                    done
                                  with Yojson.End_of_tuple -> ()
                                );
                                (x0, x1)
                              with Yojson.End_of_tuple ->
                                Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PatAs x
            | "PatType" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `PatType x
            | "OtherPat" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherPat x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "PatLiteral" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_literal
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `PatLiteral x
            | "PatConstructor" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_name
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__pattern_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `PatConstructor x
            | "PatRecord" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__dotted_ident_pattern_list_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `PatRecord x
            | "PatId" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_id_info
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `PatId x
            | "PatTuple" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__pattern_list_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `PatTuple x
            | "PatList" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__pattern_list_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `PatList x
            | "PatKeyVal" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `PatKeyVal x
            | "PatWildcard" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `PatWildcard x
            | "PatDisj" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `PatDisj x
            | "PatTyped" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `PatTyped x
            | "PatWhen" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `PatWhen x
            | "PatAs" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_pattern
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            fun p lb ->
                              Yojson.Safe.read_space p lb;
                              let std_tuple = Yojson.Safe.start_any_tuple p lb in
                              let len = ref 0 in
                              let end_of_tuple = ref false in
                              (try
                                let x0 =
                                  let x =
                                    (
                                      read_ident
                                    ) p lb
                                  in
                                  incr len;
                                  Yojson.Safe.read_space p lb;
                                  Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                                  x
                                in
                                let x1 =
                                  let x =
                                    (
                                      read_id_info
                                    ) p lb
                                  in
                                  incr len;
                                  (try
                                    Yojson.Safe.read_space p lb;
                                    Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                                  with Yojson.End_of_tuple -> end_of_tuple := true);
                                  x
                                in
                                if not !end_of_tuple then (
                                  try
                                    while true do
                                      Yojson.Safe.skip_json p lb;
                                      Yojson.Safe.read_space p lb;
                                      Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                                    done
                                  with Yojson.End_of_tuple -> ()
                                );
                                (x0, x1)
                              with Yojson.End_of_tuple ->
                                Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `PatAs x
            | "PatType" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `PatType x
            | "OtherPat" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherPat x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and pattern_of_string s =
  read_pattern (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_qualified_info = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_name_last = ref (None) in
    let field_name_middle = ref (None) in
    let field_name_top = ref (None) in
    let field_name_info = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 8 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'p' then (
                  2
                )
                else (
                  -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' then (
                  match String.unsafe_get s (pos+5) with
                    | 'i' -> (
                        if String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'f' && String.unsafe_get s (pos+8) = 'o' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | 'l' -> (
                        if String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 't' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
                else (
                  -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = 'l' && String.unsafe_get s (pos+10) = 'e' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_name_last := (
              Some (
                (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__type_arguments_nullable
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              )
            );
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_name_middle := (
                Some (
                  (
                    read_qualifier
                  ) p lb
                )
              );
            )
          | 2 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_name_top := (
                Some (
                  (
                    read_tok
                  ) p lb
                )
              );
            )
          | 3 ->
            field_name_info := (
              Some (
                (
                  read_id_info
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 8 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'p' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' then (
                    match String.unsafe_get s (pos+5) with
                      | 'i' -> (
                          if String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'f' && String.unsafe_get s (pos+8) = 'o' then (
                            3
                          )
                          else (
                            -1
                          )
                        )
                      | 'l' -> (
                          if String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 't' then (
                            0
                          )
                          else (
                            -1
                          )
                        )
                      | _ -> (
                          -1
                        )
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = 'l' && String.unsafe_get s (pos+10) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_name_last := (
                Some (
                  (
                    fun p lb ->
                      Yojson.Safe.read_space p lb;
                      let std_tuple = Yojson.Safe.start_any_tuple p lb in
                      let len = ref 0 in
                      let end_of_tuple = ref false in
                      (try
                        let x0 =
                          let x =
                            (
                              read_ident
                            ) p lb
                          in
                          incr len;
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          x
                        in
                        let x1 =
                          let x =
                            (
                              read__type_arguments_nullable
                            ) p lb
                          in
                          incr len;
                          (try
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          with Yojson.End_of_tuple -> end_of_tuple := true);
                          x
                        in
                        if not !end_of_tuple then (
                          try
                            while true do
                              Yojson.Safe.skip_json p lb;
                              Yojson.Safe.read_space p lb;
                              Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                            done
                          with Yojson.End_of_tuple -> ()
                        );
                        (x0, x1)
                      with Yojson.End_of_tuple ->
                        Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                  ) p lb
                )
              );
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_name_middle := (
                  Some (
                    (
                      read_qualifier
                    ) p lb
                  )
                );
              )
            | 2 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_name_top := (
                  Some (
                    (
                      read_tok
                    ) p lb
                  )
                );
              )
            | 3 ->
              field_name_info := (
                Some (
                  (
                    read_id_info
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            name_last = (match !field_name_last with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "name_last");
            name_middle = !field_name_middle;
            name_top = !field_name_top;
            name_info = (match !field_name_info with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "name_info");
          }
         : qualified_info)
      )
)
and qualified_info_of_string s =
  read_qualified_info (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_qualifier = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "QDots" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__ident_type_arguments_nullable_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `QDots x
            | "QExpr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `QExpr x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "QDots" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__ident_type_arguments_nullable_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `QDots x
            | "QExpr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `QExpr x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and qualifier_of_string s =
  read_qualifier (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_stmt = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "ExprStmt" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_sc
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `ExprStmt x
            | "Block" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__stmt_list_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Block x
            | "If" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_condition
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x3 =
                        let x =
                          (
                            read__stmt_nullable
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2, x3)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2; 3 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `If x
            | "While" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_condition
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `While x
            | "Return" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_nullable
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_sc
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Return x
            | "DoWhile" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `DoWhile x
            | "For" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_for_header
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `For x
            | "Switch" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__condition_nullable
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read__case_and_body_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Switch x
            | "Continue" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_label_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_sc
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Continue x
            | "Break" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_label_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_sc
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Break x
            | "Label" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_label
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Label x
            | "Goto" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_label
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Goto x
            | "Throw" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_sc
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Throw x
            | "Try" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read__catch_list
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x3 =
                        let x =
                          (
                            read__finally_nullable
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2, x3)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2; 3 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Try x
            | "WithUsingResource" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__stmt_list
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `WithUsingResource x
            | "Assert" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_arguments
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_sc
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Assert x
            | "DefStmt" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `DefStmt x
            | "DirectiveStmt" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_directive
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `DirectiveStmt x
            | "OtherStmt" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherStmt x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "ExprStmt" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_sc
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `ExprStmt x
            | "Block" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__stmt_list_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Block x
            | "If" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_condition
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x3 =
                        let x =
                          (
                            read__stmt_nullable
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2, x3)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2; 3 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `If x
            | "While" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_condition
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `While x
            | "Return" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__expr_nullable
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_sc
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Return x
            | "DoWhile" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `DoWhile x
            | "For" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_for_header
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `For x
            | "Switch" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__condition_nullable
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read__case_and_body_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Switch x
            | "Continue" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_label_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_sc
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Continue x
            | "Break" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_label_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_sc
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Break x
            | "Label" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_label
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Label x
            | "Goto" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_label
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Goto x
            | "Throw" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_expr
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_sc
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Throw x
            | "Try" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read__catch_list
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x3 =
                        let x =
                          (
                            read__finally_nullable
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2, x3)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2; 3 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Try x
            | "WithUsingResource" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__stmt_list
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_stmt
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `WithUsingResource x
            | "Assert" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_arguments
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_sc
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Assert x
            | "DefStmt" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_definition
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `DefStmt x
            | "DirectiveStmt" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_directive
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `DirectiveStmt x
            | "OtherStmt" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherStmt x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and stmt_of_string s =
  read_stmt (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_svalue = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "Lit" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_literal
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Lit x
            | "Cst" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_const_type
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Cst x
            | "Sym" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Sym x
            | "NotCst" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `NotCst
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | "NotCst" ->
              `NotCst
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "Lit" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_literal
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Lit x
            | "Cst" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_const_type
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Cst x
            | "Sym" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Sym x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and svalue_of_string s =
  read_svalue (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_type_ = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "TyN" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_name
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TyN x
            | "TyApply" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_arguments
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TyApply x
            | "TyFun" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__parameter_list
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TyFun x
            | "TyArray" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__expr_nullable_bracket
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TyArray x
            | "TyTuple" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__type_list_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TyTuple x
            | "TyVar" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_ident
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TyVar x
            | "TyAny" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TyAny x
            | "TyPointer" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TyPointer x
            | "TyRef" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TyRef x
            | "TyQuestion" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TyQuestion x
            | "TyRest" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TyRest x
            | "TyAnd" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TyAnd x
            | "TyOr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TyOr x
            | "TyRecordAnon" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__class_kind_wrap
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__field_list_bracket
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TyRecordAnon x
            | "TyExpr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TyExpr x
            | "OtherType" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherType x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "TyN" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_name
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TyN x
            | "TyApply" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_arguments
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TyApply x
            | "TyFun" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__parameter_list
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TyFun x
            | "TyArray" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__expr_nullable_bracket
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TyArray x
            | "TyTuple" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__type_list_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TyTuple x
            | "TyVar" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_ident
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TyVar x
            | "TyAny" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TyAny x
            | "TyPointer" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TyPointer x
            | "TyRef" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TyRef x
            | "TyQuestion" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TyQuestion x
            | "TyRest" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TyRest x
            | "TyAnd" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TyAnd x
            | "TyOr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_type_
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TyOr x
            | "TyRecordAnon" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read__class_kind_wrap
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__field_list_bracket
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TyRecordAnon x
            | "TyExpr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TyExpr x
            | "OtherType" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherType x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and type__of_string s =
  read_type_ (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_type_argument = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "TA" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TA x
            | "TAWildcard" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__bool_wrap_type_nullable
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TAWildcard x
            | "TAExpr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TAExpr x
            | "OtherTypeArg" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherTypeArg x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "TA" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TA x
            | "TAWildcard" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__bool_wrap_type_nullable
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TAWildcard x
            | "TAExpr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_expr
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TAExpr x
            | "OtherTypeArg" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherTypeArg x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and type_argument_of_string s =
  read_type_argument (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_type_arguments p lb = (
  read__type_argument_list_bracket
) p lb
and type_arguments_of_string s =
  read_type_arguments (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_type_definition = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_tbody = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          if len = 5 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'y' then (
            0
          )
          else (
            -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_tbody := (
              Some (
                (
                  read_type_definition_kind
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 5 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'y' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_tbody := (
                Some (
                  (
                    read_type_definition_kind
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            tbody = (match !field_tbody with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "tbody");
          }
         : type_definition)
      )
)
and type_definition_of_string s =
  read_type_definition (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_type_definition_kind = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "OrType" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__or_type_element_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OrType x
            | "AndType" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__field_list_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `AndType x
            | "AliasType" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `AliasType x
            | "NewType" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `NewType x
            | "AbstractType" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `AbstractType x
            | "Exception" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__type_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `Exception x
            | "OtherTypeKind" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherTypeKind x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "OrType" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__or_type_element_list
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OrType x
            | "AndType" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__field_list_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `AndType x
            | "AliasType" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `AliasType x
            | "NewType" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_type_
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `NewType x
            | "AbstractType" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_tok
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `AbstractType x
            | "Exception" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__type_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `Exception x
            | "OtherTypeKind" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherTypeKind x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and type_definition_kind_of_string s =
  read_type_definition_kind (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_type_parameter = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "TP" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_type_parameter_classic
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `TP x
            | "OtherTypeParam" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `OtherTypeParam x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "TP" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_type_parameter_classic
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `TP x
            | "OtherTypeParam" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_todo_kind
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read__any_list
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `OtherTypeParam x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and type_parameter_of_string s =
  read_type_parameter (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_type_parameter_classic = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_tp_id = ref (None) in
    let field_tp_attrs = ref (None) in
    let field_tp_bounds = ref (None) in
    let field_tp_default = ref (None) in
    let field_tp_variance = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 5 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'd' then (
                  0
                )
                else (
                  -1
                )
              )
            | 8 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'b' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 's' then (
                  2
                )
                else (
                  -1
                )
              )
            | 10 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'f' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'l' && String.unsafe_get s (pos+9) = 't' then (
                  3
                )
                else (
                  -1
                )
              )
            | 11 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'v' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'e' then (
                  4
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_tp_id := (
              Some (
                (
                  read_ident
                ) p lb
              )
            );
          | 1 ->
            field_tp_attrs := (
              Some (
                (
                  read__attribute_list
                ) p lb
              )
            );
          | 2 ->
            field_tp_bounds := (
              Some (
                (
                  read__type_list
                ) p lb
              )
            );
          | 3 ->
            field_tp_default := (
              Some (
                (
                  read__type_nullable
                ) p lb
              )
            );
          | 4 ->
            field_tp_variance := (
              Some (
                (
                  read__variance_wrap_nullable
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 5 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'b' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 's' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 10 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'f' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'l' && String.unsafe_get s (pos+9) = 't' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'v' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'a' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'e' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_tp_id := (
                Some (
                  (
                    read_ident
                  ) p lb
                )
              );
            | 1 ->
              field_tp_attrs := (
                Some (
                  (
                    read__attribute_list
                  ) p lb
                )
              );
            | 2 ->
              field_tp_bounds := (
                Some (
                  (
                    read__type_list
                  ) p lb
                )
              );
            | 3 ->
              field_tp_default := (
                Some (
                  (
                    read__type_nullable
                  ) p lb
                )
              );
            | 4 ->
              field_tp_variance := (
                Some (
                  (
                    read__variance_wrap_nullable
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            tp_id = (match !field_tp_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "tp_id");
            tp_attrs = (match !field_tp_attrs with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "tp_attrs");
            tp_bounds = (match !field_tp_bounds with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "tp_bounds");
            tp_default = (match !field_tp_default with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "tp_default");
            tp_variance = (match !field_tp_variance with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "tp_variance");
          }
         : type_parameter_classic)
      )
)
and type_parameter_classic_of_string s =
  read_type_parameter_classic (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_type_parameters p lb = (
  read__type_parameter_list
) p lb
and type_parameters_of_string s =
  read_type_parameters (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_variable_definition = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_vinit = ref (None) in
    let field_vtype = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          if len = 5 && String.unsafe_get s pos = 'v' then (
            match String.unsafe_get s (pos+1) with
              | 'i' -> (
                  if String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 't' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 't' -> (
                  if String.unsafe_get s (pos+2) = 'y' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
          )
          else (
            -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_vinit := (
                Some (
                  (
                    read_expr
                  ) p lb
                )
              );
            )
          | 1 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_vtype := (
                Some (
                  (
                    read_type_
                  ) p lb
                )
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 5 && String.unsafe_get s pos = 'v' then (
              match String.unsafe_get s (pos+1) with
                | 'i' -> (
                    if String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 't' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 't' -> (
                    if String.unsafe_get s (pos+2) = 'y' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'e' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_vinit := (
                  Some (
                    (
                      read_expr
                    ) p lb
                  )
                );
              )
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_vtype := (
                  Some (
                    (
                      read_type_
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            vinit = !field_vinit;
            vtype = !field_vtype;
          }
         : variable_definition)
      )
)
and variable_definition_of_string s =
  read_variable_definition (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_xml = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_xml_kind = ref (None) in
    let field_xml_attrs = ref (None) in
    let field_xml_body = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 8 -> (
                if String.unsafe_get s pos = 'x' && String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = '_' then (
                  match String.unsafe_get s (pos+4) with
                    | 'b' -> (
                        if String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = 'y' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | 'k' -> (
                        if String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'd' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
                else (
                  -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 'x' && String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_xml_kind := (
              Some (
                (
                  read_xml_kind
                ) p lb
              )
            );
          | 1 ->
            field_xml_attrs := (
              Some (
                (
                  read__xml_attribute_list
                ) p lb
              )
            );
          | 2 ->
            field_xml_body := (
              Some (
                (
                  read__xml_body_list
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 8 -> (
                  if String.unsafe_get s pos = 'x' && String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = '_' then (
                    match String.unsafe_get s (pos+4) with
                      | 'b' -> (
                          if String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = 'y' then (
                            2
                          )
                          else (
                            -1
                          )
                        )
                      | 'k' -> (
                          if String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'd' then (
                            0
                          )
                          else (
                            -1
                          )
                        )
                      | _ -> (
                          -1
                        )
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'x' && String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_xml_kind := (
                Some (
                  (
                    read_xml_kind
                  ) p lb
                )
              );
            | 1 ->
              field_xml_attrs := (
                Some (
                  (
                    read__xml_attribute_list
                  ) p lb
                )
              );
            | 2 ->
              field_xml_body := (
                Some (
                  (
                    read__xml_body_list
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            xml_kind = (match !field_xml_kind with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "xml_kind");
            xml_attrs = (match !field_xml_attrs with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "xml_attrs");
            xml_body = (match !field_xml_body with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "xml_body");
          }
         : xml)
      )
)
and xml_of_string s =
  read_xml (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_xml_attr_value p lb = (
  read_expr
) p lb
and xml_attr_value_of_string s =
  read_xml_attr_value (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_xml_attribute = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "XmlAttr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_xml_attr_value
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `XmlAttr x
            | "XmlAttrExpr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__expr_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `XmlAttrExpr x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "XmlAttr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  fun p lb ->
                    Yojson.Safe.read_space p lb;
                    let std_tuple = Yojson.Safe.start_any_tuple p lb in
                    let len = ref 0 in
                    let end_of_tuple = ref false in
                    (try
                      let x0 =
                        let x =
                          (
                            read_ident
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x1 =
                        let x =
                          (
                            read_tok
                          ) p lb
                        in
                        incr len;
                        Yojson.Safe.read_space p lb;
                        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        x
                      in
                      let x2 =
                        let x =
                          (
                            read_xml_attr_value
                          ) p lb
                        in
                        incr len;
                        (try
                          Yojson.Safe.read_space p lb;
                          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                        with Yojson.End_of_tuple -> end_of_tuple := true);
                        x
                      in
                      if not !end_of_tuple then (
                        try
                          while true do
                            Yojson.Safe.skip_json p lb;
                            Yojson.Safe.read_space p lb;
                            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
                          done
                        with Yojson.End_of_tuple -> ()
                      );
                      (x0, x1, x2)
                    with Yojson.End_of_tuple ->
                      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `XmlAttr x
            | "XmlAttrExpr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__expr_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `XmlAttrExpr x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and xml_attribute_of_string s =
  read_xml_attribute (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
and read_xml_body = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
      | `Edgy_bracket -> (
          match Yojson.Safe.read_ident p lb with
            | "XmlText" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__string_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `XmlText x
            | "XmlExpr" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read__expr_nullable_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `XmlExpr x
            | "XmlXml" ->
              Atdgen_runtime.Oj_run.read_until_field_value p lb;
              let x = (
                  read_xml
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_gt p lb;
              `XmlXml x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Double_quote -> (
          match Yojson.Safe.finish_string p lb with
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
      | `Square_bracket -> (
          match Atdgen_runtime.Oj_run.read_string p lb with
            | "XmlText" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__string_wrap
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `XmlText x
            | "XmlExpr" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read__expr_nullable_bracket
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `XmlExpr x
            | "XmlXml" ->
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_comma p lb;
              Yojson.Safe.read_space p lb;
              let x = (
                  read_xml
                ) p lb
              in
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_rbr p lb;
              `XmlXml x
            | x ->
              Atdgen_runtime.Oj_run.invalid_variant_tag p x
        )
)
and xml_body_of_string s =
  read_xml_body (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_wrap_ write__a = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _ = x in
    (
      write__a
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of_wrap_ write__a ?(len = 1024) x =
  let ob = Buffer.create len in
  write_wrap_ write__a ob x;
  Buffer.contents ob
let read_wrap_ read__a = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read__a
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
)
let wrap__of_string read__a s =
  read_wrap_ read__a (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_program = (
  write__item_list
)
let string_of_program ?(len = 1024) x =
  let ob = Buffer.create len in
  write_program ob x;
  Buffer.contents ob
let read_program = (
  read__item_list
)
let program_of_string s =
  read_program (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_bracket write__a = (
  fun ob x ->
    Buffer.add_char ob '[';
    (let x, _, _ = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, x, _ = x in
    (
      write__a
    ) ob x
    );
    Buffer.add_char ob ',';
    (let _, _, x = x in
    (
      write_tok
    ) ob x
    );
    Buffer.add_char ob ']';
)
let string_of_bracket write__a ?(len = 1024) x =
  let ob = Buffer.create len in
  write_bracket write__a ob x;
  Buffer.contents ob
let read_bracket read__a = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    (try
      let x0 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x =
          (
            read__a
          ) p lb
        in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x2 =
        let x =
          (
            read_tok
          ) p lb
        in
        incr len;
        (try
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      if not !end_of_tuple then (
        try
          while true do
            Yojson.Safe.skip_json p lb;
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          done
        with Yojson.End_of_tuple -> ()
      );
      (x0, x1, x2)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1; 2 ]);
)
let bracket_of_string read__a s =
  read_bracket read__a (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
