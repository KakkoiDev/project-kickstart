# Feature Scoping Guide

Lightweight alternative to the full [Project Scoping Guide](./PROJECT_SCOPING_GUIDE.md). Use this when scoping a single feature or ticket, not a full project.

## When to Use This vs the Full Checklist

| Use `FEATURE_SCOPING_CHECKLIST.md` | Use `PROJECT_SCOPING_CHECKLIST.md` |
|-------------------------------------|-------------------------------------|
| Single ticket / user story | Multi-feature project |
| Clear PRD already exists | Starting from scratch |
| Team is small (1-3 people) | Cross-team coordination |
| Goal is to ship fast | Goal is to align stakeholders |
| Edge cases are the main risk | Scope definition is the main risk |

When in doubt, start with the feature checklist. Escalate to the full checklist if you discover the scope is bigger than expected.

## What Changed

The full checklist (10 parts, ~30 questions) was designed for project-level scoping. In practice, many of those questions are about things outside the current ticket:

- **Removed: Success metrics** (Part 2 of full checklist). Important for projects, but not needed to ship a feature. If the project-level PRD doesn't have metrics, that's a project-level problem, not a feature-level blocker.
- **Removed: Non-functional requirements** (Part 8). Most features inherit the platform's SLA, security model, and observability. Only add NFRs when the feature has unusual requirements (e.g., bulk operations with performance concerns).
- **Removed: Existing context** (Part 7). Competitor analysis, prior attempts, and design inventories are project-level research. By the time you're scoping a feature, those should already be done.
- **Removed: Future phases** (Part 3.4). Understanding the roadmap is useful context, but listing future phases in a feature checklist leads to over-engineering. Know where you are, but don't plan ahead.
- **Removed: Sign-off ceremony** (Part 10). Feature-level scoping is informal. Check the boxes, resolve the gaps, start building.
- **Promoted: Edge cases** (was buried in Part 5.4, now its own section). This is where most feature-level risk lives. A feature with well-understood edge cases is easy to build. A feature with hidden edge cases is a minefield.

## What Stayed

- **Problem** (why are we doing this)
- **Scope** (user story, MVP, out of scope)
- **Constraints** (deadline, team, technical decisions)
- **Edge cases** (the most valuable section)
- **Dependencies** (who else is affected)
- **People** (who decides, who builds, how we communicate)
- **Open questions** (consolidated gap list)

## Integration with Skills and Agents

### Skill: `/project-kickstart-scope`

The existing skill (`skills/project-kickstart-scope/SKILL.md`) walks through the full `PROJECT_SCOPING_CHECKLIST.md`. To support the feature checklist:

**Option A (recommended): Add a flag to the existing skill.**

```
/project-kickstart-scope --feature              # Uses FEATURE_SCOPING_CHECKLIST.md
/project-kickstart-scope                        # Uses PROJECT_SCOPING_CHECKLIST.md (default)
```

The skill detects which template to use based on:
1. Explicit `--feature` flag, or
2. Input analysis: if the input is a single ticket/user story (not a multi-feature brief), default to the feature checklist.

Changes needed in `skills/project-kickstart-scope/SKILL.md`:
- Add reference to `templates/FEATURE_SCOPING_CHECKLIST.md`
- Add detection logic for feature vs project scope
- Adjust the walkthrough: 7 sections instead of 10, no sign-off

**Option B: Separate skill.**

Create `skills/project-kickstart-feature-scope/SKILL.md` as a standalone skill. Simpler to maintain but adds another command to remember.

### Agents

For agents that use the scoping checklist (e.g., `memo`, `task`), the choice between templates should follow:

1. **If the agent is pre-filling from a single ticket or user story** -> use `FEATURE_SCOPING_CHECKLIST.md`
2. **If the agent is pre-filling from a project brief with multiple features** -> use `PROJECT_SCOPING_CHECKLIST.md`
3. **If unclear** -> start with feature checklist, escalate if needed

The agent HTML comment at the top of `FEATURE_SCOPING_CHECKLIST.md` contains instructions for AI agents.

### Template Selection in `install.sh`

The install script already copies templates to `~/.project-kickstart/templates/`. The new template will be included automatically since it's in the `templates/` directory.

### README Update

Add the feature checklist to the Templates table in `README.md`:

```markdown
| [Feature Scoping Checklist](templates/FEATURE_SCOPING_CHECKLIST.md) | Engineer / AI | Lightweight scoping for single features/tickets. 7 sections, edge-case focused. |
```

And add to the Workflow section:

```
Brief (human) -> /project-kickstart-scope --feature -> Feature Checklist -> /project-kickstart-trd -> TRD -> PRs
```

## Design Principles

These apply to the feature checklist and should guide any future changes:

1. **One ticket, one checklist.** Don't scope multiple features in one document.
2. **Edge cases over process.** The checklist exists to catch things that break, not to satisfy a process.
3. **Short answers.** If an answer needs more than 2-3 lines, it belongs in the PRD, not the checklist.
4. **Don't plan other phases.** Know where you are in the roadmap, but don't document future work.
5. **Don't overwhelm colleagues.** PMs and reviewers read this. Keep it accessible.
6. **Remove when answered.** Open questions should be deleted once resolved, not kept as historical record. The checklist is a living document, not an archive.
