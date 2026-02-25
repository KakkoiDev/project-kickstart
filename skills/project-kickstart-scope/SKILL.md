---
name: project-kickstart-scope
description: Guided scoping session that walks through the Project Scoping Checklist question by question. Works live during meetings or post-meeting from notes/transcripts. Produces a filled checklist ready for sign-off.
---

# /project-kickstart-scope - Guided Scoping Session

Walks through the Project Scoping Checklist one question at a time. Ensures nothing is skipped, pre-fills from the brief when available, and flags gaps.

## References

All reference documents live in `~/.project-kickstart/`:

| Document | Purpose |
|----------|---------|
| `templates/PROJECT_SCOPING_CHECKLIST.md` | Template to fill (10 parts, ~30 questions) |
| `templates/PROJECT_BRIEF_TEMPLATE.md` | Expected input format |
| `guides/PROJECT_SCOPING_GUIDE.md` | Engineer's context for each question area |
| `guides/PROJECT_BRIEFING_GUIDE.md` | PM's context (helps understand their perspective) |

## Usage

```
/project-kickstart-scope                        # Interactive: agent asks for brief, then walks through questions
/project-kickstart-scope <path-to-brief>        # Brief provided, pre-fills overlapping answers
/project-kickstart-scope <path-to-notes>        # Post-meeting: extract answers from meeting notes/transcript
/project-kickstart-scope <brief> <notes>        # Both: cross-reference brief with meeting notes
```

## Modes

### Live Mode (default)

For use during or before a scoping meeting. The agent presents questions one part at a time, waits for answers, and fills the checklist progressively.

### Extract Mode

For use after a meeting. The agent reads meeting notes, transcript, or any unstructured input and maps answers to checklist questions. Flags questions that the notes do not cover.

The agent detects the mode from the input:
- Text file / pasted notes with multiple topics covered -> Extract Mode
- Brief only or no input -> Live Mode

## Workflow

### Step 1: Read References

Read these files before starting:
- `~/.project-kickstart/templates/PROJECT_SCOPING_CHECKLIST.md`
- `~/.project-kickstart/guides/PROJECT_SCOPING_GUIDE.md`

### Step 2: Gather Context

If a brief is provided, read it and build a mapping:

| Brief Section | Checklist Parts |
|---------------|-----------------|
| Problem | Part 1 (1.1, 1.4, 1.5, 1.6) |
| Success Criteria | Part 2 (2.1, 2.2) |
| User Stories | Part 3 (3.1) |
| Constraints | Part 4 (4.1-4.5) |
| Out of Scope | Part 3 (3.3) |
| MVP | Part 3 (3.2) |
| Open Questions | Part 9 |

Pre-fill answers from the brief where the mapping is direct. Mark pre-filled answers with `[from brief]` so the user can confirm or revise.

### Step 3: Walk Through Questions

Present one Part at a time (not all 10 at once). For each Part:

1. Show the Part title and owner context (e.g., "Part 1: The Problem -- PM/Client prepares, Engineer validates")
2. For each question in the Part:
   - Show the question text
   - If pre-filled from brief: show the pre-filled answer and ask "Confirm, revise, or expand?"
   - If not pre-filled: ask the question and wait for the answer
   - If the user gives a vague answer, push back once with a specific follow-up (see Push-Back Rules below)
3. After all questions in the Part are answered, summarize and move to the next Part

**Do NOT dump all questions at once.** The value of this skill is the guided, sequential walkthrough that prevents skipping.

### Step 4: Handle Gaps

For any question the user cannot answer:
- Format as: `Unknown (owner: {name}, due: {date})`
- Ask who should own the answer and when it's needed
- If no owner is provided, default owner is "PM" with due date "before TRD"
- Collect all unknowns into Part 9 (Open Questions) automatically

### Step 5: Generate Output

Produce a completed `PROJECT_SCOPING_CHECKLIST.md` with:
- Header fields filled (Project, Date, PM/Client, Lead Engineer)
- Every question checked `[x]` with an answer, or marked Unknown with owner/date
- Part 9 populated with all collected open questions
- Part 10 next steps checked based on what was discussed
- Sign-off section ready (names filled, dates blank for actual signing)

Write the output to the user's working directory as `SCOPING_CHECKLIST.md` (or a path they specify).

After the checklist, add a summary:

```
---
## Session Notes

**Questions answered:** {count} / {total}
**Open questions:** {count} items need resolution before TRD
**Pre-filled from brief:** {count} answers confirmed
**Key risks identified:** {list}
**Next step:** {recommendation: write TRD, run spike, resolve open questions first}
```

## Push-Back Rules

The agent MUST push back (once) when answers are vague. This is the core value: forcing specificity.

| Vague Answer | Push-Back |
|-------------|-----------|
| "Users" | "Which users specifically? A segment, role, or persona?" |
| "Fast" / "performant" | "What response time? Give me a number, even a rough one." |
| "ASAP" | "Is there a hard deadline with a consequence, or is this a priority signal?" |
| "Everything is important" | "If you could only ship one story, which one?" |
| "We'll figure it out" | "That's an open question. Who owns the answer, and when do we need it by?" |
| "It should be simple" | "What makes you think so? Let me list what I see as the moving parts." |
| "Same as project X" | "What specifically is the same? And what's different? Every project has unique parts." |
| No out-of-scope items | "What are 3 things you do NOT want built in this phase?" |
| No success metric | "How will we know this worked 30 days after launch? What number changes?" |

Push back once. If the user confirms their answer after the push-back, accept it and move on. Do not nag.

## Extract Mode Details

When processing meeting notes or transcripts:

1. Read the full input
2. For each checklist question, search the input for relevant content
3. Map extracted answers to questions, quoting the source text
4. Present the filled checklist with `[extracted]` markers
5. List questions that have NO coverage in the notes
6. Ask the user to fill gaps or confirm extractions

## Important

- Never skip a question. The checklist exists because every question matters.
- Never invent answers. Pre-fill from the brief or ask. Unknowns are honest.
- One Part at a time. Sequential presentation prevents cognitive overload.
- Push back on vagueness, but only once per question. Respect the user's final answer.
- The checklist is a shared document. Both PM and Engineer answers belong in it.
