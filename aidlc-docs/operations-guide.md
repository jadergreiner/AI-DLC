# AI-DLC Operations & Governance Guide: Human-in-the-Loop Refinement & Hard Approval Gate

Este guia estabelece as diretrizes operacionais, de segurança e de governança para o framework **AI-DLC**.

---

## 1. Operação do Approval Gate na Prática

### 1.1. Como o Desenvolvedor Interage com o Agente
Quando uma nova tarefa de desenvolvimento for submetida a qualquer agente sob o AI-DLC:
1. O agente iniciará obrigatoriamente a **Fase 1 (Inception & Refinement)**.
2. O agente gerará/atualizará os arquivos em `aidlc-docs/` (`requirements.md`, `architecture.md`, `progress-tracker.md`).
3. O agente formulará pontos de refinamento, destacando premissas, trade-offs e limites de escopo.
4. **Parada Obrigatória (Hard Stop)**: O agente encerrará a resposta sem tocar em nenhum arquivo de código de produção.
5. O desenvolvedor revisa e responde com feedback ou aprovação explícita (*"Aprovado, pode iniciar a construção"*).

### 1.2. O que Fazer em Caso de Violação
Se um agente desobedecer a regra e gerar código antes de obter sua aprovação:
```bash
# Reverter as alterações indevidas de código preservando a documentação:
git restore src/
# Ou reverter arquivos não rastreados gerados:
git clean -fd src/
```
E instrua o agente:
> *"Você violou a regra do AI-DLC de Hard Approval Gate. Conclua primeiro o refinamento dos requisitos e aguarde minha aprovação explícita antes de codificar."*

---

## 2. Auditoria e Governança Contínua

- **Auditoria de Commits**: Nenhum pull request deve avançar se não contiver a atualização de `aidlc-docs/progress-tracker.md` com todos os critérios de aceitação marcados como concluídos.
- **Auditoria de Segredos e Credenciais**: Verifique antes do merge que nenhum token, secret ou chave de API foi inserido em arquivos de código ou documentação.
- **Integridade dos Templates**: Ao atualizar o framework, execute o script `./scripts/install.ps1` ou `./scripts/install.sh` para propagar as regras atualizadas para novos projetos.
