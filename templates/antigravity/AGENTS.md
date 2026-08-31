# AI-DLC (AI-Driven Development Life Cycle) - Antigravity Agent Guidelines

This project follows the **AI-DLC** methodology.

## Workflow Rules
- **Full Track**: For new features and architectural changes, follow Inception (Requirements -> Architecture -> Units of Work), Construction (TDD/atomic implementation), and Operations (Security, Observability, Deployment).
- **Fast Track**: For minor fixes and adjustments, propose a light plan, execute with tests, and summarize.
- Maintain project artifacts under `aidlc-docs/` (`requirements.md`, `architecture.md`, `progress-tracker.md`, `operations-guide.md`).
- Implement one Unit of Work at a time and continuously verify via automated tests.
