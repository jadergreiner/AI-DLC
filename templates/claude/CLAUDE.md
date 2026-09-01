# CLAUDE.md - AI-DLC Guidelines

This repository adheres to the **AI-DLC (AI-Driven Development Life Cycle)** framework.

## Commands & Quality Checks
- Test command: Run appropriate project test runner (e.g. `npm test`, `pytest`, `cargo test`)
- Lint command: Run appropriate project linter (e.g. `npm run lint`, `ruff check .`)
- Build command: Run build verification (e.g. `npm run build`, `cargo check`)

## Workflow Principles
1. **Adaptive Tracks**:
   - **Full Track** for major features or non-trivial architectural changes.
   - **Fast Track** strictly limited to single-file bug fixes and minor changes.
2. **Inception, Refinement & Mandatory Hard Stop**:
   - In Full Track, generate `aidlc-docs/requirements.md`, `aidlc-docs/architecture.md`, and `aidlc-docs/progress-tracker.md`.
   - Refine assumptions and trade-offs with the developer.
   - **MANDATORY HARD STOP**: STOP conversation turn after presenting Inception. Zero production code may be written until explicit approval is granted.
3. **Atomic Construction**:
   - Work on one Unit of Work at a time only after approval.
   - Keep `aidlc-docs/progress-tracker.md` up to date with `[IN_PROGRESS]` and `[COMPLETED]` statuses.
4. **Operations & Security**:
   - Verify security, secret management, and document deployment steps in `aidlc-docs/operations-guide.md`.

