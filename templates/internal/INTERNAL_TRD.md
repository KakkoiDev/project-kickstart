# Internal Notes: TRD - {Project Title}

> Companion to the TRD generated from [TRD_TEMPLATE.md](../TRD_TEMPLATE.md). Internal use only - not shared with client/PM.

| Field | Value |
|-------|-------|
| TRD version | {date of TRD} |
| Analyst | |
| Date | |

---

## Design Decisions Log

<!-- Every significant decision made during TRD authoring. Future engineers (and agents) need to know WHY, not just WHAT. -->

| ID | Decision | Alternatives considered | Why this choice | Reversibility |
|----|----------|------------------------|-----------------|---------------|
| DD-1 | | | | Easy / Hard / Irreversible |
| DD-2 | | | | |
| DD-3 | | | | |

---

## Task Implementation Notes

<!-- Per-task guidance for the implementing engineer or agent. Supplements the TRD task definitions. -->

### T-1: {task title}

- **Approach:** {how to implement, not just what}
- **Gotchas:** {things that will trip you up}
- **Code pointers:** {specific files, functions, or patterns to reference}
- **Estimated LOC:** {rough line count for the change}
- **Review focus:** {what the reviewer should pay attention to}

### T-2: {task title}

- **Approach:**
- **Gotchas:**
- **Code pointers:**
- **Estimated LOC:**
- **Review focus:**

<!-- Repeat for each task in the TRD. -->

---

## Dependency Contingencies

<!-- What to do if dependencies change. -->

| Dependency (from TRD) | If delayed | If cancelled | If API changes |
|------------------------|-----------|-------------|----------------|
| D-1: {name} | | | |

---

## Risk Mitigation Playbook

<!-- Actionable response plans for each identified risk. -->

| Risk | Trigger condition | Detection method | Response | Escalation |
|------|-------------------|-----------------|----------|------------|
| {risk from TRD} | {what tells us it happened} | {alert, metric, manual check} | {immediate action} | {who to notify, when} |

---

## Rollback Rehearsal

### Step-by-Step Procedure

<!-- Concrete rollback steps, not just "revert the deploy." -->

1. {step}
2. {step}
3. {step}

### Data Recovery

- **Data at risk during rollback:** {what data could be lost or corrupted}
- **Recovery procedure:** {how to recover if rollback causes data issues}
- **Point of no return:** {after which step is rollback no longer clean}

### Communication Template

```
Subject: [Rollback] {project name} - {date}

What happened: {brief description}
Impact: {user-facing impact}
Action taken: {rollback steps executed}
Current status: {stable / investigating / monitoring}
Next steps: {what happens next}
```

---

## Cross-TRD Context

<!-- How this TRD relates to other active or planned TRDs. -->

| Related TRD | Relationship | Shared code / conflicts | Sequencing |
|-------------|-------------|------------------------|------------|
| | Depends on / Blocks / Parallel | | Must go first / After / Any order |

---

## Post-Ship Monitoring

### 24 Hours

- [ ] {metric to check}
- [ ] {error rate threshold}
- [ ] {user-facing check}

### 1 Week

- [ ] {adoption metric}
- [ ] {performance trend}
- [ ] {support ticket volume}

### 30 Days

- [ ] {success criteria from brief}
- [ ] {guardrail metrics}
- [ ] {technical debt assessment}

### Dashboard / Alert Setup

| What to monitor | Tool | Threshold | Alert channel |
|----------------|------|-----------|---------------|
| | | | |

---

## Agent Routing

<!-- Context for the next agent in the pipeline. -->

| Next agent | Input from this doc | What to focus on |
|------------|---------------------|------------------|
| qa agent | Task implementation notes (test focus), risk playbook | Test plan generation, regression coverage |
| review agent | Design decisions log, review focus per task | Code review priorities |
| on-call agent | Rollback rehearsal, monitoring setup, communication template | Incident response preparation |
| learn agent | Design decisions, gotchas, post-ship results | Knowledge capture after project completes |
