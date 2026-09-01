# GitHub Copilot Instructions (AI-DLC Workflow)

Follow the AI-DLC (AI-Driven Development Life Cycle) engineering methodology in this workspace:

1. **Plan & Refine First**: Understand functional and non-functional requirements before writing code. Refine assumptions and trade-offs in `aidlc-docs/`.
2. **Mandatory Approval Gate**: For non-trivial or multi-file changes, present the plan and wait for developer confirmation before generating production code.
3. **Atomic Steps**: Implement changes in discrete Units of Work. Focus strictly on the files relevant to the active unit.
4. **Test-Driven & Verified**:
   - Write corresponding automated tests for new functionality.
   - Run tests and linters to verify correctness before presenting the solution.
5. **Security & Quality**:
   - Never hardcode secrets, passwords, or API keys.
   - Respect project conventions and clean code patterns.

