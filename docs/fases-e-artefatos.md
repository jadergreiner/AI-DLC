# Fases Adaptativas e Artefatos do AI-DLC

O fluxo de trabalho do AI-DLC é estruturado em **Três Fases Adaptativas**, com capacidade de comutação entre **Full Track** (projetos e novas funcionalidades) e **Fast Track** (ajustes rápidos e correções pontuais).

---

## 1. Modos de Execução (Tracks)

| Característica | Full Track (Padrão / Complexo) | Fast Track (Ágil / Leve) |
|---|---|---|
| **Cenários de Uso** | Novas funcionalidades, refatorações amplas, novos serviços, integrações | Bugs com causa identificada, ajustes visuais pontuais, correções de texto |
| **Fase 1 (Inception)** | Completa: `requirements.md` e `architecture.md` detalhados | Resumo conciso do problema e solução proposta |
| **Gate de Aprovação** | Obrigatório antes de qualquer edição de código | Confirmação breve apenas se houver ambiguidade |
| **Fase 2 (Construction)** | Decomposição formal em Units of Work em `progress-tracker.md` | Execução direta com teste de regressão |
| **Fase 3 (Operations)** | Auditoria de segurança, guia de deploy e observabilidade | Verificação de integridade e linter |

---

## 2. As Três Fases Detalhadas (Full Track)

```
┌────────────────────────────────────────────────────────┐
│                   FASE 1: INCEPTION                    │
│    Requisitos ──► Arquitetura ──► Units of Work        │
└───────────────────────────┬────────────────────────────┘
                            │ (Gate de Aprovação Humana)
┌───────────────────────────▼────────────────────────────┐
│                  FASE 2: CONSTRUCTION                  │
│       UoW N ──► Testes / TDD ──► Verificação           │
└───────────────────────────┬────────────────────────────┘
                            │ (Todas UoWs Concluídas)
┌───────────────────────────▼────────────────────────────┐
│                   FASE 3: OPERATIONS                   │
│   Segurança ──► Observabilidade ──► Guia de Deploy     │
└────────────────────────────────────────────────────────┘
```

### Fase 1: Concepção & Refinamento (Inception & Refinement)
1. **Engenharia de Requisitos**:
   - Mapeamento de dores, histórias de usuário, requisitos funcionais e não funcionais.
   - Geração de `aidlc-docs/requirements.md`.
2. **Design Arquitetural & Avaliação de Trade-offs**:
   - Definição de contratos de API, modelos de dados, diagramas de arquitetura, riscos e alternativas avaliadas.
   - Geração de `aidlc-docs/architecture.md`.
3. **Plano de Decomposição (Units of Work)**:
   - Quebra da entrega em tarefas atômicas sequenciais em estado `[PROPOSED]`.
   - Inicialização do `aidlc-docs/progress-tracker.md`.
4. **Refinamento Interativo com o Usuário**:
   - O agente destaca premissas, trade-offs e limites de escopo (In Scope / Out of Scope), formulando perguntas direcionadas para o desenvolvedor.
5. **MANDATORY HARD STOP (Portão de Aprovação Mandatório)**:
   - O agente **interrompe a execução imediatamente** após apresentar o plano e aguarda autorização explícita do desenvolvedor humano.
   - É **estritamente proibido** criar ou alterar qualquer arquivo de código-fonte de implementação antes da aprovação do usuário.


---

### Fase 2: Construção (Construction)
1. **Ciclo por Unidade de Trabalho (UoW)**:
   - O agente seleciona a unidade atual, alterando seu estado para `[IN_PROGRESS]`.
2. **Desenvolvimento Guiado por Testes (TDD)**:
   - Escrita ou atualização dos testes automatizados para a funcionalidade em questão.
3. **Implementação e Auto-Revisão**:
   - Implementação estritamente focada nos arquivos da unidade atual.
   - Execução de testes de unidade e linters.
4. **Conclusão da Unidade**:
   - O agente marca a tarefa como `[COMPLETED]` no `progress-tracker.md` e parte para a próxima.

---

### Fase 3: Operações e Transição (Operations)
1. **Auditoria de Segurança**:
   - Verificação rigorosa contra chaves de API expostas, sanitização de inputs e dependências vulneráveis.
2. **Observabilidade**:
   - Padronização de logs estruturados e métricas de monitoramento.
3. **Guia de Operações**:
   - Geração de `aidlc-docs/operations-guide.md` com instruções claras de variáveis de ambiente, migrações de banco e procedimentos de rollback.

---

## 3. Estrutura Padrão do Diretório `aidlc-docs/`

```text
aidlc-docs/
├── requirements.md         # Requisitos funcionais, personas e critérios de aceitação
├── architecture.md         # Diagramas, contratos de dados e decisões de design
├── progress-tracker.md     # Checklist atômico de Units of Work com status
└── operations-guide.md     # Guia de implantação, observabilidade e contingência
```
