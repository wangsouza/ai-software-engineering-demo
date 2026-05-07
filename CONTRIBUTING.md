# Guia de contribuição

Obrigado por contribuir com o Shop4u (ai-software-engineering-demo). Este guia descreve o fluxo de trabalho, convenções e scripts que o time deve seguir.

## Fluxo de contribuição

1. Escolha uma Issue aberta (veja `gh issue list` ou use `./scripts/start_issue.sh`).
2. Inicie uma branch com `./scripts/start_issue.sh`.
3. Implemente a alteração no repositório local.
4. Faça commits seguindo a convenção (Conventional Commits).
5. Abra um Pull Request com `./scripts/open_pr.sh`.
6. Aguarde revisão, ajuste se necessário e faça merge.
7. Apague a branch local/remota após o merge.

## Como iniciar uma Issue

```bash
./scripts/start_issue.sh
```

O script lista Issues abertas via `gh` e cria uma branch com o padrão:

```
<tipo>/<issue-id>-slug
```

Onde `<tipo>` normalmente é `feature`, `docs` ou `fix`.

## Como fazer commit

Exemplo prático:

```bash
git add .
git commit -m "feat: descrição curta da alteração"
```

## Como abrir Pull Request

```bash
./scripts/open_pr.sh
```

O script usa a branch atual para extrair o número da Issue e cria o PR com um `body` padrão que inclui checklist de validação.

## Padrão de branches

```
feature/<issue-id>-descricao
docs/<issue-id>-descricao
fix/<issue-id>-descricao
```

## Padrão de commits

Use Conventional Commits:

```
feat: nova funcionalidade
fix: correção
docs: documentação
chore: configuração
test: adicionar testes
refactor: refatoração
```

## Checklist antes do merge

- [ ] A Issue relacionada está correta.
- [ ] O PR contém `Closes #ID` quando aplica.
- [ ] A User Story foi considerada.
- [ ] Os critérios BDD foram atendidos.
- [ ] O código foi testado (unitário, integração ou manual, quando aplicável).
- [ ] A documentação foi atualizada, quando necessário.

## Guia rápido de revisão

- Verifique se os commits seguem a convenção.
- Confirme se os testes relevantes passaram.
- Confirme se o PR fecha a Issue relacionada e que o checklist foi atendido.

## Uso da IA

O time pode usar a IA para acelerar criação de backlog, templates de PR e documentação, desde que as sugestões sejam revisadas por um humano e não adicionem funcionalidades não implementadas no repositório.

## Observações finais

- Não documente funcionalidades inexistentes no repositório. Descreva o que está nos arquivos e nas Issues.
- Para detalhes do produto e contexto, consulte `docs/product.md` e `docs/meeting-notes.md`.

