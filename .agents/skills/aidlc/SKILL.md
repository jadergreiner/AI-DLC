---
name: aidlc
description: Guides and enforces the AI-Driven Development Life Cycle (AI-DLC) framework. Use this skill whenever planning, architecting, implementing, or operating software tasks to ensure adaptive quality gates, atomic units of work, and verifiable outcomes.
---

# AI-DLC (AI-Driven Development Life Cycle) Skill

This skill guides the execution of software engineering workflows using the AI-DLC methodology.

## When to Activate

Activate this skill when:
- Designing a new system, module, or feature.
- Planning non-trivial refactorings.
- Implementing test-driven units of work.
- Conducting security audits, production readiness reviews, or operational runbooks.

---

## Workflow Instructions

### 1. Assessment & Track Selection
Assess the user request and determine whether it qualifies for:
- **Full Track**: New features, architectural refactoring, complex bug hunts, new dependencies. Requires `aidlc-docs/` generation.
- **Fast Track**: Minor bug fixes, single-line/small CSS/text tweaks, isolated configuration updates.

### 2. Inception Execution (Full Track)
1. **Clarify Requirements**: Ensure functional and non-functional requirements are well defined. If ambiguous, interview the user using direct questions.
2. **Architectural Blueprint**: Define components, data models, interfaces, and trade-offs.
3. **Decompose into Units of Work**: Break the task into sequential, verifiable increments.
4. **Document**: Save `requirements.md`, `architecture.md`, and initialize `progress-tracker.md` in `aidlc-docs/`.
5. **Approval Gate**: Stop and present the plan to the user for explicit approval before writing code.

### 3. Construction Execution
1. Pick one Unit of Work from `aidlc-docs/progress-tracker.md` and mark as `[IN_PROGRESS]`.
2. Follow TDD/verification practices: write tests, write code, run automated tests.
3. Conduct self-review for syntax, linter rules, and dead code.
4. Mark the unit as `[COMPLETED]` and iterate until all units are done.

### 4. Operations Execution
1. Review security: check for leaked secrets, unprotected inputs, and vulnerable dependencies.
2. Ensure structured logging, health checks, and error handling.
3. Produce `aidlc-docs/operations-guide.md` with deployment instructions and environment variables.
