# Guia de Configuração por Assistente de IA

O AI-DLC foi projetado para funcionar perfeitamente com os principais assistentes de codificação do mercado. Você pode instalar as regras manualmente ou usando os scripts automatizados disponíveis na pasta `scripts/`.

---

## 1. Instalação Automatizada (Recomendado)

### Windows (PowerShell)
```powershell
# Instalar para um assistente específico (ex: cursor) no projeto atual:
.\scripts\install.ps1 -Target cursor

# Ou instalar em outro projeto:
.\scripts\install.ps1 -Target antigravity -Destination "C:\repos\meu-outro-projeto"
```

### Linux / macOS (Bash)
```bash
# Instalar para um assistente específico:
./scripts/install.sh claude

# Ou instalar apontando para outro diretório:
./scripts/install.sh cursor /caminho/para/outro/projeto
```

---

## 2. Configuração Manual por Assistente

### 🔹 Antigravity / Gemini IDE
- **Onde colocar**:
  - Copie `templates/antigravity/AGENTS.md` para a raiz do seu projeto.
  - Copie `templates/antigravity/skills/aidlc/` para `.agents/skills/aidlc/` no seu projeto.
  - Copie a pasta `rules/` para a raiz do seu projeto.
- **Como invocar**:
  - No chat do Antigravity, diga: *"Siga o fluxo AI-DLC Full Track para criar o módulo de pagamentos."*

### 🔹 Cursor IDE
- **Onde colocar**:
  - Copie `templates/cursor/.cursor/rules/aidlc.mdc` para `.cursor/rules/aidlc.mdc` no seu projeto.
  - Copie a pasta `rules/` para a raiz do seu projeto.
- **Como invocar**:
  - As regras são aplicadas automaticamente (`alwaysApply: true`). Ao solicitar uma feature, peça: *"Execute o AI-DLC Full Track"*.

### 🔹 Claude Code
- **Onde colocar**:
  - Copie `templates/claude/CLAUDE.md` para a raiz do seu repositório.
  - Copie a pasta `rules/` para a raiz do seu projeto.
- **Como invocar**:
  - O Claude Code carrega o `CLAUDE.md` automaticamente ao iniciar cada sessão de terminal.

### 🔹 GitHub Copilot (VS Code / JetBrains)
- **Onde colocar**:
  - Copie `templates/copilot/.github/copilot-instructions.md` para `.github/copilot-instructions.md`.
  - Copie a pasta `rules/` para a raiz do seu projeto.
- **Como invocar**:
  - No Copilot Chat, mencione: *"Conforme as instruções AI-DLC, crie a documentação de Inception antes de implementar."*

### 🔹 Cline / Roo Code
- **Onde colocar**:
  - Copie `templates/cline/.clinerules` para a raiz do seu projeto.
  - Copie a pasta `rules/` para a raiz do seu projeto.

### 🔹 Windsurf IDE
- **Onde colocar**:
  - Copie `templates/windsurf/.windsurfrules` para a raiz do seu projeto.
  - Copie a pasta `rules/` para a raiz do seu projeto.

### 🔹 Aider
- **Onde colocar**:
  - Copie `templates/aider/CONVENTIONS.md` e `templates/aider/.aider.conf.yml` para a raiz do seu projeto.
  - Copie a pasta `rules/` para a raiz do seu projeto.
