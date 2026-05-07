#!/usr/bin/env bash
set -euo pipefail

# Script gerado automaticamente para criar as 6 Issues do backlog Shop4u.
# Não execute sem revisar. Este script cria uma Epic, captura seu número
# e depois cria 4 Stories e 1 Docs vinculadas à Epic.

TMPDIR=$(mktemp -d)
echo "Usando diretório temporário: $TMPDIR"

# 1) Epic
EPIC_BODY="$TMPDIR/epic.md"
cat > "$EPIC_BODY" <<'EPIC'
# [EPIC] Lançar experiência de compra móvel completa

Objetivo macro: Fornecer uma experiência móvel completa de e-commerce cobrindo busca,
carrinho, checkout com autenticação, recomendações personalizadas por IA e notificações de pedido.

Escopo inicial:
- Busca por nome e categoria
- Carrinho e fluxo de checkout com pagamento
- Recomendações personalizadas com IA
- Notificações de status de pedido

Labels: epic, priority:high
EPIC

echo "Criando Epic..."
EPIC_URL=$(gh issue create --title "[EPIC] Lançar experiência de compra móvel completa" --body-file "$EPIC_BODY" --label epic --label "priority:high")
echo "Epic criada: $EPIC_URL"
EPIC_NUMBER=$(echo "$EPIC_URL" | sed -E 's#.*/([0-9]+)$#\1#')
echo "Número da Epic: $EPIC_NUMBER"

# 2) Stories

### Story 1: Busca de produtos
STORY1_BODY="$TMPDIR/story1.md"
cat > "$STORY1_BODY" <<EOF
[STORY] Implementar busca de produtos por nome e categoria

Parent Epic: #$EPIC_NUMBER

## User Story
Como usuário do app móvel
Quero buscar produtos por nome e categoria
Para encontrar itens relevantes rapidamente

## Critérios de aceitação — BDD
Dado que existam produtos cadastrados
Quando eu pesquisar por um termo ou selecionar uma categoria
Então devo ver uma lista paginada de produtos que correspondem ao termo ou categoria

## Checklist técnico
- Implementar endpoint de busca no backend (nome, categoria, paginação)
- Indexação simples para consultas por texto (ex.: search index ou consulta otimizada)
- Criar UI de busca no frontend com campo de texto e filtros por categoria
- Adicionar testes automatizados básicos (back + front)

Labels: story, backend, frontend, priority:high
EOF

echo "Criando Story 1 (Busca)..."
STORY1_URL=$(gh issue create --title "[STORY] Implementar busca de produtos por nome e categoria" --body-file "$STORY1_BODY" --label story --label backend --label frontend --label "priority:high")
echo "Story 1 criada: $STORY1_URL"

### Story 2: Carrinho e Checkout com autenticação
STORY2_BODY="$TMPDIR/story2.md"
cat > "$STORY2_BODY" <<EOF
[STORY] Implementar carrinho de compras e fluxo de checkout autenticado

Parent Epic: #$EPIC_NUMBER

## User Story
Como usuário autenticado
Quero adicionar produtos ao carrinho e finalizar compra com pagamento
Para receber os produtos adquiridos

## Critérios de aceitação — BDD
Dado que eu esteja autenticado
Quando eu finalizar o checkout com pagamento aprovado
Então um pedido deve ser criado e confirmado para o usuário

Dado que o pagamento seja recusado
Quando eu tentar concluir o checkout
Então o pedido não deve ser criado e o carrinho deve permanecer ativo

## Checklist técnico
- Implementar APIs de carrinho (adicionar, remover, listar)
- Integrar gateway de pagamento (simulado/em sandbox para início)
- Garantir requisito: autenticação obrigatória para checkout
- Persistir pedido somente após confirmação de pagamento
- Adicionar testes de fluxo (pagamento aprovado/recusado)

Labels: story, backend, frontend, priority:high
EOF

echo "Criando Story 2 (Carrinho & Checkout)..."
STORY2_URL=$(gh issue create --title "[STORY] Implementar carrinho de compras e fluxo de checkout autenticado" --body-file "$STORY2_BODY" --label story --label backend --label frontend --label "priority:high")
echo "Story 2 criada: $STORY2_URL"

### Story 3: Recomendações personalizadas com IA
STORY3_BODY="$TMPDIR/story3.md"
cat > "$STORY3_BODY" <<EOF
[STORY] Implementar recomendações personalizadas usando IA

Parent Epic: #$EPIC_NUMBER

## User Story
Como usuário do app
Quero receber recomendações de produtos personalizadas
Para descobrir itens relevantes com base no meu histórico

## Critérios de aceitação — BDD
Dado que um usuário tenha histórico de navegação
Quando ele navegar na home ou listas de categoria
Então o sistema deverá exibir recomendações baseadas no histórico

Dado que o usuário não tenha histórico
Quando ele acessar a sessão de recomendações
Então o sistema deverá exibir produtos populares

## Checklist técnico
- Definir pipeline simples de sinalização de eventos (visualização, clique)
- Implementar serviço de recomendações (pode iniciar com heurística + evoluir para modelo IA)
- Integrar endpoint de recomendações no backend
- Criar componente UI para exibir recomendações no frontend
- Incluir logs e métricas para avaliar qualidade das recomendações

Labels: story, ai, backend, frontend, priority:medium
EOF

echo "Criando Story 3 (Recomendações IA)..."
STORY3_URL=$(gh issue create --title "[STORY] Implementar recomendações personalizadas usando IA" --body-file "$STORY3_BODY" --label story --label ai --label backend --label frontend --label "priority:medium")
echo "Story 3 criada: $STORY3_URL"

### Story 4: Notificações de pedido
STORY4_BODY="$TMPDIR/story4.md"
cat > "$STORY4_BODY" <<EOF
[STORY] Implementar notificações de status de pedido

Parent Epic: #$EPIC_NUMBER

## User Story
Como usuário que realizou um pedido
Quero receber notificações sobre o status do meu pedido
Para ser informado quando o pedido for confirmado, enviado ou entregue

## Critérios de aceitação — BDD
Dado que um pedido foi criado e pago
Quando o status do pedido mudar (ex.: confirmado, enviado, entregue)
Então o usuário deve receber uma notificação push or in-app correspondente

## Checklist técnico
- Implementar serviço de eventos para mudanças de status do pedido
- Integrar mecanismo de envio de notificações (push/in-app) em ambiente de testes
- Adicionar permissões e UI para gerenciar notificações no app
- Cobrir fluxos críticos com testes end-to-end (simulados)

Labels: story, backend, frontend, priority:medium
EOF

echo "Criando Story 4 (Notificações)..."
STORY4_URL=$(gh issue create --title "[STORY] Implementar notificações de status de pedido" --body-file "$STORY4_BODY" --label story --label backend --label frontend --label "priority:medium")
echo "Story 4 criada: $STORY4_URL"

# 3) Docs issue
DOCS_BODY="$TMPDIR/docs.md"
cat > "$DOCS_BODY" <<EOF
[DOCS] Documentação inicial: Arquitetura, Contribuição e Uso de IA

## Objetivo
Criar documentação inicial com visão arquitetural, guia de contribuição e plano de uso de IA para acelerar tarefas (backlog, PRs, convenções).

Parent Epic: #$EPIC_NUMBER

## Conteúdo sugerido
- Visão geral da arquitetura (frontend, backend, serviços IA)
- Guia rápido de como rodar o projeto localmente
- Convenções de PR e commit
- Como a IA será utilizada (criação de backlog, PRs, templates)

Labels: docs, priority:medium
EOF

echo "Criando Docs..."
DOCS_URL=$(gh issue create --title "[DOCS] Documentação inicial: Arquitetura, Contribuição e Uso de IA" --body-file "$DOCS_BODY" --label docs --label "priority:medium")
echo "Docs criada: $DOCS_URL"

echo "Todas as Issues foram criadas. URLs:
Epic: $EPIC_URL
Story1: $STORY1_URL
Story2: $STORY2_URL
Story3: $STORY3_URL
Story4: $STORY4_URL
Docs: $DOCS_URL"

echo "Diretório temporário preservado em $TMPDIR para inspeção." 

exit 0
