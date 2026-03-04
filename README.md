# project-kickstart

Go from "new project" to "first line of code" without losing scope, time, or trust.

3 guides you read once. 5 templates you copy per project. 5 internal templates for AI reasoning. 2 AI skills + 2 AI agents that automate the heavy lifting.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/KakkoiDev/project-kickstart/main/install.sh | bash
```

This installs:
- **Templates + guides** to `~/.project-kickstart/`
- **Internal templates** to `~/.project-kickstart/templates/internal/`
- **Claude Code skills** to `~/.claude/skills/` (if Claude Code is installed)
- **Claude Code agents** to `~/.claude/agents/` (if Claude Code is installed)

Re-run to update to the latest version.

## Workflow

```
Brief (human) -> /project-kickstart-scope -> Checklist + Internal Notes -> /project-kickstart-trd -> TRD + Internal Notes -> PRs
Feature:         /project-kickstart-scope --feature -> Feature Checklist + Internal Notes -> /project-kickstart-trd -> TRD + Internal Notes -> PRs
```

| Phase | Who | What | Output |
|-------|-----|------|--------|
| 1. Prepare | PM/Client | Fill the [Brief Template](templates/PROJECT_BRIEF_TEMPLATE.md) | Project brief |
| 2. Align | Both (or AI) | Walk through [Scoping Checklist](templates/PROJECT_SCOPING_CHECKLIST.md) | Signed checklist |
| 3. Specify | Engineer (or AI) | Write TRD using [TRD Template](templates/TRD_TEMPLATE.md) | Approved TRD |
| 4. Build | Engineer | One branch per task, one PR per task | Shipped code |
| 5. Change | Either side | File a [Change Request](templates/CHANGE_REQUEST.md) | Updated TRD |

### AI-Assisted (Claude Code)

| Skill | Input | Output |
|-------|-------|--------|
| `/project-kickstart-scope` | Brief + meeting (live or notes) | Filled scoping checklist + internal notes |
| `/project-kickstart-scope --feature` | Ticket + meeting (live or notes) | Filled feature checklist + internal notes |
| `/project-kickstart-trd` | Brief + checklist | Complete TRD + internal notes |

The AI writes, the human reviews. Skills enforce every rule from the guides: no vague NFRs, no skipped questions, no blank acceptance criteria.

### Dual Output

Every skill produces two documents:

- **Human version** (shared with client/PM/team): clean, scannable, decisions only
- **Internal version** (kept internally): reasoning, risks, assumptions, implementation hints for AI agents

Human versions live at `templates/`. Internal versions live at `templates/internal/`. The internal documents feed downstream agents (task, qa, review) with context that does not belong in client-facing deliverables.

### Without Claude Code

The templates and guides work standalone. Copy a template, fill it in, use the guide as a reference. The AI skills are a convenience layer, not a requirement.

### Stacked PRs (optional)

[git-dispatch](https://github.com/KakkoiDev/git-dispatch) turns TRD task numbers into stacked PRs automatically. Install separately if you want the full pipeline:

```
TRD -> git dispatch split -> one branch per task -> git dispatch pr -> stacked PRs
```

Without git-dispatch: create one branch per TRD task manually. The task numbering (T-1, T-2, ...) gives you the branch names.

## Scaling

- **Solo / 1-3 people:** Brief Template + TRD Template only. Skip the guides and checklist.
- **Small team (4-8):** Full workflow, skip the formal sign-off. Checklist can be async.
- **Agency / Enterprise (8+):** Use everything. The formality pays for itself.

## Documents

### Guides (read once)

| Document | Audience | Summary |
|----------|----------|---------|
| [Briefing Guide](guides/PROJECT_BRIEFING_GUIDE.md) | PM / Client | How to prepare for the scoping meeting |
| [Scoping Guide](guides/PROJECT_SCOPING_GUIDE.md) | Engineer | How to run scoping conversations and prevent scope creep |
| [Feature Scoping Guide](guides/FEATURE_SCOPING_GUIDE.md) | Engineer / AI | When and how to use the lightweight feature checklist |
| [TRD Guide](guides/TRD_GUIDE.md) | Engineer / AI | Rules for writing TRDs, quality checklist, AI-author obligations |

### Templates (copy per project)

| Document | Audience | Summary |
|----------|----------|---------|
| [Brief Template](templates/PROJECT_BRIEF_TEMPLATE.md) | PM / Client | Problem, success criteria, user stories, constraints, out of scope |
| [Scoping Checklist](templates/PROJECT_SCOPING_CHECKLIST.md) | Both | 30+ questions for the kickoff meeting, dual sign-off |
| [Feature Scoping Checklist](templates/FEATURE_SCOPING_CHECKLIST.md) | Engineer / AI | Lightweight scoping for single features/tickets. 7 sections, edge-case focused |
| [TRD Template](templates/TRD_TEMPLATE.md) | Engineer / AI | Full technical spec: tasks, NFRs, testing, rollback, security |
| [Change Request](templates/CHANGE_REQUEST.md) | Both | Scope changes mid-project, quick and full formats |

### Internal Templates (AI reasoning layer)

Internal companions to each human template. Not shared with clients. Feed downstream AI agents with reasoning, risks, and implementation context.

| Document | Companion to | Key additions |
|----------|-------------|---------------|
| [Internal Brief](templates/internal/INTERNAL_PROJECT_BRIEF.md) | Brief Template | Problem analysis, risk register, assumptions log, agent routing |
| [Internal Scoping](templates/internal/INTERNAL_PROJECT_SCOPING.md) | Scoping Checklist | Answer quality, feasibility notes, estimation inputs, architecture implications |
| [Internal Feature Scoping](templates/internal/INTERNAL_FEATURE_SCOPING.md) | Feature Checklist | Edge case deep dive, implementation hints, test strategy, scope creep watchlist |
| [Internal TRD](templates/internal/INTERNAL_TRD.md) | TRD Template | Design decisions, task notes, rollback rehearsal, post-ship monitoring |
| [Internal Change Request](templates/internal/INTERNAL_CHANGE_REQUEST.md) | Change Request | Change origin analysis, impact deep dive, scope health score |

### Agents

| Agent | Role |
|-------|------|
| [project-kickstart-scope](agents/project-kickstart-scope.md) | Scoping facilitator producing dual output. Detects feature vs project scope. |
| [project-kickstart-trd](agents/project-kickstart-trd.md) | TRD generator producing dual output. Consumes internal scoping notes. |

## Principles

- **Generic.** No team-specific tools or naming. Works for any stack, any team.
- **Two-sided.** PM and engineer perspectives are separate but cross-referenced.
- **Concrete.** Every section has questions to answer, boxes to check, or rules to follow.
- **Written over verbal.** If it's not written down, it didn't happen.
- **AI-native.** Guides include rules AI agents can follow. Templates are structured for machine consumption.
