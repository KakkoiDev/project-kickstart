# Internal Notes: Project Brief - {Project Name}

> Companion to [PROJECT_BRIEF_TEMPLATE.md](../PROJECT_BRIEF_TEMPLATE.md). Internal use only - not shared with client/PM.

| Field | Value |
|-------|-------|
| Brief version | {date of brief} |
| Analyst | {who wrote these notes} |
| Date | |

---

## Problem Analysis

### Root Cause Assessment

<!-- What is the actual root cause behind the stated problem? The brief states the symptom - dig deeper. -->

- **Stated problem:** {from brief}
- **Root cause hypothesis:** {what is actually causing this}
- **Evidence:** {data, conversations, patterns that support the hypothesis}
- **Problem maturity:** New / Known-but-unaddressed / Previously-attempted / Recurring

### Hidden Stakeholders

<!-- People affected by or influencing this project who are not listed in the brief. -->

| Stakeholder | Interest | Influence | Risk if ignored |
|-------------|----------|-----------|-----------------|
| | | | |

### Problem Framing Gaps

<!-- What the brief does not say about the problem. -->

- {gap}

---

## Success Criteria Reality Check

### Measurement Gaps

<!-- For each metric in the brief, assess: can we actually measure this? -->

| Metric (from brief) | Measurable today? | Instrumentation needed | Effort to instrument |
|---------------------|-------------------|------------------------|----------------------|
| | Yes / No / Partial | | S / M / L |

### Leading Indicators

<!-- Metrics we can check before the target timeframe to know if we're on track. -->

| Indicator | Check at | Expected value | Action if off-track |
|-----------|----------|----------------|---------------------|
| | | | |

### Success Criteria Risks

- **Metric gaming risk:** {ways the metric could improve without solving the real problem}
- **External factors:** {things outside our control that affect the metric}
- **Baseline reliability:** {how confident are we in the baseline number}

---

## User Story Decomposition Hints

<!-- For each P0/P1 story in the brief, add implementation context. -->

### Story {#}: {summary}

- **Complexity:** Low / Medium / High / Unknown
- **Dependencies:** {other stories, external systems, data}
- **Implied behaviors not stated:** {what the story assumes but does not say}
- **Likely sub-stories:** {how this breaks down for implementation}
- **Ambiguity notes:** {where the story is open to interpretation}

---

## Constraint Analysis

### Hard vs Soft Constraints

| Constraint (from brief) | Hard / Soft | What happens if violated | Negotiable with |
|-------------------------|-------------|--------------------------|-----------------|
| | | | |

### Constraint Conflicts

<!-- Constraints that contradict each other or create tension. -->

- {constraint A} vs {constraint B}: {nature of conflict, resolution approach}

### Hidden Constraints

<!-- Constraints not listed in the brief that will affect implementation. -->

- {constraint}: {source, impact}

---

## Risk Register

| ID | Risk | Likelihood | Impact | Mitigation | Owner |
|----|------|------------|--------|------------|-------|
| R-1 | | Low / Med / High | Low / Med / High | | |
| R-2 | | | | | |
| R-3 | | | | | |

---

## Assumptions Log

| ID | Assumption | Source | Validated? | Impact if wrong |
|----|-----------|--------|------------|-----------------|
| A-1 | | Brief / Meeting / Inferred | Yes / No | |
| A-2 | | | | |
| A-3 | | | | |

---

## Agent Routing

<!-- Context for the next agent in the pipeline. -->

### Recommended Next Steps

| Next agent | Input from this doc | What to focus on |
|------------|---------------------|------------------|
| `/project-kickstart-scope` | Risk register, assumptions, hidden stakeholders | Validate assumptions during scoping session |
| memo agent | Problem analysis, constraint conflicts | Feed into MEMO.md for codebase analysis |

### Codebase Entry Points

<!-- If the project touches an existing codebase, list where to start reading. -->

| Area | Files / modules | Why relevant |
|------|----------------|--------------|
| | | |
