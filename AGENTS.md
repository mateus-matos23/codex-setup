## Escopo
Estas são preferências globais. Siga primeiro as convenções, a arquitetura e os
comandos definidos pelo repositório atual.

## Decisões
- Pare e pergunte quando a ambiguidade puder alterar contrato, dados, segurança ou comportamento observável.
- Para ambiguidade técnica de baixo impacto, siga o padrão do projeto e registre a suposição em 1 linha no fim.

## Código
- Legibilidade > esperteza. Se precisa de comentário para explicar o quê, reescreva mais simples.
- Nomes devem explicar a responsabilidade sem abrir o corpo da função.
- Prefira funções pequenas, cada uma com uma responsabilidade.
- Respeite o sistema de tipos e as regras do projeto; não burle o compilador com tipos permissivos ou casts sem justificativa.
- Não esconda erros com `try/catch` genérico ou fallback silencioso em input inválido.
- Procure utilitários e helpers existentes antes de criar novos.
- Não introduza abstrações, configurações ou flexibilidade especulativa.
- Edite em lotes lógicos e preserve alterações não relacionadas.
- Considere complexidade ciclomática e Big O em algoritmos.

## Navegação e ferramentas
- Prefira Serena para navegação semântica quando estiver disponível e for apropriado; use ferramentas locais como fallback.
- Leia somente o trecho relevante, salvo quando o contexto completo for necessário.
- Não repita buscas ou leituras sem motivo concreto.
- Para documentação de bibliotecas, frameworks, SDKs, APIs, CLIs e serviços, consulte a documentação oficial atual; use `ctx7` para terceiros e OpenAI Docs para produtos OpenAI/Codex.

## Subagentes
- Escolha modelo e esforço de acordo com o tamanho e o risco da tarefa.
- Use explorer para leitura e mapeamento, worker para implementação definida e reviewer para corretude, segurança e arquitetura.
- Não rode subagente sem tarefa concreta e delimitada.

## Skills
- Use a skill disponível quando ela corresponder ao tipo de tarefa.
- Para correções de bugs, priorize diagnóstico da causa raiz e evite workarounds.

## Code Review Rules
- Sinalize apenas problemas que possam causar comportamento incorreto, regressão, risco de segurança, quebra de contrato ou manutenção claramente mais difícil.
- Priorize o caminho principal, os casos-limite e os efeitos nos consumidores; não transforme preferências de estilo em bloqueios.
- Considere lint, formatação e convenções mecânicas responsabilidade dos checks automatizados do projeto.
- Se não houver achados relevantes, declare isso explicitamente.

## Comunicação
- Seja direto e objetivo.
- Evite resumo longo para tarefas simples.

## Validação
- Toda mudança de lógica precisa de teste correspondente.
- Testes devem cobrir os principais edge cases da funcionalidade.
- Execute os checks disponíveis e relevantes ao tipo de alteração; não bloqueie documentação ou configuração em uma suíte sem relação.