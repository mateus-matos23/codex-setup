# Skill evaluations

Estes casos verificam o comportamento esperado do workflow sem executar
modelos automaticamente. Use um caso por vez em um repositório de teste, com o
menor contexto necessário, e compare a resposta com as seções esperadas.

```text
Use $software-development-workflow and evaluate evals/cases/<case>.md.
Do not edit files. Return only the plan, routing decision, risks and validation.
```

O objetivo é verificar decisões observáveis, não comparar texto literalmente.
Atualize um caso somente quando a preferência do workflow mudar de forma
intencional.

## Cadência

- Rode `./scripts/validate-evals.sh` sempre que alterar um caso.
- Após alterar uma skill ou configuração, execute os casos relacionados uma vez
  em um repositório de teste.
- Após três tarefas reais, execute o caso que mais se aproxima do maior risco
  observado.
- Registre somente modelo, esforço, resultado, falha observada e ação em
  [results.md](results.md). Não copie transcripts, logs extensos ou dados do
  projeto para este repositório.
- Atualize uma skill apenas quando houver evidência suficiente para mudar uma
  decisão; não transforme uma hipótese isolada em regra global.
