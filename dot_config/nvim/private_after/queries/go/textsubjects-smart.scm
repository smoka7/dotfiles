((comment) @_start @_end
     (#make-range! "range" @_start @_end))

; TODO This query doesn't work for comment groups at the start and end of a
; file
; See https://github.com/tree-sitter/tree-sitter/issues/1138
(((_) @head . (comment) @_start . (comment)+ @_end (_) @tail)
    (#not-has-type? @tail "comment")
    (#not-has-type? @head "comment")
    (#make-range! "range" @_start @_end))

(([
    (argument_list)
    (call_expression)
    (expression_case)
    (expression_list)
    (expression_switch_statement)
    (field_declaration)
    (for_statement)
    (func_literal)
    (function_declaration)
    (if_statement)
    (import_declaration)
    (method_declaration)
    (parameter_list)
    (return_statement)
    (select_statement)
    (type_declaration)
] @_start @_end)
(#make-range! "range" @_start @_end))

((parameter_list (_) @_start @_end . ","? @_end)
    (#make-range! "range" @_start @_end))

((argument_list (_) @_start @_end . ","? @_end)
    (#make-range! "range" @_start @_end))

((literal_value (_) @_start @_end . ","? @_end)
    (#make-range! "range" @_start @_end))

((composite_literal (_) @_start @_end)
    (#make-range! "range" @_start @_end))
