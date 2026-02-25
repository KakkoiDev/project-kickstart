# Project Briefing Guide: PM / Client Playbook

What to prepare before meeting your engineering team. The better you prepare, the faster and cheaper the build. Every hour spent here saves a week of rework later.

This is the other side of the coin from [PROJECT_SCOPING_GUIDE.md](./PROJECT_SCOPING_GUIDE.md) (the engineer's playbook).

> **Want to skip ahead?** Start with the [Brief Template](./PROJECT_BRIEF_TEMPLATE.md). Fill it out, then come back here for any section you're unsure about.

---

## Table of Contents

1. [Your Role in the Process](#1-your-role-in-the-process)
2. [Before the Meeting: The Preparation Kit](#2-before-the-meeting-the-preparation-kit)
3. [Writing the Brief](#3-writing-the-brief)
4. [What Engineers Will Ask You (And How to Prepare)](#4-what-engineers-will-ask-you-and-how-to-prepare)
5. [During the Meeting](#5-during-the-meeting)
6. [After the Meeting](#6-after-the-meeting)
7. [Ongoing: Your Responsibilities During the Build](#7-ongoing-your-responsibilities-during-the-build)
8. [Common Mistakes](#8-common-mistakes)
9. [Pre-Meeting Checklist](#9-pre-meeting-checklist)
10. [Glossary](#10-glossary)

---

## 1. Your Role in the Process

You own the **what** and the **why**. Engineers own the **how**.

- You define the problem. They design the solution.
- You set priorities. They set estimates.
- You make scope trade-offs. They make technical trade-offs.
- You are the voice of the user. They are the voice of the system.

This means:

- **Do** describe the outcome you need. *"Users need to receive a payout within 24 hours."*
- **Don't** prescribe the implementation. *"Build a cron job that runs every hour and calls Stripe."*
- **Do** rank what matters most. Engineers will ask what to cut if time runs short.
- **Don't** say everything is critical. If everything is P0, nothing is.

---

## 2. Before the Meeting: The Preparation Kit

Arrive at the scoping meeting with these items ready. Missing items will delay the project. The meeting will turn into a homework assignment instead of a working session.

### 2.1 The Problem Statement

Write one paragraph (3–5 sentences) that answers:

1. **Who** has the problem? (specific user segment, not "users")
2. **What** is the problem? (what is broken, missing, or painful)
3. **Why** does it matter now? (business impact, user complaints, regulatory pressure)
4. **What happens if we do nothing?** (the cost of inaction)

Test: read it to someone outside the project. If they don't understand the problem in 30 seconds, rewrite it.

### 2.2 The Success Criteria

Engineers cannot build what they cannot measure. Define how you will know the project succeeded.

| Criteria Type | Example | Anti-Example |
|---------------|---------|--------------|
| Measurable | "Checkout abandonment drops from 34% to 20%" | "Improve the checkout experience" |
| Time-bound | "Within 30 days of launch" | "Eventually" |
| Observable | "Support tickets about X drop to < 5/week" | "Users are happier" |
| Binary | "Vendors can export their sales data as CSV" | "Better reporting" |

If you cannot define a success metric, the project is not ready to build.

### 2.3 User Stories or Scenarios

Describe what the user does, not what the system does. Format:

> **As a** {user type}, **I want to** {action}, **so that** {outcome}.

Write 3–10 stories. Prioritize them. This is the most useful artifact you can bring to the meeting. It gives engineers concrete behavior to design against.

Bad: *"As a user, I want to manage my account."*
Good: *"As a freelancer, I want to update my bank details without contacting support, so that I receive my next payout without delay."*

### 2.4 Constraints and Givens

List what is already decided and non-negotiable:

- **Deadline:** Is there one? What drives it? (contract, regulation, event, marketing)
- **Budget:** Time or money ceiling. Be honest. "3 weeks" is more useful than "as soon as possible."
- **Tech constraints:** Must use existing platform? Specific vendor? Legacy system integration?
- **Regulatory:** GDPR, PCI, accessibility (WCAG), industry-specific compliance?
- **Existing decisions:** Approved designs? Signed vendor contracts? Committed API partners?

### 2.5 What You Don't Want Built

This is the most overlooked preparation item and the most valuable.

Write a list of things that are **out of scope**: features, users, edge cases, integrations you explicitly do not want in this phase. This prevents engineers from over-building and prevents stakeholders from adding requests mid-project.

Examples:
- "No mobile app, web only for v1"
- "No bulk import, single-entry only"
- "We are not supporting users outside the EU in this phase"
- "Admin panel is out of scope, we'll use the database directly"

### 2.6 Reference Materials

Gather everything the engineer might need to understand the domain:

- Existing product screenshots or walkthrough video
- Competitor examples ("like X but with Y")
- Design mockups, wireframes, Figma links (even rough sketches)
- Relevant data: current metrics, user research, support ticket samples
- Previous attempts: what was tried before and why it failed or was abandoned
- API docs or technical specs from third-party vendors

---

## 3. Writing the Brief

If you only have time for one document, make it this. A project brief is a 1–3 page document that packages everything from Section 2 into a readable format.

Use the standalone template: **[PROJECT_BRIEF_TEMPLATE.md](./PROJECT_BRIEF_TEMPLATE.md)**

Copy it, fill every section, and share it with the engineering team at least 24 hours before the scoping meeting. The template includes a quality check at the bottom to verify before sharing.

---

## 4. What Engineers Will Ask You (And How to Prepare)

Engineers will ask questions you haven't considered. This is good. It means they're thinking about your project seriously. Prepare for the most common ones.

### Questions You Must Be Ready to Answer

| Question | How to Prepare |
|----------|----------------|
| "What problem does this solve?" | Section 2.1. Rehearse your answer. |
| "How do you measure success?" | Section 2.2. Have numbers. |
| "What is the smallest version that delivers value?" | Think about what you could launch in 1 week. What is the core? |
| "What is explicitly NOT included?" | Section 2.5. The longer this list, the clearer the scope. |
| "Who makes the final decision?" | Have one name. Not a committee. Not "we'll decide together." One person. |
| "Is there a hard deadline? What drives it?" | Know the difference between a real deadline and a wish. |
| "What has been tried before?" | Gather context. Failed attempts are valuable information. |
| "Who else is affected by this?" | Map the teams, systems, and users that are touched. |

### Questions You're Allowed to Not Answer

| Question | What to Say |
|----------|-------------|
| "How should we build it?" | "That's your expertise. I care about the outcome." |
| "What technology should we use?" | "Whatever best fits. Here are my constraints: {list}." |
| "How long will it take?" | Don't answer this. That's their job after they scope it. |
| "Is this technically possible?" | "I don't know. Can you tell me, and what are the alternatives if not?" |

### The Most Important Phrase

When an engineer asks a question you don't have the answer to:

**"I don't know yet. I'll get back to you by {date}."**

This is always better than guessing. A wrong answer from you becomes a wrong assumption in the architecture.

---

## 5. During the Meeting

### Structure (60 minutes)

| Time | Activity | Owner |
|------|----------|-------|
| 0–15 min | Present the brief. Walk through the problem, stories, constraints. | You |
| 15–35 min | Engineers ask questions. Answer or note as open items. | Engineers lead, you answer |
| 35–50 min | Discuss scope boundaries. Agree on what's in, what's out. | Both |
| 50–60 min | Agree on next steps: exploration needed? Estimate timeline? Missing info? | Both |

### Rules for You

- **Listen more than you talk.** After presenting the brief, let engineers drive.
- **Don't defend solutions, defend problems.** If an engineer challenges your proposed approach, redirect to the problem. "You're right, maybe a dashboard isn't the answer. The problem is that vendors can't see their sales data. What do you suggest?"
- **Take notes on commitments.** Who owes what, by when.
- **Don't ask for estimates in this meeting.** Scoping and estimating are separate activities. Asking for an estimate before the engineer has processed the scope creates pressure to guess.
- **Say "I need to check" instead of guessing.** Engineers will design against what you say. An offhand "yeah, probably around 1000 users" becomes a scaling assumption.

### What a Good Meeting Produces

- Shared understanding of the problem (not just the solution)
- Agreed scope boundary (in/out list)
- List of open questions with owners and deadlines
- Clear next step: exploration spike, PRD revision, or TRD writing
- No false commitments on either side

---

## 6. After the Meeting

### Within 24 Hours

1. **Send written notes.** Summarize decisions, open items, and next steps. Ask for corrections.
2. **Answer your action items.** If you committed to clarifying something, do it before the engineer starts designing.
3. **Update the brief / PRD.** Incorporate what was discussed. The document is the source of truth, not the meeting.

### Within the First Week

4. **Review the TRD.** The engineer will translate your brief into a technical plan. Read it. You don't need to understand the code, but you should verify:
   - Does the task list cover all your user stories?
   - Is the "out of scope" list consistent with what you agreed?
   - Are the acceptance criteria testing the right behavior?
   - Are there open questions assigned to you?

5. **Approve the scope in writing.** An email, a Slack message, a comment on the document. Anything written. Verbal approval is not approval.

---

## 7. Ongoing: Your Responsibilities During the Build

Your job does not end at the scoping meeting.

### Availability

- **Respond to questions within 24 hours.** Engineers blocked on a question from you are engineers not building your project.
- **Be reachable for quick decisions.** 5-minute Slack answers prevent 2-day delays.
- **Attend demos and reviews.** If you skip them, you lose the right to complain about the result.

### Scope Discipline

- **New ideas go to the backlog, not the current sprint.** Say: "Great idea. Let's do it in phase 2."
- **If you need to change scope, do it in writing.** Describe what you want to add, and ask the engineer for the impact. Then decide: add and delay, add and cut something else, or defer.
- **Don't "sneak in" requirements through casual conversation.** If it matters, it goes in the document.

### Decisions

- **Decide quickly.** A wrong decision that can be reversed is better than no decision that blocks the team.
- **Decide once.** Reversing decisions is expensive. Think before committing, but commit fully.
- **Own your decisions.** If you chose to cut a feature and users complain, that's not the engineer's fault.

---

## 8. Common Mistakes

| Mistake | Consequence | Prevention |
|---------|-------------|------------|
| Describing the solution instead of the problem | Engineers can't explore better approaches | Lead with "why", not "what to build" |
| No out-of-scope list | Everything gets added, nothing ships on time | Write it before the meeting. Minimum 3 items. |
| "Everything is priority 1" | Engineers can't make trade-offs when time runs short | Force-rank. If you had to cut half the features, which half survives? |
| Asking for estimates before scoping | Engineers guess, guesses become commitments | Separate scoping and estimating into two conversations |
| Changing requirements verbally | No paper trail, conflicting memories, scope disputes | All changes in writing. No exceptions. |
| Skipping the exploration phase | Estimate based on assumptions, assumptions turn out wrong | If the engineer says they need a spike, trust them |
| Approving the TRD without reading it | Surprises at launch | Read the task list and acceptance criteria. Ask questions. |
| Disappearing after kickoff | Engineers make assumptions without you, some will be wrong | Stay available. Review regularly. |
| Designing the UI in the meeting | Slows down engineers, overrides design process | Bring wireframes or sketches beforehand, or let designers lead |
| Saying "just" or "simply" | Minimizes complexity, creates resentment | Ban these words. If it were simple, you wouldn't need an engineer. |

---

## 9. Pre-Meeting Checklist

Run this before sending the meeting invite. Every unchecked item is a risk.

### The Problem

- [ ] I can explain the problem in one paragraph without mentioning a solution
- [ ] I know who has this problem (specific user segment)
- [ ] I know why this matters now (not just "it would be nice")
- [ ] I have a success metric with a number and a timeframe

### The Scope

- [ ] I have written 3–10 prioritized user stories
- [ ] I have listed what is explicitly out of scope (minimum 3 items)
- [ ] I have ranked priorities (not everything is P0)
- [ ] I know what the smallest shippable version looks like

### The Constraints

- [ ] I know the real deadline (and the reason behind it)
- [ ] I know the budget (time, money, or both)
- [ ] I have listed technical constraints and regulatory requirements
- [ ] I have listed existing decisions that cannot be changed

### The Materials

- [ ] The project brief is written and shareable
- [ ] Reference materials are linked (designs, data, competitor examples)
- [ ] Previous attempts / context is documented
- [ ] Third-party vendor docs or contacts are available if needed

### The People

- [ ] I have identified one decision-maker (not a group)
- [ ] I know which engineers will attend the scoping meeting
- [ ] I have shared the brief with attendees at least 24 hours before the meeting
- [ ] I have blocked 60 minutes (not 30; scoping cannot be rushed)

### My Readiness

- [ ] I have rehearsed the problem statement out loud
- [ ] I have prepared answers for the questions in Section 4
- [ ] I will not ask for an estimate in this meeting
- [ ] I understand that my job continues after the meeting

---

## 10. Glossary

| Term | What it means |
|------|---------------|
| **PRD** | Product Requirements Document. The "what" and "why." In this framework, the Project Brief Template serves as your PRD. |
| **PO** | Product Owner. Same role as PM in this framework. Some teams use PO, others use PM. |
| **TRD** | Technical Requirements Document. The "how." The engineer writes this based on your brief. |
| **NFR** | Non-Functional Requirement. Performance, security, scalability, uptime. Not a feature, but a constraint on how features must behave. |
| **MVP** | Minimum Viable Product. The smallest version that delivers value. What you'd ship if you had half the time. |
| **Spike** | A timeboxed exploration phase (1-5 days) to answer a technical question before committing to an estimate. |
| **MoSCoW** | Priority ranking: Must have, Should have, Could have, Won't have. A way to force-rank features. |
| **P0 / P1 / P2** | Priority levels. P0 = must ship, P1 = should ship, P2 = nice to have. |
| **Scope creep** | Uncontrolled growth of project requirements after the scope is agreed. The #1 cause of missed deadlines. |
| **Change request** | A formal written request to modify the agreed scope. Requires impact assessment before approval. |
| **Acceptance criteria** | Concrete conditions that must be true for a task to be considered done. Usually written as "Given X, when Y, then Z." |
| **SLA** | Service Level Agreement. A commitment to uptime, response time, or availability. |
| **WCAG** | Web Content Accessibility Guidelines. Standards for making web content accessible to people with disabilities. |
