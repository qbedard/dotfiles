; extends

; Inject Jinja into Python strings that contain Jinja delimiters
; ({{ ... }}, {% ... %}, or {# ... #}). Single-brace strings such as
; str.format templates and f-string fields are left untouched.
((string_content) @injection.content
  (#lua-match? @injection.content "{[{%%#]")
  (#set! injection.language "jinja"))
