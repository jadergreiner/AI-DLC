# CLAUDE.md - AI-DLC Guidelines

This repository adheres to the **AI-DLC (AI-Driven Development Life Cycle)** framework.

## Commands & Quality Checks
- Test command: Run appropriate project test runner (e.g. `npm test`, `pytest`, `cargo test`)
- Lint command: Run appropriate project linter (e.g. `npm run lint`, `ruff check .`)
- Build command: Run build verification (e.g. `npm run build`, `cargo check`)

## Workflow Principles
1. **Adaptive Tracks**:
   - **Full Track** for major features or non-trivial architectural changes.
   - **Fast Track** for bug fixes and minor changes.
2. **Inception & Approval**:
   - In Full Track, generate `aidlc-docs/requirements.md`, `aidlc-docs/architecture.md`, and `aidlc-docs/progress-tracker.md`.
   - Always request user approval before beginning implementation.
3. **Atomic Execution**:
   - Work on one Unit of Work at a time.
   - Keep `aidlc-docs/progress-tracker.md` up to date with `[IN_PROGRESS]` and `[COMPLETED]` statuses.
4. **Operations & Security**:
   - Verify security, secret management, and document deployment steps in `aidlc-docs/operations-guide.md`.
