# Units of Work (UoW) Specification

In the AI-DLC framework, all development tasks in the **Construction Phase** must be broken down into discrete, atomic, and testable **Units of Work (UoW)**.

---

## 1. What is a Unit of Work?

A Unit of Work is a self-contained increment of software engineering that can be implemented, tested, and validated independently.

### Criteria for a Valid Unit of Work:
1. **Atomic**: Focuses on a single responsibility (e.g., "Implement User Repository CRUD" or "Add JWT Validation Middleware").
2. **Testable**: Has automated test coverage that proves correctness.
3. **Bounded**: Touches a defined, minimal set of files (avoiding wide, uncontrolled modifications).
4. **Verifiable**: Has unambiguous acceptance criteria.

---

## 2. Unit of Work Life Cycle

Each unit advances through sequential states recorded in `aidlc-docs/progress-tracker.md`:

```
[PENDING] ──► [IN_PROGRESS] ──► [VALIDATING] ──► [COMPLETED]
                     │                 │
                     └──► [BLOCKED] ◄──┘
```

- **PENDING**: Defined during Inception, waiting for execution.
- **IN_PROGRESS**: Currently being actively modified by the agent. Only **one** unit can be in progress at any time.
- **VALIDATING**: Code is written; running test suites, linters, and type checkers.
- **COMPLETED**: All acceptance criteria satisfied, tests pass, and review clean.
- **BLOCKED**: Requires external dependency or user clarification before continuing.

---

## 3. Structure of `aidlc-docs/progress-tracker.md`

```markdown
# AI-DLC Progress Tracker

## Overview
- **Project/Feature**: <Feature Name>
- **Current Track**: Full Track
- **Status**: Construction Phase (2/5 Units Completed)

---

## Units of Work

### UoW-01: <Title>
- **Status**: [COMPLETED]
- **Scope**: Core model and migration
- **Files**: `src/models/user.ts`, `migrations/001_create_users.sql`
- **Tests**: `tests/models/user.test.ts`
- **Acceptance Criteria**:
  - [x] Schema migration runs cleanly
  - [x] Entity validation enforces email uniqueness
  - [x] Unit tests pass (100% assertions)

### UoW-02: <Title>
- **Status**: [IN_PROGRESS]
- **Scope**: Authentication Service
- **Files**: `src/services/auth.ts`
- **Tests**: `tests/services/auth.test.ts`
- **Acceptance Criteria**:
  - [ ] Hash password with argon2/bcrypt
  - [ ] Generate signed JWT token with expiry
  - [ ] Unit tests pass

### UoW-03: <Title>
- **Status**: [PENDING]
...
```

---

## 4. Execution Rules for Coding Agents

1. **Strict Focus**: When working on `UoW-02`, do not prematurely write code for `UoW-03` or refactor unrelated modules.
2. **State Updates**: Always update `progress-tracker.md` when transitioning state.
3. **Rollback on Failure**: If an approach fails tests and causes regressions, revert to the last working checkpoint before trying an alternative.
