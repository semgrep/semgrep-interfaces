(* Auto-generated from "ast_generic_v0.atd" *)
[@@@ocaml.warning "-27-32-33-35-39"]

type class_kind = Ast_generic_v0_t.class_kind

type concat_string_kind = Ast_generic_v0_t.concat_string_kind

type const_type = Ast_generic_v0_t.const_type

type container_operator = Ast_generic_v0_t.container_operator

type function_kind = Ast_generic_v0_t.function_kind

type incr_decr = Ast_generic_v0_t.incr_decr

type keyword_attribute = Ast_generic_v0_t.keyword_attribute

type operator = Ast_generic_v0_t.operator

type prefix_postfix = Ast_generic_v0_t.prefix_postfix

type sid = Ast_generic_v0_t.sid

type special = Ast_generic_v0_t.special

type token_location = Ast_generic_v0_t.token_location = {
  str: string;
  charpos: int;
  line: int;
  column: int;
  filename: string
}

type token = Ast_generic_v0_t.token

type tok = Ast_generic_v0_t.tok

type 'a bracket = 'a Ast_generic_v0_t.bracket

type sc = Ast_generic_v0_t.sc

type 'a wrap_ = 'a Ast_generic_v0_t.wrap_

type ident = Ast_generic_v0_t.ident

type dotted_ident = Ast_generic_v0_t.dotted_ident

type label = Ast_generic_v0_t.label

type literal = Ast_generic_v0_t.literal

type constness = Ast_generic_v0_t.constness

type module_name = Ast_generic_v0_t.module_name

type resolved_name_kind = Ast_generic_v0_t.resolved_name_kind

type resolved_name = Ast_generic_v0_t.resolved_name

type xml_kind = Ast_generic_v0_t.xml_kind

type action = Ast_generic_v0_t.action

and alias = Ast_generic_v0_t.alias

and any = Ast_generic_v0_t.any

and argument = Ast_generic_v0_t.argument

and arguments = Ast_generic_v0_t.arguments

and attribute = Ast_generic_v0_t.attribute

and case = Ast_generic_v0_t.case

and case_and_body = Ast_generic_v0_t.case_and_body

and catch = Ast_generic_v0_t.catch

and class_definition = Ast_generic_v0_t.class_definition = {
  ckind: class_kind wrap_;
  cextends: type_ list;
  cimplements: type_ list;
  cmixins: type_ list;
  cparams: parameters;
  cbody: field list bracket
}

and definition = Ast_generic_v0_t.definition

and definition_kind = Ast_generic_v0_t.definition_kind

and directive = Ast_generic_v0_t.directive

and entity = Ast_generic_v0_t.entity = {
  name: name_or_dynamic;
  attrs: attribute list;
  tparams: type_parameter list
}

and expr = Ast_generic_v0_t.expr

and field = Ast_generic_v0_t.field

and finally = Ast_generic_v0_t.finally

and for_header = Ast_generic_v0_t.for_header

and for_var_or_expr = Ast_generic_v0_t.for_var_or_expr

and function_definition = Ast_generic_v0_t.function_definition = {
  fkind: function_kind wrap_;
  fparams: parameters;
  frettype: type_ option;
  fbody: stmt
}

and id_info = Ast_generic_v0_t.id_info = {
  id_resolved: resolved_name option;
  id_type: type_ option;
  id_constness: constness option
}

and item = Ast_generic_v0_t.item

and label_ident = Ast_generic_v0_t.label_ident

and macro_definition = Ast_generic_v0_t.macro_definition = {
  macroparams: ident list;
  macrobody: any list
}

and module_definition = Ast_generic_v0_t.module_definition = {
  mbody: module_definition_kind
}

and module_definition_kind = Ast_generic_v0_t.module_definition_kind

and name = Ast_generic_v0_t.name

and name_info = Ast_generic_v0_t.name_info = {
  name_qualifier: qualifier option;
  name_typeargs: type_arguments option
}

and name_or_dynamic = Ast_generic_v0_t.name_or_dynamic

and or_type_element = Ast_generic_v0_t.or_type_element

and parameter = Ast_generic_v0_t.parameter

and parameter_classic = Ast_generic_v0_t.parameter_classic = {
  pname: ident option;
  ptype: type_ option;
  pdefault: expr option;
  pattrs: attribute list;
  pinfo: id_info
}

and parameters = Ast_generic_v0_t.parameters

and pattern = Ast_generic_v0_t.pattern

and qualifier = Ast_generic_v0_t.qualifier

and stmt = Ast_generic_v0_t.stmt = { s: stmt_kind; s_id: int }

and stmt_kind = Ast_generic_v0_t.stmt_kind

and type_ = Ast_generic_v0_t.type_

and type_argument = Ast_generic_v0_t.type_argument

and type_arguments = Ast_generic_v0_t.type_arguments

and type_definition = Ast_generic_v0_t.type_definition = {
  tbody: type_definition_kind
}

and type_definition_kind = Ast_generic_v0_t.type_definition_kind

and type_parameter = Ast_generic_v0_t.type_parameter

and type_parameter_constraint = Ast_generic_v0_t.type_parameter_constraint

and variable_definition = Ast_generic_v0_t.variable_definition = {
  vinit: expr option;
  vtype: type_ option
}

and xml = Ast_generic_v0_t.xml = {
  xml_kind: xml_kind;
  xml_attrs: xml_attribute list;
  xml_body: xml_body list
}

and xml_attr_value = Ast_generic_v0_t.xml_attr_value

and xml_attribute = Ast_generic_v0_t.xml_attribute

and xml_body = Ast_generic_v0_t.xml_body

type program = Ast_generic_v0_t.program

val write_class_kind :
  Bi_outbuf.t -> class_kind -> unit
  (** Output a JSON value of type {!type:class_kind}. *)

val string_of_class_kind :
  ?len:int -> class_kind -> string
  (** Serialize a value of type {!type:class_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_class_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> class_kind
  (** Input JSON data of type {!type:class_kind}. *)

val class_kind_of_string :
  string -> class_kind
  (** Deserialize JSON data of type {!type:class_kind}. *)

val write_concat_string_kind :
  Bi_outbuf.t -> concat_string_kind -> unit
  (** Output a JSON value of type {!type:concat_string_kind}. *)

val string_of_concat_string_kind :
  ?len:int -> concat_string_kind -> string
  (** Serialize a value of type {!type:concat_string_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_concat_string_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> concat_string_kind
  (** Input JSON data of type {!type:concat_string_kind}. *)

val concat_string_kind_of_string :
  string -> concat_string_kind
  (** Deserialize JSON data of type {!type:concat_string_kind}. *)

val write_const_type :
  Bi_outbuf.t -> const_type -> unit
  (** Output a JSON value of type {!type:const_type}. *)

val string_of_const_type :
  ?len:int -> const_type -> string
  (** Serialize a value of type {!type:const_type}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_const_type :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> const_type
  (** Input JSON data of type {!type:const_type}. *)

val const_type_of_string :
  string -> const_type
  (** Deserialize JSON data of type {!type:const_type}. *)

val write_container_operator :
  Bi_outbuf.t -> container_operator -> unit
  (** Output a JSON value of type {!type:container_operator}. *)

val string_of_container_operator :
  ?len:int -> container_operator -> string
  (** Serialize a value of type {!type:container_operator}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_container_operator :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> container_operator
  (** Input JSON data of type {!type:container_operator}. *)

val container_operator_of_string :
  string -> container_operator
  (** Deserialize JSON data of type {!type:container_operator}. *)

val write_function_kind :
  Bi_outbuf.t -> function_kind -> unit
  (** Output a JSON value of type {!type:function_kind}. *)

val string_of_function_kind :
  ?len:int -> function_kind -> string
  (** Serialize a value of type {!type:function_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_function_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> function_kind
  (** Input JSON data of type {!type:function_kind}. *)

val function_kind_of_string :
  string -> function_kind
  (** Deserialize JSON data of type {!type:function_kind}. *)

val write_incr_decr :
  Bi_outbuf.t -> incr_decr -> unit
  (** Output a JSON value of type {!type:incr_decr}. *)

val string_of_incr_decr :
  ?len:int -> incr_decr -> string
  (** Serialize a value of type {!type:incr_decr}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_incr_decr :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> incr_decr
  (** Input JSON data of type {!type:incr_decr}. *)

val incr_decr_of_string :
  string -> incr_decr
  (** Deserialize JSON data of type {!type:incr_decr}. *)

val write_keyword_attribute :
  Bi_outbuf.t -> keyword_attribute -> unit
  (** Output a JSON value of type {!type:keyword_attribute}. *)

val string_of_keyword_attribute :
  ?len:int -> keyword_attribute -> string
  (** Serialize a value of type {!type:keyword_attribute}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_keyword_attribute :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> keyword_attribute
  (** Input JSON data of type {!type:keyword_attribute}. *)

val keyword_attribute_of_string :
  string -> keyword_attribute
  (** Deserialize JSON data of type {!type:keyword_attribute}. *)

val write_operator :
  Bi_outbuf.t -> operator -> unit
  (** Output a JSON value of type {!type:operator}. *)

val string_of_operator :
  ?len:int -> operator -> string
  (** Serialize a value of type {!type:operator}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_operator :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> operator
  (** Input JSON data of type {!type:operator}. *)

val operator_of_string :
  string -> operator
  (** Deserialize JSON data of type {!type:operator}. *)

val write_prefix_postfix :
  Bi_outbuf.t -> prefix_postfix -> unit
  (** Output a JSON value of type {!type:prefix_postfix}. *)

val string_of_prefix_postfix :
  ?len:int -> prefix_postfix -> string
  (** Serialize a value of type {!type:prefix_postfix}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_prefix_postfix :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> prefix_postfix
  (** Input JSON data of type {!type:prefix_postfix}. *)

val prefix_postfix_of_string :
  string -> prefix_postfix
  (** Deserialize JSON data of type {!type:prefix_postfix}. *)

val write_sid :
  Bi_outbuf.t -> sid -> unit
  (** Output a JSON value of type {!type:sid}. *)

val string_of_sid :
  ?len:int -> sid -> string
  (** Serialize a value of type {!type:sid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_sid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> sid
  (** Input JSON data of type {!type:sid}. *)

val sid_of_string :
  string -> sid
  (** Deserialize JSON data of type {!type:sid}. *)

val write_special :
  Bi_outbuf.t -> special -> unit
  (** Output a JSON value of type {!type:special}. *)

val string_of_special :
  ?len:int -> special -> string
  (** Serialize a value of type {!type:special}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_special :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> special
  (** Input JSON data of type {!type:special}. *)

val special_of_string :
  string -> special
  (** Deserialize JSON data of type {!type:special}. *)

val write_token_location :
  Bi_outbuf.t -> token_location -> unit
  (** Output a JSON value of type {!type:token_location}. *)

val string_of_token_location :
  ?len:int -> token_location -> string
  (** Serialize a value of type {!type:token_location}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_token_location :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> token_location
  (** Input JSON data of type {!type:token_location}. *)

val token_location_of_string :
  string -> token_location
  (** Deserialize JSON data of type {!type:token_location}. *)

val write_token :
  Bi_outbuf.t -> token -> unit
  (** Output a JSON value of type {!type:token}. *)

val string_of_token :
  ?len:int -> token -> string
  (** Serialize a value of type {!type:token}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_token :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> token
  (** Input JSON data of type {!type:token}. *)

val token_of_string :
  string -> token
  (** Deserialize JSON data of type {!type:token}. *)

val write_tok :
  Bi_outbuf.t -> tok -> unit
  (** Output a JSON value of type {!type:tok}. *)

val string_of_tok :
  ?len:int -> tok -> string
  (** Serialize a value of type {!type:tok}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_tok :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> tok
  (** Input JSON data of type {!type:tok}. *)

val tok_of_string :
  string -> tok
  (** Deserialize JSON data of type {!type:tok}. *)

val write_bracket :
  (Bi_outbuf.t -> 'a -> unit) ->
  Bi_outbuf.t -> 'a bracket -> unit
  (** Output a JSON value of type {!type:bracket}. *)

val string_of_bracket :
  (Bi_outbuf.t -> 'a -> unit) ->
  ?len:int -> 'a bracket -> string
  (** Serialize a value of type {!type:bracket}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_bracket :
  (Yojson.Safe.lexer_state -> Lexing.lexbuf -> 'a) ->
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> 'a bracket
  (** Input JSON data of type {!type:bracket}. *)

val bracket_of_string :
  (Yojson.Safe.lexer_state -> Lexing.lexbuf -> 'a) ->
  string -> 'a bracket
  (** Deserialize JSON data of type {!type:bracket}. *)

val write_sc :
  Bi_outbuf.t -> sc -> unit
  (** Output a JSON value of type {!type:sc}. *)

val string_of_sc :
  ?len:int -> sc -> string
  (** Serialize a value of type {!type:sc}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_sc :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> sc
  (** Input JSON data of type {!type:sc}. *)

val sc_of_string :
  string -> sc
  (** Deserialize JSON data of type {!type:sc}. *)

val write_wrap_ :
  (Bi_outbuf.t -> 'a -> unit) ->
  Bi_outbuf.t -> 'a wrap_ -> unit
  (** Output a JSON value of type {!type:wrap_}. *)

val string_of_wrap_ :
  (Bi_outbuf.t -> 'a -> unit) ->
  ?len:int -> 'a wrap_ -> string
  (** Serialize a value of type {!type:wrap_}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_wrap_ :
  (Yojson.Safe.lexer_state -> Lexing.lexbuf -> 'a) ->
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> 'a wrap_
  (** Input JSON data of type {!type:wrap_}. *)

val wrap__of_string :
  (Yojson.Safe.lexer_state -> Lexing.lexbuf -> 'a) ->
  string -> 'a wrap_
  (** Deserialize JSON data of type {!type:wrap_}. *)

val write_ident :
  Bi_outbuf.t -> ident -> unit
  (** Output a JSON value of type {!type:ident}. *)

val string_of_ident :
  ?len:int -> ident -> string
  (** Serialize a value of type {!type:ident}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ident :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ident
  (** Input JSON data of type {!type:ident}. *)

val ident_of_string :
  string -> ident
  (** Deserialize JSON data of type {!type:ident}. *)

val write_dotted_ident :
  Bi_outbuf.t -> dotted_ident -> unit
  (** Output a JSON value of type {!type:dotted_ident}. *)

val string_of_dotted_ident :
  ?len:int -> dotted_ident -> string
  (** Serialize a value of type {!type:dotted_ident}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_dotted_ident :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> dotted_ident
  (** Input JSON data of type {!type:dotted_ident}. *)

val dotted_ident_of_string :
  string -> dotted_ident
  (** Deserialize JSON data of type {!type:dotted_ident}. *)

val write_label :
  Bi_outbuf.t -> label -> unit
  (** Output a JSON value of type {!type:label}. *)

val string_of_label :
  ?len:int -> label -> string
  (** Serialize a value of type {!type:label}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_label :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> label
  (** Input JSON data of type {!type:label}. *)

val label_of_string :
  string -> label
  (** Deserialize JSON data of type {!type:label}. *)

val write_literal :
  Bi_outbuf.t -> literal -> unit
  (** Output a JSON value of type {!type:literal}. *)

val string_of_literal :
  ?len:int -> literal -> string
  (** Serialize a value of type {!type:literal}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_literal :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> literal
  (** Input JSON data of type {!type:literal}. *)

val literal_of_string :
  string -> literal
  (** Deserialize JSON data of type {!type:literal}. *)

val write_constness :
  Bi_outbuf.t -> constness -> unit
  (** Output a JSON value of type {!type:constness}. *)

val string_of_constness :
  ?len:int -> constness -> string
  (** Serialize a value of type {!type:constness}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_constness :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> constness
  (** Input JSON data of type {!type:constness}. *)

val constness_of_string :
  string -> constness
  (** Deserialize JSON data of type {!type:constness}. *)

val write_module_name :
  Bi_outbuf.t -> module_name -> unit
  (** Output a JSON value of type {!type:module_name}. *)

val string_of_module_name :
  ?len:int -> module_name -> string
  (** Serialize a value of type {!type:module_name}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_module_name :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> module_name
  (** Input JSON data of type {!type:module_name}. *)

val module_name_of_string :
  string -> module_name
  (** Deserialize JSON data of type {!type:module_name}. *)

val write_resolved_name_kind :
  Bi_outbuf.t -> resolved_name_kind -> unit
  (** Output a JSON value of type {!type:resolved_name_kind}. *)

val string_of_resolved_name_kind :
  ?len:int -> resolved_name_kind -> string
  (** Serialize a value of type {!type:resolved_name_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_resolved_name_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> resolved_name_kind
  (** Input JSON data of type {!type:resolved_name_kind}. *)

val resolved_name_kind_of_string :
  string -> resolved_name_kind
  (** Deserialize JSON data of type {!type:resolved_name_kind}. *)

val write_resolved_name :
  Bi_outbuf.t -> resolved_name -> unit
  (** Output a JSON value of type {!type:resolved_name}. *)

val string_of_resolved_name :
  ?len:int -> resolved_name -> string
  (** Serialize a value of type {!type:resolved_name}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_resolved_name :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> resolved_name
  (** Input JSON data of type {!type:resolved_name}. *)

val resolved_name_of_string :
  string -> resolved_name
  (** Deserialize JSON data of type {!type:resolved_name}. *)

val write_xml_kind :
  Bi_outbuf.t -> xml_kind -> unit
  (** Output a JSON value of type {!type:xml_kind}. *)

val string_of_xml_kind :
  ?len:int -> xml_kind -> string
  (** Serialize a value of type {!type:xml_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_xml_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> xml_kind
  (** Input JSON data of type {!type:xml_kind}. *)

val xml_kind_of_string :
  string -> xml_kind
  (** Deserialize JSON data of type {!type:xml_kind}. *)

val write_action :
  Bi_outbuf.t -> action -> unit
  (** Output a JSON value of type {!type:action}. *)

val string_of_action :
  ?len:int -> action -> string
  (** Serialize a value of type {!type:action}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_action :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> action
  (** Input JSON data of type {!type:action}. *)

val action_of_string :
  string -> action
  (** Deserialize JSON data of type {!type:action}. *)

val write_alias :
  Bi_outbuf.t -> alias -> unit
  (** Output a JSON value of type {!type:alias}. *)

val string_of_alias :
  ?len:int -> alias -> string
  (** Serialize a value of type {!type:alias}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_alias :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> alias
  (** Input JSON data of type {!type:alias}. *)

val alias_of_string :
  string -> alias
  (** Deserialize JSON data of type {!type:alias}. *)

val write_any :
  Bi_outbuf.t -> any -> unit
  (** Output a JSON value of type {!type:any}. *)

val string_of_any :
  ?len:int -> any -> string
  (** Serialize a value of type {!type:any}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_any :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> any
  (** Input JSON data of type {!type:any}. *)

val any_of_string :
  string -> any
  (** Deserialize JSON data of type {!type:any}. *)

val write_argument :
  Bi_outbuf.t -> argument -> unit
  (** Output a JSON value of type {!type:argument}. *)

val string_of_argument :
  ?len:int -> argument -> string
  (** Serialize a value of type {!type:argument}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_argument :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> argument
  (** Input JSON data of type {!type:argument}. *)

val argument_of_string :
  string -> argument
  (** Deserialize JSON data of type {!type:argument}. *)

val write_arguments :
  Bi_outbuf.t -> arguments -> unit
  (** Output a JSON value of type {!type:arguments}. *)

val string_of_arguments :
  ?len:int -> arguments -> string
  (** Serialize a value of type {!type:arguments}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_arguments :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> arguments
  (** Input JSON data of type {!type:arguments}. *)

val arguments_of_string :
  string -> arguments
  (** Deserialize JSON data of type {!type:arguments}. *)

val write_attribute :
  Bi_outbuf.t -> attribute -> unit
  (** Output a JSON value of type {!type:attribute}. *)

val string_of_attribute :
  ?len:int -> attribute -> string
  (** Serialize a value of type {!type:attribute}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_attribute :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> attribute
  (** Input JSON data of type {!type:attribute}. *)

val attribute_of_string :
  string -> attribute
  (** Deserialize JSON data of type {!type:attribute}. *)

val write_case :
  Bi_outbuf.t -> case -> unit
  (** Output a JSON value of type {!type:case}. *)

val string_of_case :
  ?len:int -> case -> string
  (** Serialize a value of type {!type:case}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_case :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> case
  (** Input JSON data of type {!type:case}. *)

val case_of_string :
  string -> case
  (** Deserialize JSON data of type {!type:case}. *)

val write_case_and_body :
  Bi_outbuf.t -> case_and_body -> unit
  (** Output a JSON value of type {!type:case_and_body}. *)

val string_of_case_and_body :
  ?len:int -> case_and_body -> string
  (** Serialize a value of type {!type:case_and_body}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_case_and_body :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> case_and_body
  (** Input JSON data of type {!type:case_and_body}. *)

val case_and_body_of_string :
  string -> case_and_body
  (** Deserialize JSON data of type {!type:case_and_body}. *)

val write_catch :
  Bi_outbuf.t -> catch -> unit
  (** Output a JSON value of type {!type:catch}. *)

val string_of_catch :
  ?len:int -> catch -> string
  (** Serialize a value of type {!type:catch}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_catch :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> catch
  (** Input JSON data of type {!type:catch}. *)

val catch_of_string :
  string -> catch
  (** Deserialize JSON data of type {!type:catch}. *)

val write_class_definition :
  Bi_outbuf.t -> class_definition -> unit
  (** Output a JSON value of type {!type:class_definition}. *)

val string_of_class_definition :
  ?len:int -> class_definition -> string
  (** Serialize a value of type {!type:class_definition}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_class_definition :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> class_definition
  (** Input JSON data of type {!type:class_definition}. *)

val class_definition_of_string :
  string -> class_definition
  (** Deserialize JSON data of type {!type:class_definition}. *)

val write_definition :
  Bi_outbuf.t -> definition -> unit
  (** Output a JSON value of type {!type:definition}. *)

val string_of_definition :
  ?len:int -> definition -> string
  (** Serialize a value of type {!type:definition}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_definition :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> definition
  (** Input JSON data of type {!type:definition}. *)

val definition_of_string :
  string -> definition
  (** Deserialize JSON data of type {!type:definition}. *)

val write_definition_kind :
  Bi_outbuf.t -> definition_kind -> unit
  (** Output a JSON value of type {!type:definition_kind}. *)

val string_of_definition_kind :
  ?len:int -> definition_kind -> string
  (** Serialize a value of type {!type:definition_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_definition_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> definition_kind
  (** Input JSON data of type {!type:definition_kind}. *)

val definition_kind_of_string :
  string -> definition_kind
  (** Deserialize JSON data of type {!type:definition_kind}. *)

val write_directive :
  Bi_outbuf.t -> directive -> unit
  (** Output a JSON value of type {!type:directive}. *)

val string_of_directive :
  ?len:int -> directive -> string
  (** Serialize a value of type {!type:directive}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_directive :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> directive
  (** Input JSON data of type {!type:directive}. *)

val directive_of_string :
  string -> directive
  (** Deserialize JSON data of type {!type:directive}. *)

val write_entity :
  Bi_outbuf.t -> entity -> unit
  (** Output a JSON value of type {!type:entity}. *)

val string_of_entity :
  ?len:int -> entity -> string
  (** Serialize a value of type {!type:entity}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_entity :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> entity
  (** Input JSON data of type {!type:entity}. *)

val entity_of_string :
  string -> entity
  (** Deserialize JSON data of type {!type:entity}. *)

val write_expr :
  Bi_outbuf.t -> expr -> unit
  (** Output a JSON value of type {!type:expr}. *)

val string_of_expr :
  ?len:int -> expr -> string
  (** Serialize a value of type {!type:expr}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_expr :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> expr
  (** Input JSON data of type {!type:expr}. *)

val expr_of_string :
  string -> expr
  (** Deserialize JSON data of type {!type:expr}. *)

val write_field :
  Bi_outbuf.t -> field -> unit
  (** Output a JSON value of type {!type:field}. *)

val string_of_field :
  ?len:int -> field -> string
  (** Serialize a value of type {!type:field}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_field :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> field
  (** Input JSON data of type {!type:field}. *)

val field_of_string :
  string -> field
  (** Deserialize JSON data of type {!type:field}. *)

val write_finally :
  Bi_outbuf.t -> finally -> unit
  (** Output a JSON value of type {!type:finally}. *)

val string_of_finally :
  ?len:int -> finally -> string
  (** Serialize a value of type {!type:finally}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_finally :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> finally
  (** Input JSON data of type {!type:finally}. *)

val finally_of_string :
  string -> finally
  (** Deserialize JSON data of type {!type:finally}. *)

val write_for_header :
  Bi_outbuf.t -> for_header -> unit
  (** Output a JSON value of type {!type:for_header}. *)

val string_of_for_header :
  ?len:int -> for_header -> string
  (** Serialize a value of type {!type:for_header}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_for_header :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> for_header
  (** Input JSON data of type {!type:for_header}. *)

val for_header_of_string :
  string -> for_header
  (** Deserialize JSON data of type {!type:for_header}. *)

val write_for_var_or_expr :
  Bi_outbuf.t -> for_var_or_expr -> unit
  (** Output a JSON value of type {!type:for_var_or_expr}. *)

val string_of_for_var_or_expr :
  ?len:int -> for_var_or_expr -> string
  (** Serialize a value of type {!type:for_var_or_expr}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_for_var_or_expr :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> for_var_or_expr
  (** Input JSON data of type {!type:for_var_or_expr}. *)

val for_var_or_expr_of_string :
  string -> for_var_or_expr
  (** Deserialize JSON data of type {!type:for_var_or_expr}. *)

val write_function_definition :
  Bi_outbuf.t -> function_definition -> unit
  (** Output a JSON value of type {!type:function_definition}. *)

val string_of_function_definition :
  ?len:int -> function_definition -> string
  (** Serialize a value of type {!type:function_definition}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_function_definition :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> function_definition
  (** Input JSON data of type {!type:function_definition}. *)

val function_definition_of_string :
  string -> function_definition
  (** Deserialize JSON data of type {!type:function_definition}. *)

val write_id_info :
  Bi_outbuf.t -> id_info -> unit
  (** Output a JSON value of type {!type:id_info}. *)

val string_of_id_info :
  ?len:int -> id_info -> string
  (** Serialize a value of type {!type:id_info}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_id_info :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> id_info
  (** Input JSON data of type {!type:id_info}. *)

val id_info_of_string :
  string -> id_info
  (** Deserialize JSON data of type {!type:id_info}. *)

val write_item :
  Bi_outbuf.t -> item -> unit
  (** Output a JSON value of type {!type:item}. *)

val string_of_item :
  ?len:int -> item -> string
  (** Serialize a value of type {!type:item}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_item :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> item
  (** Input JSON data of type {!type:item}. *)

val item_of_string :
  string -> item
  (** Deserialize JSON data of type {!type:item}. *)

val write_label_ident :
  Bi_outbuf.t -> label_ident -> unit
  (** Output a JSON value of type {!type:label_ident}. *)

val string_of_label_ident :
  ?len:int -> label_ident -> string
  (** Serialize a value of type {!type:label_ident}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_label_ident :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> label_ident
  (** Input JSON data of type {!type:label_ident}. *)

val label_ident_of_string :
  string -> label_ident
  (** Deserialize JSON data of type {!type:label_ident}. *)

val write_macro_definition :
  Bi_outbuf.t -> macro_definition -> unit
  (** Output a JSON value of type {!type:macro_definition}. *)

val string_of_macro_definition :
  ?len:int -> macro_definition -> string
  (** Serialize a value of type {!type:macro_definition}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_macro_definition :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> macro_definition
  (** Input JSON data of type {!type:macro_definition}. *)

val macro_definition_of_string :
  string -> macro_definition
  (** Deserialize JSON data of type {!type:macro_definition}. *)

val write_module_definition :
  Bi_outbuf.t -> module_definition -> unit
  (** Output a JSON value of type {!type:module_definition}. *)

val string_of_module_definition :
  ?len:int -> module_definition -> string
  (** Serialize a value of type {!type:module_definition}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_module_definition :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> module_definition
  (** Input JSON data of type {!type:module_definition}. *)

val module_definition_of_string :
  string -> module_definition
  (** Deserialize JSON data of type {!type:module_definition}. *)

val write_module_definition_kind :
  Bi_outbuf.t -> module_definition_kind -> unit
  (** Output a JSON value of type {!type:module_definition_kind}. *)

val string_of_module_definition_kind :
  ?len:int -> module_definition_kind -> string
  (** Serialize a value of type {!type:module_definition_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_module_definition_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> module_definition_kind
  (** Input JSON data of type {!type:module_definition_kind}. *)

val module_definition_kind_of_string :
  string -> module_definition_kind
  (** Deserialize JSON data of type {!type:module_definition_kind}. *)

val write_name :
  Bi_outbuf.t -> name -> unit
  (** Output a JSON value of type {!type:name}. *)

val string_of_name :
  ?len:int -> name -> string
  (** Serialize a value of type {!type:name}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_name :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> name
  (** Input JSON data of type {!type:name}. *)

val name_of_string :
  string -> name
  (** Deserialize JSON data of type {!type:name}. *)

val write_name_info :
  Bi_outbuf.t -> name_info -> unit
  (** Output a JSON value of type {!type:name_info}. *)

val string_of_name_info :
  ?len:int -> name_info -> string
  (** Serialize a value of type {!type:name_info}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_name_info :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> name_info
  (** Input JSON data of type {!type:name_info}. *)

val name_info_of_string :
  string -> name_info
  (** Deserialize JSON data of type {!type:name_info}. *)

val write_name_or_dynamic :
  Bi_outbuf.t -> name_or_dynamic -> unit
  (** Output a JSON value of type {!type:name_or_dynamic}. *)

val string_of_name_or_dynamic :
  ?len:int -> name_or_dynamic -> string
  (** Serialize a value of type {!type:name_or_dynamic}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_name_or_dynamic :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> name_or_dynamic
  (** Input JSON data of type {!type:name_or_dynamic}. *)

val name_or_dynamic_of_string :
  string -> name_or_dynamic
  (** Deserialize JSON data of type {!type:name_or_dynamic}. *)

val write_or_type_element :
  Bi_outbuf.t -> or_type_element -> unit
  (** Output a JSON value of type {!type:or_type_element}. *)

val string_of_or_type_element :
  ?len:int -> or_type_element -> string
  (** Serialize a value of type {!type:or_type_element}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_or_type_element :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> or_type_element
  (** Input JSON data of type {!type:or_type_element}. *)

val or_type_element_of_string :
  string -> or_type_element
  (** Deserialize JSON data of type {!type:or_type_element}. *)

val write_parameter :
  Bi_outbuf.t -> parameter -> unit
  (** Output a JSON value of type {!type:parameter}. *)

val string_of_parameter :
  ?len:int -> parameter -> string
  (** Serialize a value of type {!type:parameter}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_parameter :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> parameter
  (** Input JSON data of type {!type:parameter}. *)

val parameter_of_string :
  string -> parameter
  (** Deserialize JSON data of type {!type:parameter}. *)

val write_parameter_classic :
  Bi_outbuf.t -> parameter_classic -> unit
  (** Output a JSON value of type {!type:parameter_classic}. *)

val string_of_parameter_classic :
  ?len:int -> parameter_classic -> string
  (** Serialize a value of type {!type:parameter_classic}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_parameter_classic :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> parameter_classic
  (** Input JSON data of type {!type:parameter_classic}. *)

val parameter_classic_of_string :
  string -> parameter_classic
  (** Deserialize JSON data of type {!type:parameter_classic}. *)

val write_parameters :
  Bi_outbuf.t -> parameters -> unit
  (** Output a JSON value of type {!type:parameters}. *)

val string_of_parameters :
  ?len:int -> parameters -> string
  (** Serialize a value of type {!type:parameters}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_parameters :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> parameters
  (** Input JSON data of type {!type:parameters}. *)

val parameters_of_string :
  string -> parameters
  (** Deserialize JSON data of type {!type:parameters}. *)

val write_pattern :
  Bi_outbuf.t -> pattern -> unit
  (** Output a JSON value of type {!type:pattern}. *)

val string_of_pattern :
  ?len:int -> pattern -> string
  (** Serialize a value of type {!type:pattern}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_pattern :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> pattern
  (** Input JSON data of type {!type:pattern}. *)

val pattern_of_string :
  string -> pattern
  (** Deserialize JSON data of type {!type:pattern}. *)

val write_qualifier :
  Bi_outbuf.t -> qualifier -> unit
  (** Output a JSON value of type {!type:qualifier}. *)

val string_of_qualifier :
  ?len:int -> qualifier -> string
  (** Serialize a value of type {!type:qualifier}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_qualifier :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> qualifier
  (** Input JSON data of type {!type:qualifier}. *)

val qualifier_of_string :
  string -> qualifier
  (** Deserialize JSON data of type {!type:qualifier}. *)

val write_stmt :
  Bi_outbuf.t -> stmt -> unit
  (** Output a JSON value of type {!type:stmt}. *)

val string_of_stmt :
  ?len:int -> stmt -> string
  (** Serialize a value of type {!type:stmt}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_stmt :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> stmt
  (** Input JSON data of type {!type:stmt}. *)

val stmt_of_string :
  string -> stmt
  (** Deserialize JSON data of type {!type:stmt}. *)

val write_stmt_kind :
  Bi_outbuf.t -> stmt_kind -> unit
  (** Output a JSON value of type {!type:stmt_kind}. *)

val string_of_stmt_kind :
  ?len:int -> stmt_kind -> string
  (** Serialize a value of type {!type:stmt_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_stmt_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> stmt_kind
  (** Input JSON data of type {!type:stmt_kind}. *)

val stmt_kind_of_string :
  string -> stmt_kind
  (** Deserialize JSON data of type {!type:stmt_kind}. *)

val write_type_ :
  Bi_outbuf.t -> type_ -> unit
  (** Output a JSON value of type {!type:type_}. *)

val string_of_type_ :
  ?len:int -> type_ -> string
  (** Serialize a value of type {!type:type_}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_type_ :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> type_
  (** Input JSON data of type {!type:type_}. *)

val type__of_string :
  string -> type_
  (** Deserialize JSON data of type {!type:type_}. *)

val write_type_argument :
  Bi_outbuf.t -> type_argument -> unit
  (** Output a JSON value of type {!type:type_argument}. *)

val string_of_type_argument :
  ?len:int -> type_argument -> string
  (** Serialize a value of type {!type:type_argument}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_type_argument :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> type_argument
  (** Input JSON data of type {!type:type_argument}. *)

val type_argument_of_string :
  string -> type_argument
  (** Deserialize JSON data of type {!type:type_argument}. *)

val write_type_arguments :
  Bi_outbuf.t -> type_arguments -> unit
  (** Output a JSON value of type {!type:type_arguments}. *)

val string_of_type_arguments :
  ?len:int -> type_arguments -> string
  (** Serialize a value of type {!type:type_arguments}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_type_arguments :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> type_arguments
  (** Input JSON data of type {!type:type_arguments}. *)

val type_arguments_of_string :
  string -> type_arguments
  (** Deserialize JSON data of type {!type:type_arguments}. *)

val write_type_definition :
  Bi_outbuf.t -> type_definition -> unit
  (** Output a JSON value of type {!type:type_definition}. *)

val string_of_type_definition :
  ?len:int -> type_definition -> string
  (** Serialize a value of type {!type:type_definition}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_type_definition :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> type_definition
  (** Input JSON data of type {!type:type_definition}. *)

val type_definition_of_string :
  string -> type_definition
  (** Deserialize JSON data of type {!type:type_definition}. *)

val write_type_definition_kind :
  Bi_outbuf.t -> type_definition_kind -> unit
  (** Output a JSON value of type {!type:type_definition_kind}. *)

val string_of_type_definition_kind :
  ?len:int -> type_definition_kind -> string
  (** Serialize a value of type {!type:type_definition_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_type_definition_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> type_definition_kind
  (** Input JSON data of type {!type:type_definition_kind}. *)

val type_definition_kind_of_string :
  string -> type_definition_kind
  (** Deserialize JSON data of type {!type:type_definition_kind}. *)

val write_type_parameter :
  Bi_outbuf.t -> type_parameter -> unit
  (** Output a JSON value of type {!type:type_parameter}. *)

val string_of_type_parameter :
  ?len:int -> type_parameter -> string
  (** Serialize a value of type {!type:type_parameter}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_type_parameter :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> type_parameter
  (** Input JSON data of type {!type:type_parameter}. *)

val type_parameter_of_string :
  string -> type_parameter
  (** Deserialize JSON data of type {!type:type_parameter}. *)

val write_type_parameter_constraint :
  Bi_outbuf.t -> type_parameter_constraint -> unit
  (** Output a JSON value of type {!type:type_parameter_constraint}. *)

val string_of_type_parameter_constraint :
  ?len:int -> type_parameter_constraint -> string
  (** Serialize a value of type {!type:type_parameter_constraint}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_type_parameter_constraint :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> type_parameter_constraint
  (** Input JSON data of type {!type:type_parameter_constraint}. *)

val type_parameter_constraint_of_string :
  string -> type_parameter_constraint
  (** Deserialize JSON data of type {!type:type_parameter_constraint}. *)

val write_variable_definition :
  Bi_outbuf.t -> variable_definition -> unit
  (** Output a JSON value of type {!type:variable_definition}. *)

val string_of_variable_definition :
  ?len:int -> variable_definition -> string
  (** Serialize a value of type {!type:variable_definition}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_variable_definition :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> variable_definition
  (** Input JSON data of type {!type:variable_definition}. *)

val variable_definition_of_string :
  string -> variable_definition
  (** Deserialize JSON data of type {!type:variable_definition}. *)

val write_xml :
  Bi_outbuf.t -> xml -> unit
  (** Output a JSON value of type {!type:xml}. *)

val string_of_xml :
  ?len:int -> xml -> string
  (** Serialize a value of type {!type:xml}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_xml :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> xml
  (** Input JSON data of type {!type:xml}. *)

val xml_of_string :
  string -> xml
  (** Deserialize JSON data of type {!type:xml}. *)

val write_xml_attr_value :
  Bi_outbuf.t -> xml_attr_value -> unit
  (** Output a JSON value of type {!type:xml_attr_value}. *)

val string_of_xml_attr_value :
  ?len:int -> xml_attr_value -> string
  (** Serialize a value of type {!type:xml_attr_value}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_xml_attr_value :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> xml_attr_value
  (** Input JSON data of type {!type:xml_attr_value}. *)

val xml_attr_value_of_string :
  string -> xml_attr_value
  (** Deserialize JSON data of type {!type:xml_attr_value}. *)

val write_xml_attribute :
  Bi_outbuf.t -> xml_attribute -> unit
  (** Output a JSON value of type {!type:xml_attribute}. *)

val string_of_xml_attribute :
  ?len:int -> xml_attribute -> string
  (** Serialize a value of type {!type:xml_attribute}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_xml_attribute :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> xml_attribute
  (** Input JSON data of type {!type:xml_attribute}. *)

val xml_attribute_of_string :
  string -> xml_attribute
  (** Deserialize JSON data of type {!type:xml_attribute}. *)

val write_xml_body :
  Bi_outbuf.t -> xml_body -> unit
  (** Output a JSON value of type {!type:xml_body}. *)

val string_of_xml_body :
  ?len:int -> xml_body -> string
  (** Serialize a value of type {!type:xml_body}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_xml_body :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> xml_body
  (** Input JSON data of type {!type:xml_body}. *)

val xml_body_of_string :
  string -> xml_body
  (** Deserialize JSON data of type {!type:xml_body}. *)

val write_program :
  Bi_outbuf.t -> program -> unit
  (** Output a JSON value of type {!type:program}. *)

val string_of_program :
  ?len:int -> program -> string
  (** Serialize a value of type {!type:program}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_program :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> program
  (** Input JSON data of type {!type:program}. *)

val program_of_string :
  string -> program
  (** Deserialize JSON data of type {!type:program}. *)

