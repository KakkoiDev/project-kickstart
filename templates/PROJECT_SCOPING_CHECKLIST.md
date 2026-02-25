# Project Scoping Checklist

A shared worksheet for the scoping meeting. Both PM/Client and Engineer go through each question together. Check the box, write the answer below. No blank answers. Write "Unknown (owner: X, due: Y)" if unresolved.

> **This is the validation.** The PM/Client should have already filled out the [Project Brief Template](./PROJECT_BRIEF_TEMPLATE.md) before this meeting. This checklist confirms, challenges, and expands on that brief. Overlap is intentional: the brief is one person's preparation, the checklist is both parties' agreement.

**How to use:** Print or copy this document. Walk through it in the scoping meeting or async. Both parties sign off at the end.

| Field | Value |
|-------|-------|
| Project | |
| Date | |
| PM / Client | |
| Lead Engineer | |

---

## Part 1: The Problem

*Owner: PM/Client prepares, Engineer validates*

### 1.1 What problem are we solving?

- [ ] Answered

>

### 1.2 Who has this problem? (specific user segment, not "users")

- [ ] Answered

>

### 1.3 How often does this problem occur? What triggers it?

- [ ] Answered

>

### 1.4 What happens today? (current workaround or lack thereof)

- [ ] Answered

>

### 1.5 What is the cost of doing nothing? (revenue loss, churn, manual hours, compliance risk)

- [ ] Answered

>

### 1.6 Why now? What makes this urgent?

- [ ] Answered

>

---

## Part 2: Success

*Owner: PM/Client defines, Engineer confirms measurability*

### 2.1 How will we know this project succeeded? (metric + target + timeframe)

- [ ] Answered

>

### 2.2 What is the baseline for that metric today?

- [ ] Answered

>

### 2.3 Is there a secondary metric or guardrail? (something that must NOT get worse)

- [ ] Answered

>

---

## Part 3: Scope

*Owner: Both*

### 3.1 User stories (prioritized)

List the top user stories. Mark priority: P0 (must have), P1 (should have), P2 (nice to have).

- [ ] At least 3 stories written

| # | Story | Priority |
|---|-------|----------|
| 1 | As a ___, I want to ___, so that ___. | |
| 2 | As a ___, I want to ___, so that ___. | |
| 3 | As a ___, I want to ___, so that ___. | |
| 4 | | |
| 5 | | |

### 3.2 What is the smallest version that delivers value? (MVP)

- [ ] Answered

>

### 3.3 What is explicitly OUT of scope? (minimum 3 items)

- [ ] At least 3 items listed

| # | Out of scope item | Reason |
|---|-------------------|--------|
| 1 | | |
| 2 | | |
| 3 | | |
| 4 | | |
| 5 | | |

### 3.4 Are there future phases planned? What goes in phase 2?

- [ ] Answered

>

---

## Part 4: Constraints

*Owner: PM/Client discloses, Engineer assesses impact*

### 4.1 Is there a hard deadline? What drives it?

- [ ] Answered
- [ ] Confirmed: real deadline / soft target / no deadline

>

### 4.2 What is the budget? (time, money, or team size)

- [ ] Answered

>

### 4.3 Are there technical constraints? (stack, platform, vendor, legacy system)

- [ ] Answered

>

### 4.4 Are there regulatory or compliance requirements? (GDPR, PCI, WCAG, industry-specific)

- [ ] Answered

>

### 4.5 Are there existing decisions that cannot be changed? (approved designs, signed contracts, committed APIs)

- [ ] Answered

>

---

## Part 5: Dependencies and Risks

*Owner: Engineer identifies, PM/Client confirms or adds*

### 5.1 What external systems or teams does this depend on?

- [ ] Answered

| Dependency | Owner | Status | Risk level |
|------------|-------|--------|------------|
| | | | |
| | | | |

### 5.2 Are there third-party integrations? Do we have docs, sandbox, and SLA?

- [ ] Answered

>

### 5.3 Are other teams affected by this work? Have they been notified?

- [ ] Answered

>

### 5.4 What is the biggest technical unknown?

- [ ] Answered

>

### 5.5 Is an exploration phase (spike/POC) needed before estimating?

- [ ] Yes. Goal: ___, Timebox: ___ days, Deliverable: ___
- [ ] No. Reason: ___

---

## Part 6: People and Process

*Owner: Both*

### 6.1 Who is the single decision-maker? (one name)

- [ ] Answered

>

### 6.2 Who are advisors / stakeholders? (input but not final say)

- [ ] Answered

>

### 6.3 Who is building this? (engineers, designers, QA)

- [ ] Answered

>

### 6.4 How will we communicate? (channel, cadence, format)

- [ ] Answered

| What | How | Frequency |
|------|-----|-----------|
| Status updates | | |
| Blockers / questions | | |
| Demos / reviews | | |
| Scope changes | | |

### 6.5 What is the definition of done? (code review, QA, staging, prod deploy, monitoring)

- [ ] Answered

>

---

## Part 7: Existing Context

*Owner: PM/Client provides, Engineer reviews*

### 7.1 Has this been attempted before? What happened?

- [ ] Answered

>

### 7.2 Are there competitor or reference examples? ("like X but with Y")

- [ ] Answered

>

### 7.3 Are there existing designs, wireframes, or mockups?

- [ ] Answered / Linked

>

### 7.4 Is there existing data we should review? (metrics, user research, support tickets)

- [ ] Answered / Linked

>

---

## Part 8: Non-Functional Requirements

*Owner: Engineer drives, PM/Client validates business need*

### 8.1 Performance: Are there response time or throughput targets?

- [ ] Answered

>

### 8.2 Scale: Expected data volume, concurrent users, growth rate?

- [ ] Answered

>

### 8.3 Availability: Uptime target? What happens if it goes down?

- [ ] Answered

>

### 8.4 Security: Auth model? Data sensitivity? Who should NOT have access?

- [ ] Answered

>

### 8.5 Observability: What do we need to monitor or alert on?

- [ ] Answered

>

---

## Part 9: Open Questions

*Anything unresolved. Every question gets an owner and a due date.*

| # | Question | Owner | Due date |
|---|----------|-------|----------|
| 1 | | | |
| 2 | | | |
| 3 | | | |

---

## Part 10: Next Steps

*Agreed at the end of the meeting.*

- [ ] **Exploration spike needed** / Owner: ___, Due: ___
- [ ] **PRD needs updates** / Owner: ___, Due: ___
- [ ] **TRD to be written** / Owner: ___, Due: ___
- [ ] **Design work needed** / Owner: ___, Due: ___
- [ ] **Open questions to be resolved** / See Part 9

---

## Sign-Off

By checking below, both parties confirm the answers above are accurate and complete as of the date listed. Any changes after sign-off follow the change request process.

- [ ] **PM / Client:** _____________________ Date: ___________
- [ ] **Lead Engineer:** _____________________ Date: ___________
