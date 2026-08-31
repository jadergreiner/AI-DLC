<#
.SYNOPSIS
    Instalador do AI-DLC (AI-Driven Development Life Cycle) para projetos locais.
.DESCRIPTION
    Configura as regras, diretrizes e templates do AI-DLC para o assistente de codificação escolhido.
.PARAMETER Target
    O assistente alvo: antigravity, cursor, claude, copilot, cline, windsurf, aider ou all.
.PARAMETER Destination
    O diretório raiz do projeto de destino (padrão: diretório atual).
.EXAMPLE
    .\scripts\install.ps1 -Target cursor -Destination "C:\repos\meu-projeto"
#>

[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [ValidateSet('antigravity', 'cursor', 'claude', 'copilot', 'cline', 'windsurf', 'aider', 'all')]
    [string]$Target,

    [Parameter(Position = 1)]
    [string]$Destination = "."
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$rootDir = Split-Path -Parent $scriptDir
$destPath = Resolve-Path $Destination -ErrorAction SilentlyContinue
if (-not $destPath) {
    New-Item -ItemType Directory -Force -Path $Destination | Out-Null
    $destPath = (Resolve-Path $Destination).Path
} else {
    $destPath = $destPath.Path
}

Write-Host "`n🚀 AI-DLC (AI-Driven Development Life Cycle) Installer" -ForegroundColor Cyan
Write-Host "Destino: $destPath`n" -ForegroundColor Gray

if (-not $Target) {
    Write-Host "Selecione o assistente de IA configurado no projeto:" -ForegroundColor Yellow
    Write-Host "  1) Antigravity / Gemini IDE"
    Write-Host "  2) Cursor IDE"
    Write-Host "  3) Claude Code"
    Write-Host "  4) GitHub Copilot"
    Write-Host "  5) Cline / Roo Code"
    Write-Host "  6) Windsurf IDE"
    Write-Host "  7) Aider"
    Write-Host "  8) Todos (All)"
    $choice = Read-Host "Opção (1-8)"
    switch ($choice) {
        '1' { $Target = 'antigravity' }
        '2' { $Target = 'cursor' }
        '3' { $Target = 'claude' }
        '4' { $Target = 'copilot' }
        '5' { $Target = 'cline' }
        '6' { $Target = 'windsurf' }
        '7' { $Target = 'aider' }
        '8' { $Target = 'all' }
        default {
            Write-Error "Opção inválida."
            exit 1
        }
    }
}

# 1. Copiar pasta rules/ compartilhada
$destRules = Join-Path $destPath "rules"
Write-Host "📦 Copiando regras centrais para $destRules..." -ForegroundColor Green
Copy-Item -Path (Join-Path $rootDir "rules") -Destination $destPath -Recurse -Force

# 2. Copiar templates específicos do assistente
function Install-AssistantConfig([string]$name) {
    Write-Host "⚙️ Configurando template para: $name" -ForegroundColor Cyan
    switch ($name) {
        'antigravity' {
            Copy-Item (Join-Path $rootDir "templates\antigravity\AGENTS.md") -Destination (Join-Path $destPath "AGENTS.md") -Force
            $skillDir = Join-Path $destPath ".agents\skills\aidlc"
            New-Item -ItemType Directory -Force -Path $skillDir | Out-Null
            Copy-Item (Join-Path $rootDir "templates\antigravity\skills\aidlc\SKILL.md") -Destination (Join-Path $skillDir "SKILL.md") -Force
        }
        'cursor' {
            $cursorRules = Join-Path $destPath ".cursor\rules"
            New-Item -ItemType Directory -Force -Path $cursorRules | Out-Null
            Copy-Item (Join-Path $rootDir "templates\cursor\.cursor\rules\aidlc.mdc") -Destination (Join-Path $cursorRules "aidlc.mdc") -Force
        }
        'claude' {
            Copy-Item (Join-Path $rootDir "templates\claude\CLAUDE.md") -Destination (Join-Path $destPath "CLAUDE.md") -Force
        }
        'copilot' {
            $githubDir = Join-Path $destPath ".github"
            New-Item -ItemType Directory -Force -Path $githubDir | Out-Null
            Copy-Item (Join-Path $rootDir "templates\copilot\.github\copilot-instructions.md") -Destination (Join-Path $githubDir "copilot-instructions.md") -Force
        }
        'cline' {
            Copy-Item (Join-Path $rootDir "templates\cline\.clinerules") -Destination (Join-Path $destPath ".clinerules") -Force
        }
        'windsurf' {
            Copy-Item (Join-Path $rootDir "templates\windsurf\.windsurfrules") -Destination (Join-Path $destPath ".windsurfrules") -Force
        }
        'aider' {
            Copy-Item (Join-Path $rootDir "templates\aider\CONVENTIONS.md") -Destination (Join-Path $destPath "CONVENTIONS.md") -Force
            Copy-Item (Join-Path $rootDir "templates\aider\.aider.conf.yml") -Destination (Join-Path $destPath ".aider.conf.yml") -Force
        }
    }
}

if ($Target -eq 'all') {
    @('antigravity', 'cursor', 'claude', 'copilot', 'cline', 'windsurf', 'aider') | ForEach-Object {
        Install-AssistantConfig $_
    }
} else {
    Install-AssistantConfig $Target
}

# 3. Inicializar pasta aidlc-docs/ se não existir
$aidlcDocs = Join-Path $destPath "aidlc-docs"
if (-not (Test-Path $aidlcDocs)) {
    New-Item -ItemType Directory -Force -Path $aidlcDocs | Out-Null
    $readmeDocs = @'
# AI-DLC Documentation Directory

Este diretório armazena os artefatos de governança e ciclo de vida do projeto:
- `requirements.md`: Especificação e critérios de aceitação.
- `architecture.md`: Blueprint técnico, modelos e diagramas.
- `progress-tracker.md`: Rastreamento atômico de Units of Work.
- `operations-guide.md`: Guia de deployment, variáveis de ambiente e observabilidade.
'@
    $readmeDocs | Out-File -FilePath (Join-Path $aidlcDocs "README.md") -Encoding utf8
}

Write-Host ""
Write-Host "[OK] AI-DLC instalado com sucesso em: $destPath" -ForegroundColor Green
Write-Host "Proximos passos:" -ForegroundColor Yellow
Write-Host "1. Abra seu projeto no editor ($Target)."
Write-Host "2. Ao solicitar uma nova tarefa ao agente, mencione: 'Siga o AI-DLC Full Track' ou 'Siga o AI-DLC Fast Track'."
Write-Host "3. O agente mantera os artefatos em 'aidlc-docs/' e avancara com verificacoes automaticas."
Write-Host ""
