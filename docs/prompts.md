# Prompts usados no desenvolvimento — Shop4u

Este arquivo reúne os principais prompts (em português) que foram efetivamente
utilizados durante o desenvolvimento documental e de backlog deste repositório.
Não inclui prompts não utilizados.

## Geração de backlog

Prompt utilizado (resumido):

"Leia o arquivo docs/meeting-notes.md e gere um backlog inicial para GitHub Issues.

Objetivo:
Transformar a ata em um backlog estruturado para o projeto Shop4u, usando GitHub Issues.

Gere exatamente:
- 1 Epic
- 4 Stories
- 1 Docs

Regras de classificação:
- A Epic deve representar o objetivo macro do conjunto de funcionalidades.
- As Stories devem representar entregas funcionais implementáveis.
- A issue Docs deve representar documentação do projeto.
- Não transforme tarefas técnicas pequenas em Issues separadas.
- Tarefas técnicas devem ficar dentro da Story como checklist.
- Critérios de aceitação devem ficar dentro da Story em BDD usando Dado / Quando / Então.

Padrão dos títulos:
- Epic: [EPIC] ...
- Story: [STORY] ...
- Docs: [DOCS] ...

Labels permitidas: epic, story, docs, backend, frontend, ai, priority:high, priority:medium, priority:low

Conteúdo adicional: (regras sobre formatação, gh cli e modo de execução)..."

> Esse prompt foi usado para gerar os itens de backlog (Epic + 4 Stories + Docs)
> e para produzir o script `scripts/create_issues.sh`.

## User Stories

Prompt relacionado: o mesmo prompt de "Geração de backlog" (acima) que exigia o
formato das Stories com `## User Story`, `## Critérios de aceitação — BDD` e
`## Checklist técnico`. As Stories criadas seguiram exatamente esse padrão.

## UML

- Nenhum prompt específico para gerar UML foi utilizado neste projeto.

## Documentação

Prompts utilizados para criação/atualização de documentação:

- "Atualize README.md e CONTRIBUTING.md usando os templates em docs/templates e as instruções do repositório.

Considere: .github/copilot-instructions.md, .github/instructions/docs.instructions.md, docs/templates/README_TEMPLATE.md, docs/templates/CONTRIBUTING_TEMPLATE.md, scripts/start_issue.sh, scripts/open_pr.sh, docs/meeting-notes.md, docs/product.md, src/"

- "Documente o código em src/ usando as instruções do repositório. Crie ou atualize arquivos em docs/ quando necessário. Use linguagem técnica e objetiva. Não invente funcionalidades que não existam no código. Antes de alterar os arquivos, mostre um resumo do que será modificado. Ou para um arquivo específico: Analise o arquivo src/search.js e gere documentação técnica. Inclua: objetivo da função, parâmetros, retorno, exemplo de uso, limitações. Se fizer sentido, crie ou atualize docs/search-module.md."

- "Crie um Product Requirements Document (PRD) para o projeto Shop4u. Considere: docs/meeting-notes.md, docs/product.md, README.md, backlog e Issues do projeto, funcionalidades implementadas em src/. O PRD deve ser salvo em: docs/PRD.md. Estrutura mínima: (visão geral, problema, objetivos, público, funcionalidades principais, regras de negócio, requisitos funcionais, não funcionais, fluxo, arquitetura, stack, critérios de sucesso, limitações, próximos passos)."

Esses prompts foram usados para gerar/atualizar:

- `README.md` (conteúdo do projeto Shop4u)
- `CONTRIBUTING.md` (guia de contribuição)
- `src/search.js` (adição de JSDoc)
- `docs/search-module.md` (documentação técnica do módulo de busca)
- `docs/PRD.md` (Product Requirements Document)

## Testes automatizados

- Nenhum prompt foi usado especificamente para gerar testes automatizados neste repositório.

## Pull Requests

Prompts/instruções relacionadas às PRs utilizadas:

- Instrução para usar `./scripts/open_pr.sh` (script já presente) como fluxo padrão.
- Em um momento, foi solicitado ao assistente: "Revise rapidamente o PRD gerado. Se estiver consistente com o projeto atual: faça git add .; faça commit com mensagem: docs: adiciona PRD inicial do projeto; faça push da branch atual; abra uma Pull Request usando o template padrão" — essa solicitação resultou na criação de uma PR via `gh pr create --fill` (quando executada localmente no repositório).

## Refatoração

- Nenhum prompt específico de refatoração de código foi utilizado.

---

Observação final: este documento lista apenas os prompts efetivamente usados
durante as interações e operações que geraram artefatos neste repositório.
Se quiser que eu inclua versões completas dos prompts originais (texto integral
das solicitações), posso adicioná‑los aqui sob pedido.

## Textos integrais dos prompts usados

Abaixo estão os textos integrais (não resumidos) dos prompts que geraram os
artefatos principais do repositório.

### Geração de backlog (texto integral)

Leia o arquivo docs/meeting-notes.md e gere um backlog inicial para GitHub Issues.

Objetivo:
Transformar a ata em um backlog estruturado para o projeto Shop4u, usando GitHub Issues.

Gere exatamente:
- 1 Epic
- 4 Stories
- 1 Docs

Regras de classificação:
- A Epic deve representar o objetivo macro do conjunto de funcionalidades.
- As Stories devem representar entregas funcionais implementáveis.
- A issue Docs deve representar documentação do projeto.
- Não transforme tarefas técnicas pequenas em Issues separadas.
- Tarefas técnicas devem ficar dentro da Story como checklist.
- Critérios de aceitação devem ficar dentro da Story em BDD usando Dado / Quando / Então.

Padrão dos títulos:
- Epic: [EPIC] ...
- Story: [STORY] ...
- Docs: [DOCS] ...

Labels permitidas:
- epic
- story
- docs
- backend
- frontend
- ai
- priority:high
- priority:medium
- priority:low

Para cada Story, gere:
- User Story no formato Como / Quero / Para
- Critérios de aceitação — BDD
- Checklist técnico

Hierarquia:
- Todas as Stories devem pertencer à Epic criada.
- No corpo de cada Story, inclua:
 Parent Epic: #ID_DA_EPIC

Formato obrigatório do corpo das Issues:
- Use Markdown real com quebras de linha reais.
- Use seções como:
 ## User Story
 ## Critérios de aceitação — BDD
 ## Checklist técnico
- Não use \n escapado.
- Não use --body $"texto\ntexto".
- Para criar Issues via terminal, use body-file ou heredoc.

Compatibilidade com GitHub CLI:
- Não use --json nem --jq com gh issue create.
- O comando gh issue create deve retornar a URL da issue criada.
- Para capturar o número da issue, salve a URL em uma variável e extraia o número final com sed.

Modo de execução:
1. Primeiro, mostre todas as 6 sugestões para revisão, sem criar nenhuma Issue.
2. Depois, gere um script bash completo chamado scripts/create_issues.sh.
3. O script deve criar exatamente as 6 Issues usando gh issue create.
4. O script deve criar primeiro a Epic, capturar o número dela pela URL retornada pelo gh issue create e usar esse número como Parent Epic nas Stories.
5. O script deve usar arquivos temporários ou body-file para preservar a formatação Markdown.
6. Não execute o script automaticamente.
7. Apenas crie o arquivo scripts/create_issues.sh para eu revisar e executar manualmente.

Importante:
- Não crie apenas parte das Issues.
- Não pare após criar a Epic ou a primeira Story.
- Não execute comandos gh issue create diretamente no chat.
- A entrega esperada é: sugestões revisáveis + arquivo scripts/create_issues.sh completo.

### Documentação — atualização de README/CONTRIBUTING (texto integral)

Atualize o README.md e CONTRIBUTING.md usando os templates em docs/templates e as instruções do repositório.

Considere:
- .github/copilot-instructions.md
- .github/instructions/docs.instructions.md
- docs/templates/README_TEMPLATE.md
- docs/templates/CONTRIBUTING_TEMPLATE.md
- scripts/start_issue.sh
- scripts/open_pr.sh
- docs/meeting-notes.md
- docs/product.md
- src/

Não crie funcionalidades inexistentes.
Antes de alterar os arquivos, mostre um resumo do que será modificado.

### Documentação de código (texto integral)

Documente o código em src/ usando as instruções do repositório.

Crie ou atualize arquivos em docs/ quando necessário.
Use linguagem técnica e objetiva.
Não invente funcionalidades que não existam no código.
Antes de alterar os arquivos, mostre um resumo do que será modificado.

Ou para um arquivo específico:
Analise o arquivo src/search.js e gere documentação técnica.

Inclua:
- objetivo da função
- parâmetros
- retorno
- exemplo de uso
- limitações

Se fizer sentido, crie ou atualize docs/search-module.md.

### PRD (texto integral)

Crie um Product Requirements Document (PRD) para o projeto Shop4u.

Considere:
- docs/meeting-notes.md
- docs/product.md
- README.md
- backlog e Issues do projeto
- funcionalidades implementadas em src/

O PRD deve ser salvo em:
docs/PRD.md

Estrutura mínima:
- Visão geral do produto
- Problema resolvido
- Objetivos
- Público-alvo
- Funcionalidades principais
- Regras de negócio
- Requisitos funcionais
- Requisitos não funcionais
- Fluxo principal do usuário
- Arquitetura de alto nível
- Stack tecnológica
- Critérios de sucesso
- Limitações atuais
- Próximos passos

Importante:
- Não invente funcionalidades inexistentes
- Não crie branch
- Não faça commit
- Não faça push
- Apenas gere ou atualize docs/PRD.md

### Revisão e criação de PR (texto integral da solicitação de ação)

Revise rapidamente o PRD gerado.
Se estiver consistente com o projeto atual:

- faça git add .
- faça commit com mensagem:
	docs: adiciona PRD inicial do projeto
- faça push da branch atual
- abra uma Pull Request usando o template padrão

Não altere funcionalidades do código.
Apenas versione a documentação.

## English translations (full prompts)

Below are faithful English translations of the full prompts recorded above. They are provided for international collaborators and reference; the original Portuguese prompts were used to generate the artifacts.

### Backlog generation (full prompt - English)

Read the file docs/meeting-notes.md and generate an initial backlog for GitHub Issues.

Goal:
Transform the meeting notes into a structured backlog for the Shop4u project using GitHub Issues.

Generate exactly:
- 1 Epic
- 4 Stories
- 1 Docs

Classification rules:
- The Epic must represent the macro objective of the set of features.
- Stories must represent implementable functional deliveries.
- The Docs issue must represent project documentation.
- Do not turn small technical tasks into separate Issues.
- Technical tasks should remain inside the Story as a checklist.
- Acceptance criteria should be inside the Story in BDD using Given / When / Then.

Title pattern:
- Epic: [EPIC] ...
- Story: [STORY] ...
- Docs: [DOCS] ...

Allowed labels:
- epic
- story
- docs
- backend
- frontend
- ai
- priority:high
- priority:medium
- priority:low

For each Story, generate:
- User Story in the format As / I want / So that
- Acceptance criteria — BDD
- Technical checklist

Hierarchy:
- All Stories must belong to the created Epic.
- In the body of each Story, include:
 Parent Epic: #EPIC_ID

Required issue body format:
- Use real Markdown with real line breaks.
- Use sections like:
 ## User Story
 ## Acceptance criteria — BDD
 ## Technical checklist
- Do not use escaped \n.
- Do not use --body $"text\ntext".
- To create Issues via terminal, use body-file or heredoc.

GitHub CLI compatibility:
- Do not use --json or --jq with gh issue create.
- gh issue create must return the created issue URL.
- To capture the issue number, save the URL into a variable and extract the final number with sed.

Execution mode:
1. First, show all 6 suggestions for review, without creating any Issue.
2. Then, generate a complete bash script named scripts/create_issues.sh.
3. The script must create exactly the 6 Issues using gh issue create.
4. The script must create the Epic first, capture its number from the URL returned by gh issue create and use that number as Parent Epic in the Stories.
5. The script must use temporary files or body-file to preserve Markdown formatting.
6. Do not execute the script automatically.
7. Only create the file scripts/create_issues.sh for me to review and run manually.

Important:
- Do not create only part of the Issues.
- Do not stop after creating the Epic or the first Story.
- Do not execute gh issue create commands directly in the chat.
- The expected deliverable is: reviewable suggestions + the complete scripts/create_issues.sh file.

### Documentation — README/CONTRIBUTING update (full prompt - English)

Update README.md and CONTRIBUTING.md using the templates in docs/templates and the repository instructions.

Consider:
- .github/copilot-instructions.md
- .github/instructions/docs.instructions.md
- docs/templates/README_TEMPLATE.md
- docs/templates/CONTRIBUTING_TEMPLATE.md
- scripts/start_issue.sh
- scripts/open_pr.sh
- docs/meeting-notes.md
- docs/product.md
- src/

Do not create nonexistent features.
Before changing files, show a summary of what will be modified.

### Code documentation (full prompt - English)

Document the code in src/ using the repository instructions.

Create or update files in docs/ when necessary.
Use technical, objective language.
Do not invent features that do not exist in the code.
Before changing files, show a summary of what will be modified.

Or for a specific file:
Analyze the file src/search.js and generate technical documentation.

Include:
- function objective
- parameters
- return
- usage example
- limitations

If appropriate, create or update docs/search-module.md.

### PRD (full prompt - English)

Create a Product Requirements Document (PRD) for the Shop4u project.

Consider:
- docs/meeting-notes.md
- docs/product.md
- README.md
- the project's backlog and Issues
- features implemented in src/

The PRD must be saved to:
docs/PRD.md

Minimum structure:
- Product overview
- Problem solved
- Objectives
- Target audience
- Main features
- Business rules
- Functional requirements
- Non-functional requirements
- Main user flow
- High-level architecture
- Technology stack
- Success criteria
- Current limitations
- Next steps

Important:
- Do not invent nonexistent features
- Do not create a branch
- Do not commit
- Do not push
- Only generate or update docs/PRD.md

### PR review and creation (full prompt - English)

Quickly review the generated PRD.
If it is consistent with the current project:

- run git add .
- commit with message:
  docs: add initial project PRD
- push the current branch
- open a Pull Request using the default template

Do not change code features.
Only version the documentation.
