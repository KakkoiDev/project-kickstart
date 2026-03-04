# Internal Notes: Project Scoping - {Project Name}

> Companion to [PROJECT_SCOPING_CHECKLIST.md](../PROJECT_SCOPING_CHECKLIST.md). Internal use only - not shared with client/PM.

| Field | Value |
|-------|-------|
| Checklist version | {date of checklist} |
| Analyst | {who wrote these notes} |
| Date | |

---

## Answer Quality Assessment

<!-- Rate the quality of each checklist answer. Helps prioritize follow-ups. -->

| Part | Question | Completeness | Confidence | Gaps / Notes |
|------|----------|-------------|------------|--------------|
| 1.1 | Problem definition | Full / Partial / Vague | High / Med / Low | |
| 1.2 | User segment | | | |
| 1.3 | Frequency / triggers | | | |
| 1.4 | Current workaround | | | |
| 1.5 | Cost of inaction | | | |
| 1.6 | Urgency | | | |
| 2.1 | Success metric | | | |
| 2.2 | Baseline | | | |
| 2.3 | Guardrail metric | | | |
| 3.1 | User stories | | | |
| 3.2 | MVP | | | |
| 3.3 | Out of scope | | | |
| 3.4 | Future phases | | | |
| 4.1 | Deadline | | | |
| 4.2 | Budget | | | |
| 4.3 | Tech constraints | | | |
| 4.4 | Regulatory | | | |
| 4.5 | Existing decisions | | | |
| 5.1 | Dependencies | | | |
| 5.2 | Integrations | | | |
| 5.3 | Teams affected | | | |
| 5.4 | Technical unknowns | | | |
| 5.5 | Spike needed | | | |
| 6.1 | Decision maker | | | |
| 6.2 | Stakeholders | | | |
| 6.3 | Team | | | |
| 6.4 | Communication | | | |
| 6.5 | Definition of done | | | |
| 8.1 | Performance | | | |
| 8.2 | Scale | | | |
| 8.3 | Availability | | | |
| 8.4 | Security | | | |
| 8.5 | Observability | | | |

---

## Reading Between the Lines

### Interpretation Notes

<!-- What was said vs what was meant. Body language, tone, hesitation during live sessions. -->

- {observation}: {interpretation}

### Stakeholder Dynamics

<!-- Power dynamics, competing interests, unspoken tensions. -->

- {dynamic}: {impact on project}

### Unstated Priorities

<!-- What the PM/client clearly cares about but did not explicitly list as a priority. -->

- {priority}: {evidence}

---

## Technical Feasibility Notes

<!-- Per user story / scope item, assess feasibility from an engineering perspective. -->

| Story / Item | Feasibility | Complexity | Risk | Spike needed? |
|-------------|-------------|------------|------|---------------|
| | Straightforward / Doable / Hard / Unknown | S / M / L / XL | Low / Med / High | Yes / No |

---

## Architecture Implications

### Patterns Required

<!-- Architectural patterns this project needs. -->

- {pattern}: {why, which stories drive it}

### Existing System Impact

<!-- How this project affects the current architecture. -->

| System / Module | Impact | Change type | Risk |
|----------------|--------|-------------|------|
| | | New / Modify / Replace | Low / Med / High |

### Data Flow

<!-- How data moves through the system for the core user stories. -->

```
{source} -> {processing} -> {storage} -> {output}
```

### API Surface Changes

<!-- New or modified API endpoints, events, webhooks. -->

| Endpoint / Event | Change | Consumers | Breaking? |
|-----------------|--------|-----------|-----------|
| | New / Modified | | Yes / No |

---

## Scope Pressure Points

### Items Likely to Expand

<!-- Scope items that sound small but are likely bigger than they appear. -->

| Item | Why it will expand | Realistic size | Mitigation |
|------|-------------------|----------------|------------|
| | | S / M / L / XL | |

### Phase 2 Candidates

<!-- Items currently in scope that should be deferred. -->

| Item | Why defer | Effort saved | Risk of deferring |
|------|----------|-------------|-------------------|
| | | | |

---

## Estimation Inputs

### Confidence Level

- **Overall estimation confidence:** Low / Medium / High
- **Reason:** {what drives the confidence level}

### Analogous Work

<!-- Past projects or features that are similar. Use for calibration. -->

| Reference | Similarity | Actual effort | Lessons |
|-----------|-----------|---------------|---------|
| | | | |

### Complexity Multipliers

<!-- Factors that increase effort beyond the base estimate. -->

| Factor | Multiplier | Applies to |
|--------|-----------|------------|
| Legacy code integration | 1.5x | |
| Cross-team coordination | 1.3x | |
| New technology | 1.5-2x | |
| Regulatory compliance | 1.5x | |
| {custom} | | |

### Preliminary Range

- **Optimistic:** {estimate} (everything goes right, no unknowns)
- **Likely:** {estimate} (normal friction, some unknowns resolved)
- **Pessimistic:** {estimate} (major unknowns hit, dependencies slip)

---

## Open Questions Triage

<!-- Extends Part 9 of the checklist with severity and blocking assessment. -->

| # | Question (from Part 9) | Severity | Blocks | Source |
|---|------------------------|----------|--------|--------|
| 1 | | Critical / Important / Nice-to-know | {what it blocks} | Checklist / Inferred / Meeting |
| 2 | | | | |

---

## Agent Handoff

<!-- Context for the next agent in the pipeline. -->

| Next agent | Input from this doc | What to focus on |
|------------|---------------------|------------------|
| task agent | Feasibility notes, estimation inputs, pressure points | Task decomposition with realistic sizing |
| `/project-kickstart-trd` | Architecture implications, API surface, data flow | Feed into TRD sections 3-6 |
| memo agent | Existing system impact, patterns required | Codebase analysis targets |
