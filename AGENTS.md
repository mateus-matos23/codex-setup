## Escopo

Estas são preferências globais. Siga primeiro as convenções, a arquitetura e os
comandos definidos pelo repositório atual.

## Decisões

- Pare e pergunte quando a ambiguidade puder alterar contrato, dados, segurança
  ou comportamento observável.
- Para ambiguidade técnica de baixo impacto, siga o padrão do projeto e
  registre a suposição em uma linha no fim.

## Código

- Corretude, contratos e segurança vêm antes de simplicidade; depois prefira a
  solução simples, testável e de baixo acoplamento.
- Prefira nomes que expliquem a responsabilidade, funções pequenas e arquivos
  coesos. Extraia somente quando isso reduzir esforço cognitivo, isolar efeitos
  ou criar uma fronteira de teste.
- Legibilidade > esperteza. Se um comentário precisa explicar o quê o código
  faz, reescreva o código de forma mais simples.
- Respeite o sistema de tipos; não use tipos permissivos ou casts sem
  justificativa.
- Valide todo input externo no servidor antes de entrar no fluxo da aplicação.
- Trate erros explicitamente. Não use `try/catch` genérico para esconder falhas,
  fallback silencioso ou exposição de detalhes internos.
- Não introduza abstrações, configurações, campos, endpoints ou dependências
  especulativas. Procure utilitários existentes antes de criar novos.
- Preserve alterações não relacionadas e considere complexidade, I/O, queries,
  memória e renders quando a mudança processar dados ou atualizar UI.

## Navegação e documentação

- Leia somente os trechos relevantes e não repita buscas sem motivo concreto.
- Para bibliotecas, frameworks, SDKs, APIs, CLIs e serviços, consulte a
  documentação oficial atual; use OpenAI Docs para produtos OpenAI/Codex e ctx7
  para terceiros quando disponível.

## Subagentes e contexto

- Use `software-development-workflow` como entrada para alterações de software.
- Escolha explorer para leitura, worker para implementação definida e reviewer
  para corretude, segurança e arquitetura.
- Não rode subagente sem tarefa delimitada; por padrão, use no máximo um
  subagente somente leitura por vez e nunca paralelize escritores na mesma área.
- Busque e leia apenas o necessário, prefira resumos com caminhos e símbolos e
  execute checks focados antes de suítes amplas.
- Use skills especializadas explicitamente apenas quando o roteamento indicar
  uma necessidade concreta.

## Memória

- Memória é uma pista reutilizável, não substitui evidência atual do repositório.
- Não registre segredos, credenciais, dados pessoais, estado temporário ou
  hipóteses não verificadas.
- Consulte `docs/memory-policy.md` para regras de retenção e atualização.

## Git e comunicação

- Preserve alterações locais e nunca reescreva histórico compartilhado sem
  autorização explícita.
- Seja direto e objetivo. Evite resumo longo para tarefas simples.
- Reporte mudanças, validações, limitações e suposições relevantes.

## Validação

- Toda mudança de lógica precisa de teste correspondente e casos-limite
  relevantes.
- Valide cada fatia antes de iniciar a próxima; uma falha concreta ou contrato
  inconsistente bloqueia o avanço até ser resolvido ou classificado.
- Execute os gates relevantes ao tipo de alteração, amplie somente quando houver
  risco, falha ou contrato afetado e rode `git diff --check`.
- Não declare conclusão com falha concreta sem classificação.
