#!/bin/bash

echo
read -p "Título da documentação: " DOC_TITLE

echo
read -p "Arquivo/módulo relacionado: " MODULE_NAME

BODY_FILE=$(mktemp)

cat > "$BODY_FILE" <<EOF
## Objetivo

Documentar tecnicamente o módulo relacionado a ${MODULE_NAME}.

## Escopo

- Explicar objetivo do módulo
- Descrever entradas e saídas
- Incluir exemplos de uso
- Registrar limitações conhecidas
- Garantir aderência ao código existente

## Checklist técnico

- [ ] Criar ou atualizar documentação em docs/
- [ ] Revisar aderência com o código real
- [ ] Validar exemplos de uso
- [ ] Revisar organização do Markdown
EOF

gh issue create \
  --title "[DOCS] ${DOC_TITLE}" \
  --body-file "$BODY_FILE" \
  --label docs \
  --label "priority:low"

rm "$BODY_FILE"

echo
echo "Issue criada com sucesso."