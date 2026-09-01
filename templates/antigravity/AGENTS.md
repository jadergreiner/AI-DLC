# AI-DLC (AI-Driven Development Life Cycle) - Antigravity Agent Guidelines

This project follows the **AI-DLC** methodology.

## Workflow Rules
- **Full Track**: For new features, architectural changes, and multi-file work:
  1. Execute Inception & Refinement: Generate `aidlc-docs/requirements.md`, `aidlc-docs/architecture.md`, and `aidlc-docs/progress-tracker.md`.
  2. **Mandatory Hard Stop**: STOP the conversation turn after presenting the Inception plan. Never write or modify implementation code before explicit human approval.
  3. Construction: Once approved, execute one Unit of Work at a time (TDD/automated tests, linter, commit).
  4. Operations: Verify security, observability, and generate `aidlc-docs/operations-guide.md`.
- **Fast Track**: Strictly limited to isolated single-file fixes. Propose intent first, execute with tests, and summarize.
- Never advance from Inception to Construction without explicit human approval.

