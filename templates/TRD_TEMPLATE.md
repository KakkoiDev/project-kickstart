# {Project Title}: Technical Requirements Document

> See [TRD Guide](../guides/TRD_GUIDE.md) for section-by-section rules, task decomposition heuristics, and the quality checklist.

| Field      | Value                          |
|------------|--------------------------------|
| Author     | {author}                       |
| Date       | {YYYY-MM-DD}                   |
| Status     | Draft / In Review / Approved   |
| PM         | {pm_name}                      |
| Reviewer   | {reviewer_name}                |
| Ticket     | {link}                         |

---

## 1. References

<!-- Link every upstream document. A TRD without a brief (PRD) link is suspect. -->

| Document       | Link   |
|----------------|--------|
| PRD            | {link} |
| POC / Spike    | {link} |
| Design (Figma) | {link} |
| API Spec       | {link} |

---

## 2. Introduction

<!-- 3–5 sentences. State the problem, the goal, and how the solution differs from current behavior. Do NOT restate the PRD; reference it. -->

**Problem:** {What is broken or missing}

**Goal:** {What the user/system will be able to do after this work}

**Key difference from current behavior:** {Delta: what changes}

---

## 3. Dependencies & Blockers

<!-- List anything that must exist before work begins or that gates a specific task. Mark status honestly. -->

| ID  | Dependency                | Owner   | Status                          | Blocks Tasks |
|-----|---------------------------|---------|---------------------------------|--------------|
| D-1 | {dependency_description}  | {owner} | Done \| In Progress \| Blocked  | T-{n}        |

---

## 4. Non-Functional Requirements

<!-- Required section. Transfer answers from Scoping Checklist Part 8 and refine with measurable targets. Every sub-section must have at least one concrete, measurable requirement or an explicit "N/A: {reason}". -->

### 4.1 Performance

<!-- Response time targets, throughput, latency budgets. Use p50/p95/p99 where applicable. -->

- {metric}: {target} (e.g., p95 API response < 200ms)

### 4.2 Scale

<!-- Expected data volume, concurrent users, growth projections relevant to design decisions. -->

- {metric}: {target}

### 4.3 Security

<!-- Auth model, data classification, encryption requirements. Detail in Section 8 if complex. -->

- {requirement}

### 4.4 Observability

<!-- Logging, metrics, alerts, dashboards needed. -->

- {requirement}

### 4.5 Availability / SLA

<!-- Uptime target, degradation behavior, circuit breakers. -->

- {requirement}

---

## 5. Database Changes

<!-- If no schema changes, write "No database changes." and delete the table. -->

### 5.1 Schema Diff

| Table       | Column      | Type     | Change               | Notes            |
|-------------|-------------|----------|----------------------|------------------|
| {table}     | {column}    | {type}   | ADD \| ALTER \| DROP | {migration note} |

### 5.2 Migration Notes

<!-- Irreversible operations (column drop, type narrowing), data backfill scripts, zero-downtime constraints. -->

- {note}

---

## 6. Rollback Strategy

<!-- Required. How to revert if this ships and breaks. At minimum: feature flag, migration rollback, or deploy revert. -->

| Mechanism              | Details                              |
|------------------------|--------------------------------------|
| Feature flag           | {flag_name} (disable to revert UI)   |
| Migration rollback     | {reversible \| manual script needed} |
| Deploy revert          | {any data concerns on revert}        |

---

## 7. Tasks

<!-- Each task is an H3. Use the exact format below. Acceptance criteria are required. Use Given/When/Then or a checklist. -->

<!-- Status key: ⬜ Not started | 🔧 In progress | ✅ Done | ❌ Blocked -->

### T-1: {Task title} `{TYPE}` ⬜

<!-- TYPE: one of Schema | BE | FE | OP | QA | Docs -->

| Field              | Value                |
|--------------------|----------------------|
| Depends on         | -                    |
| Effort             | S \| M \| L          |
| Files to modify    | {path/to/file}       |
| Ticket             | {link}               |

**Acceptance Criteria:**

- [ ] Given {precondition}, when {action}, then {result}
- [ ] {criterion}

**Tests:**

| What | Type | Edge Cases |
|------|------|------------|
| {behavior to verify} | Unit / Integration / E2E | {edge cases for this test} |

- **Error scenarios:** {expected errors, codes, messages}
- **Data fixtures:** {required seed data, mocks, factory setup}
- **Regression risks:** {existing features that could break}

---

### T-2: {Task title} `{TYPE}` ⬜

| Field              | Value                |
|--------------------|----------------------|
| Depends on         | T-1                  |
| Effort             | S \| M \| L          |
| Files to modify    | {path/to/file}       |
| Ticket             | {link}               |

**Acceptance Criteria:**

- [ ] Given {precondition}, when {action}, then {result}
- [ ] {criterion}

**Tests:**

| What | Type | Edge Cases |
|------|------|------------|
| {behavior to verify} | Unit / Integration / E2E | {edge cases for this test} |

- **Error scenarios:** {expected errors, codes, messages}
- **Data fixtures:** {required seed data, mocks, factory setup}
- **Regression risks:** {existing features that could break}

---

## 8. Security Considerations

<!-- Required. If truly not applicable, write "No security surface: {reason}." -->

- **Auth model:** {Who can access this feature and how is it enforced}
- **Data boundaries:** {Tenant isolation, row-level security, PII handling}
- **Input validation:** {What is validated and where (API layer, DB constraints, frontend)}
- **Secrets:** {Any new secrets, tokens, keys introduced and where they are stored}

---

## 9. Testing Strategy

<!-- Summary of test coverage across layers. Detailed test cases live in each task's Tests block above. -->

| Layer        | Scope                              | Automated |
|--------------|------------------------------------|-----------|
| Unit         | {what is covered}                  | Yes / No  |
| Integration  | {what is covered}                  | Yes / No  |
| E2E          | {what is covered}                  | Yes / No  |
| Manual       | {link to manual test plan or N/A}  | -         |

> **Note:** Per-test details (edge cases, error scenarios, data fixtures, regression risks) are defined in each task's **Tests** block in Section 7.

---

## 10. Out of Scope

<!-- Prioritized list. Each item gets an ID so it can be referenced in future TRDs. -->

| ID    | Item                   | Reason / Future TRD     |
|-------|------------------------|-------------------------|
| OS-1  | {item}                 | {reason}                |

---

## 11. Open Questions

<!-- Unresolved items. Assign an owner and target resolution date. Remove when resolved. -->

| ID   | Question                   | Owner   | Target Date | Resolution |
|------|----------------------------|---------|-------------|------------|
| Q-1  | {question}                 | {owner} | {date}      | -          |
