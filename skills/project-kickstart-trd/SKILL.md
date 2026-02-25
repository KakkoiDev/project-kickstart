---
name: project-kickstart-trd
description: Generate a TRD (Technical Requirements Document) from a project brief and scoping checklist. AI writes, human reviews. Use when starting Phase 3 (Specify) of the Scoping Playbook.
---

# /project-kickstart-trd - Generate a Technical Requirements Document

Reads a project brief + scoping checklist, then generates a complete TRD following the template and guide rules.

## References

All reference documents live in `~/.project-kickstart/`:

| Document | Purpose |
|----------|---------|
| `templates/TRD_TEMPLATE.md` | Structure to follow (copy and fill) |
| `guides/TRD_GUIDE.md` | MUST/SHOULD rules, quality checklist, AI-author obligations |
| `templates/PROJECT_BRIEF_TEMPLATE.md` | Expected format of the input brief |
| `templates/PROJECT_SCOPING_CHECKLIST.md` | Expected format of the input checklist |

## Usage

```
/project-kickstart-trd                          # Interactive: agent asks for brief + checklist
/project-kickstart-trd <path-to-brief>          # Brief provided, agent asks for checklist
/project-kickstart-trd <brief> <checklist>      # Both inputs provided
```

## Workflow

### Step 1: Gather Inputs

Read the provided brief and checklist. If either is missing, ask for it. Do not proceed without both.

If the user provides a PRD, meeting notes, or any non-standard format instead of the expected templates, extract the relevant information and map it to the expected fields. Flag anything that cannot be mapped as an Open Question.

### Step 2: Read References

Read these files before generating:
- `~/.project-kickstart/templates/TRD_TEMPLATE.md`
- `~/.project-kickstart/guides/TRD_GUIDE.md`

Pay attention to:
- Section 3 (Section-by-Section Rules): all MUST/SHOULD/MAY rules
- Section 4 (Task Decomposition Rules): granularity, ordering, sizing
- Section 5 (Anti-Patterns): avoid every one
- Section 6 (AI-Authored TRDs): ambiguity rules, self-check, pitfalls

### Step 3: Analyze Inputs

Before writing, build a mental model:

1. **Extract from the brief:** problem, goal, success criteria, user stories (prioritized), constraints, out-of-scope items, open questions
2. **Extract from the checklist:** agreed decisions, NFR answers (Part 8), dependency answers, security answers, identified risks
3. **Identify gaps:** anything the brief/checklist does not answer that the TRD requires. Each gap becomes an Open Question.

### Step 4: Generate TRD

Copy the template structure exactly. Fill every section following TRD Guide rules.

Key generation rules:

**Introduction**
- 3-5 sentences. Do NOT copy brief text. Restate in engineering terms.
- State the problem, goal, and delta from current behavior.

**Dependencies**
- Pull from checklist. If none, write "No external dependencies."
- Map each dependency to task IDs it blocks.

**NFRs**
- Transfer from checklist Part 8. Add measurable targets.
- Never write "fast", "scalable", "secure" without numbers.
- If the checklist has no answer for a sub-section, add an Open Question.

**Database Changes**
- Infer from user stories and constraints.
- If modifying existing code, read the actual schema before writing this section.
- If no changes, write "No database changes."

**Rollback Strategy**
- At minimum: feature flag, migration reversibility, deploy revert.
- Address data consistency on rollback.

**Tasks**
- Decompose user stories into tasks by layer: Schema first, then BE, FE, QA, Ops.
- One task = one reviewable PR. If > 400 lines, split.
- Every task MUST have: type tag, effort size, acceptance criteria (Given/When/Then), Tests block.
- Tests block MUST have: at least one test row with type and edge cases, error scenarios, data fixtures (if non-trivial), regression risks (if modifying shared code).
- If codebase access is available, verify "Files to modify" paths exist.

**Security**
- Pull from checklist. Address auth model, data boundaries, input validation, secrets.

**Testing Strategy (Section 9)**
- Summary table only. Detailed tests live in each task's Tests block.

**Out of Scope**
- Pull from brief. Give each item an ID (OS-1, OS-2...).

**Open Questions**
- Collect all gaps, assumptions, and ambiguities found during generation.
- Every question MUST have an owner (default: the human reviewer) and target date.

### Step 5: Self-Check

Run the Quality Checklist (TRD Guide Section 7) against the generated TRD. All 16 criteria must pass. If any fail, fix before presenting.

Additional checks:
- No placeholder text left unfilled (no `{curly braces}` remaining)
- No vague language in NFRs
- No tasks with blank acceptance criteria
- No tests with only happy-path coverage
- Dependency graph has no cycles

### Step 6: Present

Output the complete TRD. After the TRD, add a summary section:

```
---
## Generation Notes

**Inputs used:** [list files read]
**Open questions:** [count] items need human input
**Assumptions made:** [list any, with justification]
**Quality checklist:** [pass count]/16 passed
```

## Important

- Do NOT generate a TRD from vague verbal instructions. Require a written brief.
- Do NOT invent NFR numbers. Propose and mark as needing confirmation.
- Do NOT hallucinate file paths. Read the codebase or mark as "TBD: verify path."
- When in doubt, add an Open Question rather than guessing.
