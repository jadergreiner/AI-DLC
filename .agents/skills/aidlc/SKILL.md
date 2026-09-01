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
- **Full Track**: New features, architectural refactoring, complex bug hunts, multi-file changes. Requires `aidlc-docs/` generation and mandatory human refinement.
- **Fast Track**: Strictly limited to isolated single-file bug fixes, small CSS/text tweaks, or single config updates. Propose the change briefly; verify build and tests.

### 2. Inception & Refinement Execution (Full Track)
1. **Clarify Requirements**: Capture functional and non-functional requirements. If ambiguous, interview the user using direct questions or multiple-choice prompts.
2. **Architectural Blueprint**: Define components, data models, interfaces, and trade-offs.
3. **Decompose into Units of Work**: Break the task into sequential, atomic, verifiable increments with status `[PROPOSED]`.
4. **Document**: Save `requirements.md`, `architecture.md`, and initialize `progress-tracker.md` in `aidlc-docs/`.
5. **Interactive Refinement**: Present assumptions, architectural trade-offs, and boundary definitions to the developer.
6. **MANDATORY HARD STOP (Strict Approval Gate)**:
   - **PROHIBITION**: You are strictly forbidden from creating, modifying, or deleting any production/test implementation code during Phase 1.
   - **STOP IMMEDIATELY**: End your conversation turn right after presenting the Inception plan.
   - **WAIT**: Do NOT proceed to Construction until the user explicitly gives approval (e.g., "Approved", "Go ahead", "Pode executar").

### 3. Construction Execution
*Pre-condition: Construction can ONLY begin after explicit user approval is granted.*
1. Update `aidlc-docs/progress-tracker.md` to register approval and mark UoW-01 as `[IN_PROGRESS]`.
2. Work on exactly **one Unit of Work at a time**.
3. Follow TDD/verification practices: write tests, write minimal code, run automated tests.
4. Conduct self-review for syntax, linter rules, and dead code.
5. Mark the unit as `[COMPLETED]` and iterate sequentially.

### 4. Operations Execution
1. Review security: check for leaked secrets, unprotected inputs, and vulnerable dependencies.
2. Ensure structured logging, health checks, and error handling.
3. Produce `aidlc-docs/operations-guide.md` with deployment instructions and environment variables.

