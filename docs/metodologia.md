# Metodologia AI-DLC (AI-Driven Development Life Cycle)

O **AI-DLC (AI-Driven Development Life Cycle)** é um modelo de ciclo de vida de desenvolvimento de software desenhado especificamente para a era dos agentes de inteligência artificial e LLMs generativos.

Inspirado no projeto pioneiro de workflows de IA da AWS (`aidlc-workflows`), este repositório traz uma **versão agnóstica de provedores de nuvem, multi-assistentes e focada em qualidade de engenharia verificável**.

---

## 1. Por que um ciclo de vida específico para IA?

No desenvolvimento de software tradicional (SDLC / Agile / Scrum), o fluxo presume desenvolvedores humanos iterando em tarefas, interpretando contexto tácito e tomando decisões implícitas.

Quando introduzimos agentes autônomos de codificação, surgem novos desafios críticos:
- **Alucinação arquitetural**: Agentes escrevendo código sem compreender o quadro geral do sistema.
- **Modificações desmedidas**: Edições dispersas por dezenas de arquivos, aumentando a chance de quebra e regressões.
- **Falta de rastreabilidade**: Dificuldade de auditar *o porquê* de uma decisão ter sido tomada pelo agente.
- **Falsa sensação de conclusão**: Código que compila, mas não atende aos requisitos de segurança, escalabilidade ou testes.

O AI-DLC resolve isso ao transformar o agente de codificação em um engenheiro disciplinado que opera sob **fases adaptativas, artefatos padronizados e portões explícitos de validação humana e automatizada**.

---

## 2. Princípios Fundamentais do AI-DLC

1. **Planejar e Refinar Antes de Codificar (Plan & Refine Before Code)**:
   - Toda alteração relevante requer levantamento claro de requisitos, refinamento interativo de premissas com o desenvolvedor humano e design arquitetural documentado.
2. **Hard Approval Gate Mandatório (Zero Código Sem Aprovação)**:
   - É estritamente proibido criar ou editar código de produção/testes na fase de Inception. O agente deve parar a resposta e aguardar aprovação explícita do desenvolvedor humano antes de iniciar a construção. A autoaprovação pelo agente é vedada.
3. **Unidades de Trabalho Atômicas (Atomic Units of Work)**:
   - As tarefas de codificação são divididas em fatias pequenas, independentes e testáveis. O agente foca em uma unidade de cada vez.
4. **Verificação Contínua e Automatizada (Automated Verification)**:
   - Todo código produzido deve ser acompanhado por testes automatizados e passar em linters, checagens de tipos e compilação.
5. **Governança Transparente (`aidlc-docs/`)**:
   - As decisões, requisitos, checklists de progresso e procedimentos de operação são mantidos em uma pasta padrão (`aidlc-docs/`), versionada com o repositório.
6. **Neutralidade e Abertura**:
   - Livre de dependências de um único ecossistema proprietário. O fluxo funciona perfeitamente com GCP, AWS, Azure, on-premise ou desenvolvimento local.

