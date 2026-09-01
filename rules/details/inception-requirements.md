# Inception: Requirements Engineering

In the AI-DLC framework, the **Requirements** stage prevents misunderstandings before any architectural decisions or code are committed.

---

## 1. Objectives

- Capture the exact problem statement, user personas, and target outcomes.
- Identify edge cases, constraints, and non-functional requirements (NFRs).
- Produce a clear `aidlc-docs/requirements.md` document.

---

## 2. Structure of `aidlc-docs/requirements.md`

```markdown
# Requirements Specification

## 1. Problem Statement & Motivation
<Concise description of the business need or technical defect being solved>

## 2. Target Users & Stakeholders
<Who interacts with this solution and their expectations>

## 3. Functional Requirements
- **FR-01**: The system MUST allow users to...
- **FR-02**: The system MUST validate...
- **FR-03**: When an error occurs, the system MUST...

## 4. Non-Functional Requirements (NFRs)
- **Performance**: Response time under 200ms for p95.
- **Reliability**: Graceful handling of network timeouts.
- **Security**: Strict validation of input payloads; zero hardcoded secrets.
- **Maintainability**: Clean modular separation with >=80% test coverage.

## 5. Scope & Out-of-Scope
- **In Scope**:
  - Feature X, Feature Y
- **Out of Scope**:
  - Migration of legacy database Z (deferred to Q4).

## 6. Assumptions & Open Questions
- Assumption: Database supports transactional isolation.
- Open question: Format of external webhooks.
```

---

## 3. Human-in-the-Loop Refinement Cycle

Requirements engineering in AI-DLC is an **interactive dialogue**, not a one-way dump. The agent must actively engage the human developer to refine and validate the specification:

1. **Uncover Hidden Assumptions**:
   - Surface all implicit technical or business assumptions.
   - Present them clearly in `Assumptions & Open Questions`.
2. **Formulate Targeted Validation Questions**:
   - When trade-offs or ambiguities exist, present concise, actionable questions (or structured multiple-choice options) to the developer.
   - Never make critical architectural or product assumptions unilaterally.
3. **Confirm Scope Boundaries**:
   - Explicitly define what is **In Scope** and what is **Out of Scope** to prevent scope creep.
   - Confirm with the user that the scope boundaries meet expectations.

---

## 4. Guidelines & Hard Stop for Agents

- **Interactive Stop**: Upon drafting the requirements, the agent **MUST STOP** its turn and present the key points, questions, and scope boundaries to the user.
- **Zero Premature Code**: Do not create or edit production source files while requirements are in refinement.
- **No Speculative Additions**: Do not add speculative "nice-to-have" features that were not requested or approved.
- **Verifiability**: Ensure every functional requirement has a testable acceptance criterion mapped to future automated tests.
- **Wait for Explicit Approval**: Proceed to architectural finalization and construction only after the developer gives explicit consent.

