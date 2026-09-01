# AI-DLC (AI-Driven Development Life Cycle) Agent Guidelines

This project follows the **AI-DLC (AI-Driven Development Life Cycle)** framework.

All autonomous AI coding agents operating in this workspace MUST adhere to the following workflow principles:

---

## 1. Operating Mode & Quality Tenets

1. **Adaptive Execution**:
   - For major features, architectural changes, or new modules: execute the **Full Track** (Inception & Refinement ➔ Construction ➔ Operations).
   - For bug fixes, minor tweaks, or simple configuration updates: execute the **Fast Track** (Light Inception ➔ Direct Construction with Tests). Fast Track is strictly limited to single-file isolated changes.
2. **Interactive Refinement & Mandatory Hard Stop**:
   - Never write or edit production/test source code during Phase 1 (Inception).
   - Refine requirements interactively: state assumptions, clarify trade-offs, and define scope boundaries with the human developer.
   - **STOP the execution turn** upon presenting the Inception plan. Wait for explicit human approval before moving to Phase 2 (Construction).
3. **Living Documentation**:
   - Maintain living documentation under `aidlc-docs/` (`requirements.md`, `architecture.md`, `progress-tracker.md`, `operations-guide.md`).
4. **Atomic Increments**:
   - Implement exactly one Unit of Work at a time.
   - Track progress continuously in `aidlc-docs/progress-tracker.md`.
5. **Verification First**:
   - Validate all code changes using tests, linters, and type checkers.
   - Zero tolerance for breaking regressions.

---

## 2. Reference Rules

Detailed workflow specifications are located in the repository:
- Core Lifecycle: [`rules/core/core-workflow.md`](file:///rules/core/core-workflow.md)
- Units of Work Breakdown: [`rules/core/units-of-work.md`](file:///rules/core/units-of-work.md)
- Inception Requirements: [`rules/details/inception-requirements.md`](file:///rules/details/inception-requirements.md)
- Architecture Guidelines: [`rules/details/inception-architecture.md`](file:///rules/details/inception-architecture.md)
- TDD & Testing: [`rules/details/construction-tdd.md`](file:///rules/details/construction-tdd.md)
- Code Review & Quality Gates: [`rules/details/construction-code-review.md`](file:///rules/details/construction-code-review.md)
- Operations & Production Readiness: [`rules/details/operations-readiness.md`](file:///rules/details/operations-readiness.md)
- Security Standards: [`rules/details/operations-security.md`](file:///rules/details/operations-security.md)
