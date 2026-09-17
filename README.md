# ia-docs

Configurações e workflows pessoais para o Codex.

## Objetivo

Este repositório é a fonte versionada das minhas preferências, instruções e
skills. A configuração compartilhada fica aqui; cada computador recebe links
para estes arquivos, evitando cópia manual entre ambientes.

## Estrutura

- `AGENTS.md`: princípios gerais de trabalho, comunicação e validação.
- `config.toml`: configuração principal do Codex.
- `profiles/`: perfis selecionados com `codex --profile <nome>`.
- `profiles/machine.local.config.toml.example`: modelo para trusts locais por
  máquina; profiles `.local` não são versionados.
- `skills/`: skills próprias, mantidas como pastas com `SKILL.md`.
- `scripts/install.sh`: instala a configuração desta cópia do repositório.
- `scripts/validate-skills.sh`: valida todas as skills locais.
- `scripts/validate-evals.sh`: valida a estrutura dos casos de avaliação.
- `scripts/doctor.sh`: verifica arquivos, links, TOML e skills instaladas.
- `evals/`: casos de avaliação manual das decisões do workflow.
- `docs/memory-policy.md`: política para uso seguro e verificável de memória.
- `docs/skill-growth-policy.md`: critérios para criar novas skills.

As skills ficam em `skills/` para serem versionadas com o repositório. O
instalador cria links no diretório oficial de skills pessoais (`~/.agents/skills`),
que é descoberto pelo Codex em qualquer repositório.

## Workflow diário

1. Trabalhe normalmente em qualquer projeto.
2. Quando uma preferência mudar, altere o arquivo correspondente aqui.
3. Rode `./scripts/validate-skills.sh` se a mudança envolver uma skill.
4. Faça commit e envie as alterações para o repositório remoto.
5. No outro computador, atualize o clone e rode `./scripts/install.sh`.
6. Reinicie o Codex se uma alteração de skill ou configuração ainda não aparecer.

Depois da instalação, rode `./scripts/doctor.sh`. Para validar somente o clone,
sem exigir links no computador atual, use `./scripts/doctor.sh --repo-only`.

Trusts de projeto são específicos de cada máquina. Copie
`profiles/machine.local.config.toml.example` para um arquivo como
`profiles/notebook.local.config.toml`, ajuste os caminhos e rode o instalador.
Esses arquivos são ignorados pelo Git. O instalador e o `doctor.sh` mostram o
comando `codex --profile notebook.local` quando encontrarem esse profile.

O instalador cria backups datados quando já existe um arquivo no destino. Ele
não remove skills pessoais que não pertencem a este repositório.

## Implementação de funcionalidades

`software-development-workflow` é a skill de entrada para alterações de
software. Ela aplica os gates de pronto para começar e terminar em
`skills/software-development-workflow/references/quality-gates.md`, carregando
skills especializadas somente quando o roteamento indicar uma necessidade
concreta. A matriz de validação fica em
`skills/software-development-workflow/references/test-strategy.md`.

Funcionalidades com mais de uma etapa devem ser divididas em fatias verticais
pequenas, ordenadas por dependência. Cada fatia precisa ser concluída e validada
antes da próxima começar.

O checkpoint de cada fatia considera corretude, legibilidade, testabilidade,
complexidade, queries, renders, validação de input, autorização, tratamento de
erros e logs rastreáveis quando aplicável. Problemas concretos bloqueiam o
avanço; suspeitas são registradas com a evidência necessária para investigação.

## Princípios das skills

As skills devem representar decisões reutilizáveis, não listas genéricas de
boas práticas. Uma skill nova precisa ter um gatilho claro, escopo pequeno e
uma forma objetiva de verificar o resultado. Preferências gerais ficam no
`AGENTS.md`; procedimentos específicos ficam nas skills.

## Economia de uso

O padrão compartilhado usa `gpt-5.6-terra` com esforço médio. Exploração curta e
edições mecânicas usam `gpt-5.6-luna` com esforço baixo; tarefas ambíguas ou de
maior risco podem usar `gpt-5.6-sol` com esforço maior. O workflow evita
subagentes por padrão, limita a saída de ferramentas e recomenda aumentar o
esforço somente depois de confirmar que o contexto e o requisito estão
completos.

As skills especializadas são explícitas para reduzir ativações duplicadas. Use
`$contract-and-data-changes` para contratos e dados, `$project-context` para
repositórios desconhecidos e os demais especialistas apenas quando o caso se
encaixar no roteamento documentado.

As skills atuais são:

- `software-development-workflow`: orquestra planejamento, execução, gates e
  uso econômico de contexto/modelos.
- `contract-and-data-changes`: mantém APIs, dados, migrations e artefatos
  gerados alinhados.
- `project-context`: mapeia setup, comandos e validações sem editar o projeto.
- `diagnose-before-fix`: investiga a causa raiz antes de propor correções.
- `incremental-implementation`: conduz implementações por fatias verticais.
- `readable-code`: reduz esforço cognitivo, acoplamento e fragmentação artificial.
- `performance-aware-development`: verifica complexidade, I/O, queries e renders.
- `secure-application-development`: orienta validação, segurança, erros e logs.
- `focused-code-review`: revisa riscos reais no diff e nos consumidores.
- `safe-git-workflow`: trata branch, histórico e publicação com segurança.
