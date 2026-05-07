# PRD — Shop4u

## Visão geral do produto

Shop4u é um projeto demonstrativo para um aplicativo móvel de e‑commerce com recomendações personalizadas por IA. Este repositório contém documentação, scripts e artefatos de engenharia para suportar o desenvolvimento colaborativo do produto.

Fontes: [docs/meeting-notes.md](docs/meeting-notes.md), [docs/product.md](docs/product.md), [README.md](README.md).

## Problema resolvido

Consumidores móveis precisam de uma experiência de descoberta e compra rápida e personalizada; lojas online desejam aumentar conversões apresentando produtos relevantes e simplificando o fluxo de compra.

## Objetivos

- Prover busca eficiente por produtos.
- Oferecer recomendações personalizadas baseadas em histórico de navegação.
- Suportar fluxo de carrinho e checkout autenticado com integração a gateway de pagamento (sandbox inicialmente).
- Notificar usuários sobre o status dos pedidos.

## Público-alvo

- Usuários finais de um app móvel de comércio eletrônico.
- Pequenas lojas que desejam catálogo online com recomendações básicas.

## Funcionalidades principais

- Busca de produtos por nome e categoria (implementada parcialmente no repositório através de `src/search.js` como utilitário de busca por nome).
- Carrinho de compras (planejado).
- Checkout com autenticação e integração de pagamento (planejado).
- Recomendações personalizadas por IA (planejado).
- Notificações de pedido (planejado).

Observação: além de `src/search.js` não há implementações completas no diretório `src/` — a maior parte das funcionalidades está em backlog/Issues.

## Regras de negócio

- Usuário deve estar autenticado para finalizar compra.
- Recomendações devem considerar histórico de navegação; usuários sem histórico recebem produtos populares.
- Pedido só deve ser criado após pagamento aprovado.
- Se o pagamento for recusado, o carrinho permanece ativo.

As regras são extraídas de [docs/meeting-notes.md](docs/meeting-notes.md).

## Requisitos funcionais

1. RF-001: Buscar produtos por nome (case-insensitive) — já suportado por `src/search.js`.
2. RF-002: Filtrar por categoria e paginar resultados (planejado).
3. RF-003: Gerenciar carrinho (adicionar/remover/listar) — backend + frontend.
4. RF-004: Checkout autenticado com integração de pagamento em sandbox e confirmação de pedido após pagamento.
5. RF-005: Serviço de recomendações que expõe endpoint consumível pelo frontend.
6. RF-006: Envio de notificações (push ou in‑app) sobre mudanças de status do pedido.

## Requisitos não funcionais

- RNF-001: Resposta de busca em tempo aceitável para UX móvel (p.ex. < 300ms para conjuntos pequenos de dados).
- RNF-002: API segura para operações de checkout (HTTPS, autenticação, sanitização de entradas).
- RNF-003: Capacidade de escalar serviço de recomendações independentemente do backend principal.
- RNF-004: Logs e métricas para avaliar qualidade de recomendações e taxas de conversão.

## Fluxo principal do usuário

1. Usuário abre app e pesquisa por um produto (busca).
2. Usuário adiciona itens ao carrinho.
3. Usuário autentica-se (se ainda não estiver autenticado).
4. Usuário finaliza o pagamento; se aprovado, pedido é criado e confirmação enviada; se recusado, o carrinho permanece ativo.

## Arquitetura de alto nível

- Cliente móvel (app) — UI de busca, carrinho, checkout, recomendações.
- Backend HTTP (APIs REST) — endpoints de produtos, carrinho, pedidos, autenticação, recomendações.
- Banco de dados (catálogo, usuários, pedidos, histórico de navegação).
- Serviço de recomendações (heurística → modelo IA) que consome sinais (visualizações, cliques) e expõe endpoint.
- Integração com gateway de pagamento (sandbox) e serviço de notificações (push/in‑app).

Diagrama (alto nível):

Client mobile ↔ Backend API ↔ DB
                   ↕
            Recommender Service
                   ↕
           Payment Gateway / Notifications

## Stack tecnológica (sugerida e compatível com o repositório)

- Backend: Node.js (já presente no `src/`), Express.js (sugerido)
- Frontend móvel: React Native ou similar (não implementado no repositório)
- Banco de dados: PostgreSQL ou MongoDB (depende do modelo de dados)
- Recommender: serviço separado em Node.js ou Python, com possibilidade de ML infra posterior
- Integração: GitHub, GitHub CLI (`gh`) para fluxo de Issues/PRs (scripts em `scripts/`)

## Critérios de sucesso

- Busca retorna resultados relevantes com latência aceitável.
- Taxa de conversão (add-to-cart → compra) aumenta após recomendações personalizadas.
- Checkout processa pagamentos com taxa baixa de falhas na integração sandbox.
- Time consegue iterar via Issues/Stories e validar funcionalidades em sprints.

## Limitações atuais

- Implementação mínima presente: `src/search.js` — utilitário de busca por nome.
- Não existem endpoints, banco de dados, autenticação ou serviços de pagamento implementados.
- Não há frontend móvel no repositório.

## Próximos passos recomendados

1. Priorizar backlog (transformar Stories em tasks executáveis). Consulte Issues e o script `scripts/create_issues.sh` criado previamente.
2. Implementar API inicial de produtos e endpoint de busca com paginação.
3. Implementar APIs de carrinho e mecanismo de persistência (DB).
4. Integrar gateway de pagamento em sandbox e implementar criação de pedidos somente após confirmação de pagamento.
5. Prototipar serviço de recomendações (iniciar por heurística com logs e métricas).
6. Adicionar testes automatizados e CI para validar fluxos críticos.

---

Arquivo gerado automaticamente com base em [docs/meeting-notes.md](docs/meeting-notes.md), [docs/product.md](docs/product.md) e no conteúdo atual do repositório.
