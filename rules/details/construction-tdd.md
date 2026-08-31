# Construction: Test-Driven Development & Continuous Verification

The **Construction Phase** enforces disciplined code creation backed by automated test suites and continuous quality validation.

---

## 1. Principles of Verification

1. **Test-First or Test-Companion**: Tests must not be an afterthought. Write tests either prior to implementation (TDD Red-Green-Refactor) or in lockstep with each unit of work.
2. **Regression Immunity**: If fixing a bug, write a failing test first that reproduces the bug before applying the patch.
3. **Deterministic Testing**: Avoid flaky tests, unseeded randomness, or unmocked real network calls in unit tests.

---

## 2. Testing Pyramid

- **Unit Tests**:
  - Focus: Pure domain functions, algorithmic logic, validation rules.
  - Speed: Milliseconds. Zero external I/O (mock repositories and clients).
- **Integration Tests**:
  - Focus: Database queries, repository interactions, API endpoints, serialization.
  - Speed: Seconds. Use test databases (in-memory or containers).
- **End-to-End (E2E) / Smoke Tests**:
  - Focus: Critical user journeys, health checks, CLI flows.

---

## 3. The Execution Loop for Each Unit of Work

1. **Step 1: Specify**: Review the acceptance criteria for the current unit of work.
2. **Step 2: Test Case**: Write test cases covering normal flow, edge cases, and error conditions.
3. **Step 3: Implement**: Write the simplest code that passes the test suite.
4. **Step 4: Execute**: Run the test runner (e.g., `npm test`, `pytest`, `cargo test`, `go test`).
5. **Step 5: Refactor**: Clean up duplication, improve variable names, and adhere to project idioms without breaking tests.
