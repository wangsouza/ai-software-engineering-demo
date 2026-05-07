# Shop4u — ai-software-engineering-demo

Projeto demonstrativo: Shop4u é um aplicativo móvel de e-commerce com recomendações personalizadas por IA. Este repositório contém artefatos de engenharia (issues, scripts e documentação) para suportar o desenvolvimento colaborativo do produto.

## Objetivo

Fornecer uma base para desenvolver uma experiência móvel de compra que inclua busca de produtos, gerenciamento de carrinho, checkout autenticado, recomendações por IA e notificações de pedido.

## Visão geral

O repositório não contém uma aplicação móvel pronta para execução. Ele documenta requisitos, fluxos e utilitários para o time trabalhar em features do Shop4u. O foco inicial é criar backlog, infraestrutura de Issues e convenções para acelerar desenvolvimento assistido por IA.

## Funcionalidades (escopo inicial)

- Busca de produtos por nome e categoria
- Carrinho de compras
- Checkout com autenticação e integração com gateway de pagamento (sandbox)
- Recomendações personalizadas por IA
- Notificações de status do pedido

> Observação: estas funcionalidades são descritas na documentação e no backlog; a implementação concreta depende das tarefas nas Issues e do código em `src/`.

## Estrutura de pastas

```
.
├── .github/
├── docs/
├── scripts/
├── src/
├── CONTRIBUTING.md
└── README.md
```

## Como trabalhar com o repositório

- Iniciar trabalho em uma Issue:

```bash
./scripts/start_issue.sh
```

- Abrir Pull Request:

```bash
./scripts/open_pr.sh
```

Este repositório usa o GitHub CLI (`gh`) nos scripts para listar Issues e criar Pull Requests.

## Fluxo de desenvolvimento

```
Issue
→ branch (gerada por scripts/start_issue.sh)
→ commit (Conventional Commits)
→ Pull Request (scripts/open_pr.sh)
→ merge
```

## Convenção de commits

Use Conventional Commits, por exemplo:

```
feat: nova funcionalidade
fix: correção
docs: documentação
chore: configuração
```

## Scripts disponíveis

- `./scripts/start_issue.sh` — iniciar branch a partir de uma Issue
- `./scripts/open_pr.sh` — criar Pull Request a partir da branch atual

## Mais documentação

Consulte a pasta `docs/` para notas de produto, ata de reuniões e templates.

