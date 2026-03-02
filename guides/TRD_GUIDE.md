# TRD Guide: Agent Instruction Manual

## 1. Purpose

A TRD (Technical Requirements Document) translates a brief (PRD) into implementable, task-level engineering specification.

**A TRD is:**
- The single source of truth for *how* a feature is built
- A task breakdown with dependencies, sizing, and acceptance criteria
- A contract between PM, engineering, and QA

**A TRD is NOT:**
- A PRD (no business justification, no user personas)
- A design doc (no architecture alternatives analysis)
- A changelog (no post-ship updates; archive and write a new TRD)

---

## 2. When to Write a TRD

Write a TRD when ANY of these apply:

- Feature touches >= 2 services or domains
- Work requires >= 3 tasks
- Database schema changes are involved
- New API endpoints or contract changes
- Work spans > 1 sprint
- Multiple engineers will contribute
- PM or QA needs a review artifact

Do NOT write a TRD for:
- Bug fixes with obvious root cause and single-file change
- Config changes, env var updates
- Dependency bumps with no API change

---

## 3. Section-by-Section Rules

### Header

- **MUST** include: title, author, date, status, PM, reviewer
- **MUST** set status to `Draft` on creation
- **SHOULD** link a ticket (Jira, Linear, GitHub Issue)

### References

- **MUST** link the PRD. A TRD without a PRD reference is incomplete.
- **SHOULD** link design files, POC branches, API specs
- **MUST NOT** embed content from referenced docs. Link only.

### Introduction

- **MUST** state problem, goal, and delta from current behavior
- **MUST** be 3–5 sentences. If longer, you are writing a PRD.
- **MUST NOT** duplicate the PRD. Reference it.

### Dependencies & Blockers

- **MUST** list every external dependency (API, service, team, infra)
- **MUST** include status (Done / In Progress / Blocked) and owner
- **MUST** map each dependency to the task IDs it blocks
- **SHOULD** be empty if no external dependencies exist. State explicitly: "No external dependencies."

### Non-Functional Requirements

- **MUST** address all five sub-sections: Performance, Scale, Security, Observability, Availability
- **MUST** provide measurable targets (numbers, SLAs, percentiles)
- **MAY** mark a sub-section `N/A` but **MUST** include a reason
- **MUST NOT** use vague language ("fast", "scalable", "secure")

### Database Changes

- **MUST** list every table/column change with type and migration direction
- **MUST** flag irreversible operations (column drops, type narrowing)
- **MUST** note zero-downtime constraints if applicable
- **SHOULD** include data backfill strategy when adding NOT NULL columns

### Rollback Strategy

- **MUST** describe at least one rollback mechanism
- **MUST** address: feature flag, migration reversibility, deploy revert
- **MUST** identify data implications of rollback (orphaned rows, broken references)
- **MUST NOT** write "revert the deploy" without addressing data consistency

### Tasks

- **MUST** use sequential IDs: T-1, T-2, T-3...
- **MUST** tag each task with exactly one type: `Schema` | `BE` | `FE` | `OP` | `QA` | `Docs`
- **MUST** include effort sizing: S (< 2h), M (2h–1d), L (> 1d)
- **MUST** include acceptance criteria (Given/When/Then or checklist)
- **MUST** declare dependencies via `Depends on` field
- **SHOULD** list files to modify
- **MUST NOT** create tasks with circular dependencies
- **MUST NOT** leave acceptance criteria blank
- **MUST** include a Tests block after Acceptance Criteria

### Security Considerations

- **MUST** specify auth model (who accesses, how enforced)
- **MUST** address data boundaries (tenant isolation, PII)
- **SHOULD** address input validation locations
- **MAY** mark `N/A` for internal tools with no user-facing surface. State reason.

### Testing Strategy

- **MUST** define at least unit and integration coverage
- **MUST** specify automated vs manual
- **SHOULD** link manual test plan if manual testing is required
- **MUST NOT** write "will add tests" without specifying what is tested
- **MUST** include a Tests block in every task (Section 7)
- **MUST** list at least one test per task with type and edge cases
- **MUST** document error scenarios (expected errors, codes, messages)
- **SHOULD** define data fixtures when the test requires non-trivial setup
- **SHOULD** flag regression risks when modifying shared code or APIs

### Out of Scope

- **MUST** give each item an ID (OS-1, OS-2...)
- **MUST** include reason for exclusion
- **SHOULD** reference future TRD if item is deferred, not dropped

### Open Questions

- **MUST** assign an owner and target resolution date
- **MUST** remove resolved questions (move to a "Resolved" sub-section or delete)
- **MUST NOT** leave questions without an owner

---

## 4. Task Decomposition Rules

### Granularity

- One task = one reviewable PR
- If a task produces > 400 lines changed, split it
- If a task touches > 3 unrelated files, split it

### Ordering

1. Schema changes first (other tasks depend on them)
2. Backend / API next
3. Frontend consumes API
4. QA / E2E tasks last
5. Ops tasks (infra, config, deploy) where their dependency demands

### Sizing Heuristics

| Size | Time   | Lines Changed | Typical Scope                        |
|------|--------|---------------|--------------------------------------|
| S    | < 2h   | < 100         | Single function, config, simple CRUD |
| M    | 2h–1d  | 100–400       | New endpoint, component, migration   |
| L    | > 1d   | > 400         | New service, complex integration     |

If a task is L, consider splitting into S/M subtasks.

### Dependency Mapping

- Draw the dependency graph mentally. If it has cycles, your decomposition is wrong.
- Every `Depends on` reference MUST point to a valid task ID in the same TRD.
- A task with no dependencies should appear early in the sequence.
- Mark tasks that can run in parallel (no mutual dependencies). This informs sprint planning.

---

## 5. Anti-Patterns

| Anti-Pattern                        | Problem                                                      | Fix                                              |
|-------------------------------------|--------------------------------------------------------------|--------------------------------------------------|
| Mega-task                           | "Implement feature" as one task                              | Split by layer (schema, BE, FE, QA)              |
| Missing NFRs                        | No performance/scale targets                                 | Add measurable requirements to the NFR section    |
| Implicit dependencies               | Tasks fail because unstated prereqs aren't done              | Explicit `Depends on` + Dependencies section      |
| No rollback plan                    | "We'll figure it out" when prod breaks                       | Fill the Rollback Strategy section before review   |
| Vague acceptance criteria           | "It should work" (untestable)                                | Given/When/Then with concrete values              |
| PRD in disguise                     | Introduction is 2 pages of business context                  | 3–5 sentences max; link the PRD                   |
| Orphan out-of-scope                 | Items listed but never tracked                               | Add IDs and reference future TRDs                 |
| Test strategy = "add tests"         | No clarity on what, where, how                               | Specify layer, scope, automation per row          |
| Security = "use auth"               | No specifics on model, boundaries, validation                | Name the middleware, the policy, the checks       |
| Open questions without owner        | Questions rot forever                                        | Assign owner + target date                        |

---

## 6. AI-Authored TRDs

When an AI agent writes the TRD, a human reviews it. This section defines the agent's obligations.

### Required Inputs

Before generating a TRD, the agent **MUST** have access to:

| Input | Required | Notes |
|-------|----------|-------|
| Completed Project Brief | Yes | The problem, success criteria, user stories, constraints |
| Signed Scoping Checklist | Yes | The aligned decisions from the kickoff meeting |
| API specs / design files | If referenced in brief | Do not invent endpoints or schemas |
| Existing codebase context | If modifying existing code | Read actual files before listing "Files to modify" |

If any required input is missing, the agent **MUST** ask for it before generating. Do not fill gaps with assumptions.

### Ambiguity Rules

- **MUST** flag every assumption as an Open Question (Section 11) with owner assigned to the human reviewer
- **MUST NOT** invent NFR targets. If the brief says "fast," add an Open Question: "What is the p95 latency target?"
- **MUST NOT** copy text from the brief into the Introduction. Restate in engineering terms.
- **MUST** ask clarifying questions when: acceptance criteria could be interpreted two ways, a dependency status is unknown, or the rollback mechanism is unclear
- **SHOULD** propose concrete values (e.g., "p95 < 200ms") and mark them as needing confirmation rather than leaving blanks

### Self-Check Before Presenting

The agent **MUST** run the Quality Checklist (Section 7) against its own output before presenting to the reviewer. If any criterion fails, fix it first.

Additionally:

- **MUST** verify every "Files to modify" path exists in the codebase (if codebase access is available)
- **MUST** verify task dependency graph has no cycles
- **MUST** verify every task has a Tests block with at least one concrete test
- **SHOULD** verify effort sizing is consistent (an S task should not list more files than an M task)

### Common AI Pitfalls

| Pitfall | Example | Fix |
|---------|---------|-----|
| Vague NFRs | "System should be performant" | Concrete target: "p95 API response < 200ms" |
| Parroting the brief | Introduction copies PRD sentences | Restate as engineering delta |
| Missing edge cases | Tests only cover happy path | Add error scenarios, boundary values, concurrent access |
| Hallucinated files | "Files to modify: src/services/auth.ts" (doesn't exist) | Read codebase first, verify paths |
| Over-scoping tasks | Single task with 8 acceptance criteria | Split into multiple tasks by concern |
| Generic rollback | "Revert the deploy" | Address data consistency, feature flags, migration reversibility |

---

## 7. Quality Checklist

Machine-evaluable pass/fail criteria. A TRD is ready for review when ALL pass.

| #  | Criterion                                                            | Pass/Fail |
|----|----------------------------------------------------------------------|-----------|
| 1  | PRD link present in References                                       |           |
| 2  | Introduction is <= 5 sentences                                       |           |
| 3  | Every dependency has status, owner, and blocked task IDs             |           |
| 4  | All 5 NFR sub-sections addressed (value or explicit N/A + reason)    |           |
| 5  | Every schema change lists migration direction and reversibility      |           |
| 6  | Rollback strategy has >= 1 concrete mechanism                        |           |
| 7  | Every task has: type tag, effort size, acceptance criteria            |           |
| 8  | No circular task dependencies                                        |           |
| 9  | No task with effort L that could be split                            |           |
| 10 | Security section addresses auth model and data boundaries            |           |
| 11 | Testing strategy specifies at least unit + integration               |           |
| 12 | Every task has a Tests block with at least one test row              |           |
| 13 | Every out-of-scope item has an ID and reason                         |           |
| 14 | Every open question has an owner and target date                     |           |
| 15 | No vague language in NFRs ("fast", "scalable", "secure")            |           |
| 16 | No acceptance criteria left blank                                    |           |

---

## 8. Reference

- Template: [TRD_TEMPLATE.md](../templates/TRD_TEMPLATE.md)
