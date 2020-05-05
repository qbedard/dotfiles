" ALE
let b:ale_yaml_yamllint_options =
  \ '-d "{extends: default, rules: {' .
    \ 'document-start: {present: false}, ' .
    \ 'indentation: {indent-sequences: consistent}' .
  \ '}}"'
