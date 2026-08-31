# Construction: Code Standards & Self-Review

Before an AI agent marks any Unit of Work as `COMPLETED`, it must conduct a rigorous **Self-Review** against project coding conventions and static quality gates.

---

## 1. Static Quality Gates

1. **Syntax & Compilation**:
   - The codebase must compile or transpile with zero errors and zero warnings (e.g., `tsc --noEmit`, `cargo check`).
2. **Linting & Formatting**:
   - Run project linters (e.g., ESLint, Ruff, Flake8, Clippy, golangci-lint).
   - Resolve all violations. Do not disable linter rules with inline comments unless strictly justified.
3. **Dead Code & Debug Artifacts**:
   - Remove temporary `console.log`, `print()`, commented-out code blocks, and unused imports.

---

## 2. Code Quality Checklist

- [ ] **Single Responsibility**: Are functions and classes focused on one task?
- [ ] **Error Handling**: Are errors caught and handled gracefully rather than silently swallowed?
- [ ] **Type Safety**: Are types explicitly defined without unnecessary `any` or untyped casts?
- [ ] **Documentation**: Are complex algorithms or non-obvious design decisions explained with concise docstrings?
- [ ] **No Regression**: Did any existing tests break?

---

## 3. Preserving Project Conventions

- Inspect existing code patterns before introducing new libraries or conflicting architectural styles.
- Adhere to the casing conventions (e.g., camelCase vs snake_case) and directory structures already present in the workspace.
