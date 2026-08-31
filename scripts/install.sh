#!/usr/bin/env bash
#
# Instalador do AI-DLC (AI-Driven Development Life Cycle) para Unix/Linux/macOS
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
TARGET="${1:-}"
DESTINATION="${2:-.}"

mkdir -p "$DESTINATION"
DEST_PATH="$(cd "$DESTINATION" && pwd)"

echo -e "\n\033[36m🚀 AI-DLC (AI-Driven Development Life Cycle) Installer\033[0m"
echo -e "\033[90mDestino: $DEST_PATH\033[0m\n"

if [ -z "$TARGET" ]; then
    echo -e "\033[33mSelecione o assistente de IA configurado no projeto:\033[0m"
    echo "  1) Antigravity / Gemini IDE"
    echo "  2) Cursor IDE"
    echo "  3) Claude Code"
    echo "  4) GitHub Copilot"
    echo "  5) Cline / Roo Code"
    echo "  6) Windsurf IDE"
    echo "  7) Aider"
    echo "  8) Todos (All)"
    read -p "Opção (1-8): " choice
    case "$choice" in
        1) TARGET="antigravity" ;;
        2) TARGET="cursor" ;;
        3) TARGET="claude" ;;
        4) TARGET="copilot" ;;
        5) TARGET="cline" ;;
        6) TARGET="windsurf" ;;
        7) TARGET="aider" ;;
        8) TARGET="all" ;;
        *) echo "Opção inválida."; exit 1 ;;
    esac
fi

# 1. Copiar rules/
echo -e "\033[32m📦 Copiando regras centrais para $DEST_PATH/rules...\033[0m"
cp -R "$ROOT_DIR/rules" "$DEST_PATH/"

install_target() {
    local name="$1"
    echo -e "\033[36m⚙️ Configurando template para: $name\033[0m"
    case "$name" in
        antigravity)
            cp "$ROOT_DIR/templates/antigravity/AGENTS.md" "$DEST_PATH/AGENTS.md"
            mkdir -p "$DEST_PATH/.agents/skills/aidlc"
            cp "$ROOT_DIR/templates/antigravity/skills/aidlc/SKILL.md" "$DEST_PATH/.agents/skills/aidlc/SKILL.md"
            ;;
        cursor)
            mkdir -p "$DEST_PATH/.cursor/rules"
            cp "$ROOT_DIR/templates/cursor/.cursor/rules/aidlc.mdc" "$DEST_PATH/.cursor/rules/aidlc.mdc"
            ;;
        claude)
            cp "$ROOT_DIR/templates/claude/CLAUDE.md" "$DEST_PATH/CLAUDE.md"
            ;;
        copilot)
            mkdir -p "$DEST_PATH/.github"
            cp "$ROOT_DIR/templates/copilot/.github/copilot-instructions.md" "$DEST_PATH/.github/copilot-instructions.md"
            ;;
        cline)
            cp "$ROOT_DIR/templates/cline/.clinerules" "$DEST_PATH/.clinerules"
            ;;
        windsurf)
            cp "$ROOT_DIR/templates/windsurf/.windsurfrules" "$DEST_PATH/.windsurfrules"
            ;;
        aider)
            cp "$ROOT_DIR/templates/aider/CONVENTIONS.md" "$DEST_PATH/CONVENTIONS.md"
            cp "$ROOT_DIR/templates/aider/.aider.conf.yml" "$DEST_PATH/.aider.conf.yml"
            ;;
    esac
}

if [ "$TARGET" = "all" ]; then
    for t in antigravity cursor claude copilot cline windsurf aider; do
        install_target "$t"
    done
else
    install_target "$TARGET"
fi

# 2. Inicializar pasta aidlc-docs/
if [ ! -d "$DEST_PATH/aidlc-docs" ]; then
    mkdir -p "$DEST_PATH/aidlc-docs"
    cat << 'EOF' > "$DEST_PATH/aidlc-docs/README.md"
# AI-DLC Documentation Directory

Este diretório armazena os artefatos de governança e ciclo de vida do projeto:
- `requirements.md`: Especificação e critérios de aceitação.
- `architecture.md`: Blueprint técnico, modelos e diagramas.
- `progress-tracker.md`: Rastreamento atômico de Units of Work.
- `operations-guide.md`: Guia de deployment, variáveis de ambiente e observabilidade.
EOF
fi

echo -e "\n\033[32m✅ AI-DLC instalado com sucesso em: $DEST_PATH\033[0m"
echo -e "\033[33mPróximos passos:\033[0m"
echo "1. Abra seu projeto no editor ($TARGET)."
echo "2. Solicite a tarefa ao agente especificando: 'Siga o AI-DLC Full Track' ou 'Siga o AI-DLC Fast Track'."
echo "3. O agente utilizará os artefatos em 'aidlc-docs/' com validações automatizadas."
