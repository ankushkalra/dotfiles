; extends

;; Highlight the 'type' keyword used for type aliases.
;; The `(type_alias_declaration keyword: "type")` matches the 'type' token
;; specifically within a type alias declaration.
;; We assign it to `@keyword.type_alias`.
;; (type_alias_declaration "type") @keyword.type_alias
;; ((type_alias_declaration "type") @keyword.type_alias (#set! priority 105))
;; ((type_alias_declaration "type") @keyword.type_alias (#eq? @keyword.type_alias "type"))
;; "type" @keyword.type_type (#set! priority 106)
;; (@keyword.type_type (#set! priority 107))
("type" (#set! priority 105)) @keyword.type_alias
;; (#set! priority 105)

; Capture the name of a default import, e.g., "React" from 'react'
(
  (import_statement
    (import_clause
      (identifier) @import.name))
  (#set! "priority" 120)
)

; Capture all named imports, e.g., "useState" from 'react'
(
  (import_statement
    (import_clause
      (named_imports
        (import_specifier
          name: (identifier) @import.name))))
  (#set! "priority" 120)
)

; Capture aliased named imports, e.g., "createContext as context"
(
  (import_statement
    (import_clause
      (named_imports
        (import_specifier
          name: (identifier)
          alias: (identifier) @import.name))))
  (#set! "priority" 120)
)


; extends

; Use a unique capture name and force the priority
("export" @keyword.export_custom (#set! "priority" 127))

; extends

; Target only the name of the tag, not the attributes
(jsx_opening_element name: (_) @tag (#set! "priority" 127))
(jsx_closing_element name: (_) @tag (#set! "priority" 127))
(jsx_self_closing_element name: (_) @tag (#set! "priority" 127))

