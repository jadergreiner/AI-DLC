# Especificação de Requisitos: Human-in-the-Loop Refinement & Mandatory Approval Gate

## 1. Problema & Motivação
Agentes autônomos de IA que operam sob o AI-DLC tendem a pular ou acelerar a fase de Inception, gerando os documentos de planejamento e, no mesmo turno de resposta, já iniciando a criação/modificação de código de produção sem:
1. Conduzir um refinamento prévio com o usuário (perguntas de alinhamento, avaliação de trade-offs e premissas).
2. Aguardar a validação e autorização explícita do desenvolvedor humano antes de iniciar a Fase de Construção.

Isso gera desperdício de tokens, commits desalinhados com a intenção do usuário, refatorações desnecessárias e perda de controle por parte do desenvolvedor.

---

## 2. Usuários & Perfis de Impacto
- **Desenvolvedor / Usuário Humano**: Mantém o controle e a governança total sobre o que será implementado, validando antes de qualquer linha de código ser escrita.
- **Agente de IA**: Recebe limites comportamentais inequívocos ("Hard Stop"), sem margem para ambiguidade sobre quando parar e esperar aprovação.

---

## 3. Requisitos Funcionais

- **RF-01 (Mandatory Human Refinement Cycle)**:
  - Na Fase de Inception (Full Track), o agente OBRIGATORIAMENTE deve apresentar:
    - Resumo dos requisitos e premissas levantadas.
    - Trade-offs arquiteturais identificados e decisões tomadas.
    - Decomposição das propostas de Units of Work (UoW).
    - Perguntas abertas ou pontos específicos de alinhamento com o usuário.

- **RF-02 (Hard Stop / Proibição de Código em Inception)**:
  - Durante toda a Fase 1 (Inception e Refinamento), é ESTRITAMENTE PROIBIDO criar, modificar ou excluir qualquer arquivo de código de produção ou testes de implementação.
  - Apenas arquivos de documentação (`aidlc-docs/` ou artefatos de plano) podem ser gerados/atualizados.
  - O agente DEVE interromper sua execução após submeter a Inception/Plano e solicitar formalmente a aprovação do usuário.

- **RF-03 (Transição de Fase com Gate Explícito)**:
  - A Fase 2 (Construction) só pode ser iniciada se houver autorização explícita do usuário (ex.: "Aprovado", "Pode prosseguir", "Siga com o plano").
  - O início da Fase 2 deve ser registrado no `progress-tracker.md`.

- **RF-04 (Blindagem e Restrição de Fast Track)**:
  - O Fast Track só pode ser acionado para tarefas triviais, pontuais e isoladas (bug fixes triviais de 1 arquivo, textos, pequenos ajustes de estilo).
  - Mesmo no Fast Track, o agente deve descrever sucintamente o que fará e como validará antes de executar, e NÃO PODE utilizar o Fast Track para contornar a Inception em tarefas com dependências ou múltiplos arquivos.

- **RF-05 (Unificação nos Templates de Ferramentas)**:
  - As diretrizes de Hard Stop e Refinamento devem ser propagadas de forma consistente para os templates de todas as ferramentas suportadas (`antigravity`, `cursor`, `windsurf`, `claude`, `cline`, `copilot`, `aider`).

---

## 4. Requisitos Não Funcionais
- **Clareza & Assertividade**: O prompt e as instruções devem usar linguagem imperativa e direta, eliminando brechas interpretativas para o LLM.
- **Retrocompatibilidade**: Manter compatibilidade com a estrutura de pastas `aidlc-docs/` e `rules/`.
- **Portabilidade**: Manter as regras acessíveis para múltiplas IDEs e extensões.

---

## 5. Critérios de Aceitação
1. Todas as regras centrais (`rules/core/core-workflow.md`, `rules/core/units-of-work.md`) documentam o Hard Stop e o Refinement Cycle.
2. Os guias detalhados (`rules/details/inception-requirements.md`, `rules/details/inception-architecture.md`) instruem o agente a levantar premissas e perguntas de alinhamento.
3. As instruções de agentes (`AGENTS.md`, `.agents/skills/aidlc/SKILL.md` e `templates/*/`) contêm a regra inequívoca de proibição de código sem aprovação.
