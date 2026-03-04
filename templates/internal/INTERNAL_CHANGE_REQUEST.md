# Internal Notes: Change Request - {Short Title}

> Companion to [CHANGE_REQUEST.md](../CHANGE_REQUEST.md). Internal use only - not shared with client/PM.

| Field | Value |
|-------|-------|
| CR version | {date of change request} |
| Analyst | |
| Date | |

---

## Change Origin Analysis

### Real Trigger

<!-- The stated reason and the actual reason are often different. -->

- **Stated reason:** {from the change request}
- **Real trigger:** {what actually caused this - missed requirement, changed priorities, technical discovery, stakeholder pressure}
- **Could this have been caught earlier?** Yes / No / Partially
- **When:** {at which stage - brief, scoping, TRD, implementation}
- **How:** {what process change would have caught it}

### Pattern Detection

<!-- Is this a one-off or part of a trend? -->

- **Similar past CRs:** {list related change requests, if any}
- **Pattern:** {recurring theme - e.g., "PM discovers edge cases late", "API assumptions wrong", "design changes after build starts"}
- **Systemic fix:** {process improvement to prevent recurrence}

---

## Impact Deep Dive

### Code Impact

<!-- Specific code changes required. More detailed than the CR's effort section. -->

| File / module | Change type | LOC estimate | Complexity | Risk |
|--------------|-------------|-------------|------------|------|
| | New / Modify / Delete | | Low / Med / High | Low / Med / High |

### Dependency Cascade

<!-- Changes this CR triggers in other systems or documents. -->

| Affected item | Type | Change needed | Owner |
|--------------|------|--------------|-------|
| | TRD / Task / Test / Config / Docs | | |

### Tech Debt Impact

- **New tech debt introduced:** {description, or "none"}
- **Existing tech debt affected:** {does this make existing debt worse or better}
- **Debt payoff opportunity:** {can we clean something up while making this change}

### Regression Risk

| Feature | Risk level | Test coverage | Additional testing needed |
|---------|-----------|--------------|--------------------------|
| | Low / Med / High | Good / Partial / None | |

---

## Decision Context for Agents

### If Approved

- **TRD tasks to add:** {T-n descriptions}
- **TRD tasks to modify:** {T-n: what changes}
- **Timeline adjustment:** {new estimate}
- **Immediate next step:** {what to do first}

### If Rejected

- **Communicate to:** {who needs to know and how}
- **Alternative approach:** {lighter-weight option if available}
- **Document in:** {where to record the decision and rationale}

### If Deferred

- **Track in:** {backlog, phase 2 doc, follow-up TRD}
- **Revisit trigger:** {what event should cause us to reconsider}
- **Interim workaround:** {if any}

---

## Scope Health Score

<!-- Running assessment of project scope stability. Update with each CR. -->

### Current Project CR Summary

| Metric | Value |
|--------|-------|
| Total CRs filed | |
| CRs approved | |
| CRs rejected | |
| CRs deferred | |
| Cumulative timeline impact | {days added} |
| Original estimate | |
| Current estimate | |

### Project Health

- **Scope stability:** Stable / Drifting / At risk
- **Confidence in current timeline:** High / Medium / Low
- **Recommendation:** Continue / Re-scope / Escalate
