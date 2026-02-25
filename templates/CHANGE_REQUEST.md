# Change Request: {Short title}

> This modifies the scope of an approved [TRD](./TRD_TEMPLATE.md). Both PMs and engineers can file a change request.

## Quick Format (for small changes)

<!-- Use this for minor adjustments: small bugs that shift estimates, tweaked acceptance criteria, minor feature additions. If the change affects timeline by more than a day or touches the architecture, use the full format below. -->

- **What changed:**
- **Why:**
- **Impact:** S / M / L
- **Decision:** Approved / Rejected / Deferred
- **TRD updated:** Yes / No

---

## Full Format (for significant scope changes)

| Field | Value |
|-------|-------|
| Requested by | |
| Date | |
| Project | |
| Related TRD | |
| Status | Submitted / Under Review / Approved / Rejected / Deferred |

## Origin

<!-- Who is requesting this and why. Check one. -->

- [ ] **PM / Client:** new requirement, priority shift, user feedback
- [ ] **Engineer:** bug found, technical blocker, wrong assumption, system constraint discovered

## What changed

<!-- Describe the change clearly. What is different from what was agreed in the TRD? -->

>

## Why

<!-- What triggered this. Link evidence: bug report, user feedback, failed spike, performance test results. -->

>

## Impact Assessment

<!-- Filled by the engineer, regardless of who requested the change. -->

### Effort

| Item | Estimate |
|------|----------|
| Additional tasks | |
| Effort (S/M/L) | |
| Files affected | |

### Timeline

| Scenario | New delivery date | What gets cut |
|----------|-------------------|---------------|
| Add it, push deadline | | Nothing |
| Add it, drop something | Original date | |
| Defer to next phase | Original date | Nothing (goes to followup) |

### Risk

<!-- What could go wrong. New dependencies, regressions, data migration issues. -->

>

## Decision

| Field | Value |
|-------|-------|
| Decision | Approved / Rejected / Deferred |
| Decided by | |
| Date | |
| Trade-off chosen | |

## TRD Updates

<!-- If approved: list what changes in the TRD. New tasks, modified tasks, updated timeline. -->

- [ ] TRD updated
- [ ] New tasks added: T-{n}
- [ ] Timeline adjusted
- [ ] Stakeholders notified
- [ ] Scoping Checklist sign-off still valid (if not, schedule re-alignment)

---

## Followup Phase

<!-- Items that are deferred, not dropped. These feed into the next project phase or a new TRD. Track them here so nothing gets lost. -->

| # | Item | Reason for deferral | Owner | Target phase |
|---|------|---------------------|-------|-------------|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |
