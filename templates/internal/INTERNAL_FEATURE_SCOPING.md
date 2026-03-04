# Internal Notes: Feature Scoping - {Feature Name}

> Companion to [FEATURE_SCOPING_CHECKLIST.md](../FEATURE_SCOPING_CHECKLIST.md). Internal use only - not shared with client/PM.

| Field | Value |
|-------|-------|
| Ticket | |
| Analyst | |
| Date | |

---

## Edge Case Deep Dive

### Data Edge Cases

<!-- Unusual data states that could break the feature. -->

| # | Scenario | Expected behavior | Current behavior | Risk |
|---|----------|-------------------|------------------|------|
| 1 | Empty / null input | | | |
| 2 | Maximum size / length | | | |
| 3 | Unicode / special characters | | | |
| 4 | Concurrent modifications | | | |
| 5 | Stale / cached data | | | |

### State Machine Edge Cases

<!-- Invalid state transitions, race conditions, partial completions. -->

| # | From state | To state | Trigger | Valid? | Handling |
|---|-----------|----------|---------|--------|----------|
| 1 | | | | Yes / No | |

### Integration Edge Cases

<!-- Failures at system boundaries. -->

| # | Integration point | Failure mode | Expected behavior | Fallback |
|---|-------------------|-------------|-------------------|----------|
| 1 | | Timeout | | |
| 2 | | 4xx error | | |
| 3 | | 5xx error | | |
| 4 | | Malformed response | | |

### User Behavior Edge Cases

<!-- Things users will do that the spec does not cover. -->

| # | Behavior | Likelihood | Impact | Decision |
|---|----------|-----------|--------|----------|
| 1 | Double-click / double-submit | High | | |
| 2 | Browser back button | Medium | | |
| 3 | Tab away and return | Medium | | |
| 4 | {custom} | | | |

---

## Implementation Hints

### Approach

<!-- High-level implementation strategy. Not a TRD - just enough to unblock the engineer. -->

- **Recommended approach:** {brief description}
- **Alternative considered:** {and why not}

### Files to Read First

<!-- Codebase entry points relevant to this feature. -->

| File / module | Why read this | What to look for |
|--------------|--------------|------------------|
| | | |

### Patterns to Follow

<!-- Existing patterns in the codebase that this feature should match. -->

- {pattern}: {where it exists, why to follow it}

### Patterns to Avoid

<!-- Anti-patterns or deprecated approaches in the codebase. -->

- {pattern}: {why to avoid, what to do instead}

---

## Test Strategy Preview

### Critical Test Scenarios

<!-- The tests that matter most for this feature. -->

| # | Scenario | Type | Priority | Edge case coverage |
|---|----------|------|----------|--------------------|
| 1 | Happy path | Integration | P0 | |
| 2 | {error scenario} | Unit | P0 | |
| 3 | {edge case} | Unit | P1 | |

### Regression Risk

<!-- Existing features that could break when this ships. -->

| Feature | Risk level | How to verify | Automated? |
|---------|-----------|--------------|------------|
| | Low / Med / High | | Yes / No |

### Test Data Needs

<!-- Special data setup required for testing. -->

- **Fixtures needed:** {description}
- **Seed data:** {description}
- **Mock services:** {what needs mocking and why}

---

## Dependency Risk Assessment

### API Stability

<!-- For each external dependency, assess stability. -->

| Dependency | Stability | Last breaking change | Versioned? | Fallback exists? |
|-----------|-----------|---------------------|------------|-----------------|
| | Stable / Unstable / Unknown | | Yes / No | Yes / No |

### Fallback Plans

<!-- What to do if a dependency is unavailable. -->

| Dependency | Fallback | Degraded experience | Effort to implement fallback |
|-----------|----------|--------------------|-----------------------------|
| | | | S / M / L |

### Hidden Dependencies

<!-- Dependencies not obvious from the ticket. -->

- {dependency}: {why it matters, who owns it}

---

## Scope Creep Watchlist

### Expansion Signals

<!-- Things the PM/client might ask for during implementation. -->

| Signal | Likely request | Pre-written response |
|--------|---------------|---------------------|
| "Can we also..." | {expansion} | "That's phase 2. Current ticket is {scope}." |
| "What about {edge case}..." | {gold plating} | "Logged as a follow-up ticket: {description}." |
| "Users might want..." | {feature creep} | "Let's validate with data first. Ship this, measure, then decide." |

### Boundary Lines

<!-- Hard boundaries for this ticket. -->

- **This ticket IS:** {concise scope statement}
- **This ticket is NOT:** {explicit exclusions}
- **If we discover X during implementation:** {escalation path}

---

## Agent Routing

<!-- Context for the next agent in the pipeline. -->

| Next agent | Input from this doc | What to focus on |
|------------|---------------------|------------------|
| task agent | Implementation hints, edge case tables, test strategy | Task decomposition with edge case coverage |
| `/project-kickstart-trd` | All sections - this feeds directly into TRD generation | Architecture, testing, dependencies |
| qa agent | Test strategy preview, regression risk, edge cases | Test plan generation |
