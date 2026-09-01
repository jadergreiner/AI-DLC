# Blueprint Arquitetural: Human-in-the-Loop Refinement & Strict Gate Engine

## 1. Visão Geral do Ciclo de Vida Evoluído

O ciclo de vida do AI-DLC passa a incorporar o **Refinamento Interativo** e a barreira mandatória (**Hard Gate**) como partes integrantes da especificação.

```
┌────────────────────────────────────────────────────────────────────────┐
│                          FASE 1: INCEPTION                             │
│                                                                        │
│   1A. Análise & Diagnóstico (Requisitos + Arquitetura Preliminar)      │
│                                │                                       │
│                                ▼                                       │
│   1B. Refinamento Interativo com o Usuário (Trade-offs, Riscos, Dúvidas)│
│                                │                                       │
│                                ▼                                       │
│   1C. Decomposição de UoWs com Critérios de Aceitação Testáveis        │
│                                │                                       │
│                                ▼                                       │
│ 🛑 HARD STOP MANDATÓRIO: Apresentar Plano & PARAR Execução             │
│    (ESTRITAMENTE PROIBIDO GERAR OU MODIFICAR CÓDIGO DE PRODUÇÃO)       │
└────────────────────────────────┬───────────────────────────────────────┘
                                 │
                                 │ 👤 Aprovação Humana Explícita ("Aprovado", "OK", "Execute")
                                 ▼
┌────────────────────────────────────────────────────────────────────────┐
│                        FASE 2: CONSTRUCTION                            │
│                                                                        │
│   - Transição registrada em `aidlc-docs/progress-tracker.md`           │
│   - Execução estritamente incremental: 1 UoW por vez                   │
│   - TDD / Verificação Automatizada Contínua                            │
└────────────────────────────────┬───────────────────────────────────────┘
                                 │
                                 │ Todas UoWs concluídas com testes passando
                                 ▼
┌────────────────────────────────────────────────────────────────────────┐
│                         FASE 3: OPERATIONS                             │
│   - Security & Secret Scan                                             │
│   - Operations Guide & Observabilidade                                │
│   - Validação Final e Relatório de Entrega                             │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Especificação do Gate de Refinamento (Phase 1 ➔ Phase 2)

### 2.1. Condições de Entrada da Fase 2 (Construction)
Para que qualquer ferramenta de edição de código de produção seja utilizada, TODAS as seguintes condições devem ser verdadeiras:
1. `aidlc-docs/requirements.md` e `aidlc-docs/architecture.md` gerados ou atualizados.
2. `aidlc-docs/progress-tracker.md` inicializado com Units of Work atômicas e critérios mensuráveis.
3. O agente parou a execução na resposta anterior e apresentou o plano ao usuário.
4. O usuário forneceu confirmação afirmativa inequívoca na mensagem seguinte.

### 2.2. Penalidade por Violação
Qualquer agente que gerar código antes do aval humano estará em violação direta do AI-DLC. O desenvolvedor pode ordenar o rollback imediato (`git checkout` / `git restore`) e exigir o retorno à Fase 1.

---

## 3. Matriz de Componentes Afetados

| Componente | Arquivo | Responsabilidade |
|---|---|---|
| **Core Workflow** | `rules/core/core-workflow.md` | Declara o Hard Gate, a proibição de código na Inception e os limites do Fast Track |
| **Units of Work** | `rules/core/units-of-work.md` | Adiciona o status de aprovação de UoWs e checklist de validação pré-execução |
| **Inception Req.** | `rules/details/inception-requirements.md` | Adiciona roteiro de perguntas e pontos de refinamento com o humano |
| **Inception Arch.** | `rules/details/inception-architecture.md` | Formaliza trade-offs e aprovação de decisões estruturais |
| **Agent Guidelines** | `AGENTS.md` & `.agents/skills/aidlc/SKILL.md` | Regras imediatas de parada de execução para os agentes locais |
| **Templates IDE** | `templates/*` | Replicação padronizada para Antigravity, Cursor, Windsurf, Claude, Cline, Copilot e Aider |
