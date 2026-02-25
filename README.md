# project-kickstart

Go from "new project" to "first line of code" without losing scope, time, or trust.

3 guides you read once. 4 templates you copy per project. 2 AI skills that automate the heavy lifting.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/OWNER/project-kickstart/main/install.sh | bash
```

This installs:
- **Templates + guides** to `~/.project-kickstart/`
- **Claude Code skills** to `~/.claude/skills/` (if Claude Code is installed)

Re-run to update to the latest version.

## Workflow

```
Brief (human) -> /project-kickstart-scope -> Checklist -> /project-kickstart-trd -> TRD -> PRs
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
| `/project-kickstart-scope` | Brief + meeting (live or notes) | Filled scoping checklist |
| `/project-kickstart-trd` | Brief + checklist | Complete TRD |

The AI writes, the human reviews. Skills enforce every rule from the guides: no vague NFRs, no skipped questions, no blank acceptance criteria.

### Without Claude Code

The templates and guides work standalone. Copy a template, fill it in, use the guide as a reference. The AI skills are a convenience layer, not a requirement.

### Stacked PRs (optional)

[git-dispatch](https://github.com/OWNER/git-dispatch) turns TRD task numbers into stacked PRs automatically. Install separately if you want the full pipeline:

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
| [TRD Guide](guides/TRD_GUIDE.md) | Engineer / AI | Rules for writing TRDs, quality checklist, AI-author obligations |

### Templates (copy per project)

| Document | Audience | Summary |
|----------|----------|---------|
| [Brief Template](templates/PROJECT_BRIEF_TEMPLATE.md) | PM / Client | Problem, success criteria, user stories, constraints, out of scope |
| [Scoping Checklist](templates/PROJECT_SCOPING_CHECKLIST.md) | Both | 30+ questions for the kickoff meeting, dual sign-off |
| [TRD Template](templates/TRD_TEMPLATE.md) | Engineer / AI | Full technical spec: tasks, NFRs, testing, rollback, security |
| [Change Request](templates/CHANGE_REQUEST.md) | Both | Scope changes mid-project, quick and full formats |

## Principles

- **Generic.** No team-specific tools or naming. Works for any stack, any team.
- **Two-sided.** PM and engineer perspectives are separate but cross-referenced.
- **Concrete.** Every section has questions to answer, boxes to check, or rules to follow.
- **Written over verbal.** If it's not written down, it didn't happen.
- **AI-native.** Guides include rules AI agents can follow. Templates are structured for machine consumption.
