# Project Scoping Guide: Engineer's Playbook

A reference for engineers before starting any new project. Read this, run the checklists, and you will catch 90% of the problems that derail projects before a single line of code is written.

**Related documents:** [Project Briefing Guide](./PROJECT_BRIEFING_GUIDE.md) (the PM/Client counterpart) | [Scoping Checklist](./PROJECT_SCOPING_CHECKLIST.md) (shared worksheet) | [TRD Template](./TRD_TEMPLATE.md) (your output) | [TRD Guide](./TRD_GUIDE.md) (rules for writing TRDs)

---

## Table of Contents

1. [Mindset](#1-mindset)
2. [The Scoping Conversation](#2-the-scoping-conversation)
3. [Requesting an Exploration Phase](#3-requesting-an-exploration-phase)
4. [Shaping the Brief (with the PM)](#4-shaping-the-brief-with-the-pm)
5. [Setting Boundaries Against Scope Creep](#5-setting-boundaries-against-scope-creep)
6. [Stakeholder Communication Cheat Sheet](#6-stakeholder-communication-cheat-sheet)
7. [Pre-Kickoff Checklist](#7-pre-kickoff-checklist)
8. [Red Flags](#8-red-flags)

---

## 1. Mindset

You are not a ticket executor. You are a co-owner of the project's success. That means:

- **Your job starts before the first task.** If the requirements are wrong, perfect code delivers the wrong thing.
- **Saying "I don't understand" is productive.** Saying "sure, I'll figure it out" is a risk.
- **Pushing back is not being difficult.** It is preventing waste. A week spent scoping saves a month of rework.
- **The cheapest time to kill a bad idea is now.** Before design, before code, before launch.

---

## 2. The Scoping Conversation

This is the first meeting (or async exchange) where the project is introduced. Your goal: leave with enough understanding to assess feasibility and identify unknowns.

### Questions to Ask the Client / PM / PO

**The Problem**

| Question | Why It Matters |
|----------|----------------|
| What problem are we solving? | If the answer is a solution ("build X"), push back. You need the problem first. |
| Who has this problem? How often? | Filters real pain from assumed pain. |
| What happens today without this? | Reveals workarounds, urgency, and whether "do nothing" is viable. |
| How will we know it's solved? | Forces a measurable success criterion. No metric = no way to declare done. |

**The Constraints**

| Question | Why It Matters |
|----------|----------------|
| Is there a hard deadline? What drives it? | Regulatory, contractual, or marketing deadlines are real. "ASAP" is not a deadline. |
| What is the budget (time, money, people)? | Prevents designing a 6-month solution for a 3-week budget. |
| What cannot change? (tech stack, vendor, API) | Identifies constraints before you design around them. |
| What has already been tried or decided? | Avoids re-litigating settled decisions. Also surfaces hidden assumptions. |

**The Scope**

| Question | Why It Matters |
|----------|----------------|
| What is explicitly NOT included? | The most important question. If they can't answer, the scope is not defined. |
| What is the smallest version that delivers value? | Opens the door to phased delivery and MVP thinking. |
| Who are the decision-makers, and who are the advisors? | Prevents design-by-committee. You need one person who can say "yes, ship it." |
| Are there other teams or systems affected? | Surfaces integration risk and cross-team coordination early. |

### How to Ask

- **Don't interrogate.** Frame questions as "I want to make sure I build the right thing."
- **Repeat back in your own words.** "So what I'm hearing is..." catches misunderstandings immediately.
- **Write it down in the meeting.** If it's not written, it didn't happen. Share notes afterward and ask for corrections.
- **Ask "why" one more time than feels comfortable.** Surface requirements hide deeper requirements. "We need a dashboard." Why? "To track X." Why can't you track X today? "The data is in 3 systems." The real problem is data fragmentation, not a missing dashboard.

---

## 3. Requesting an Exploration Phase

Not every project is ready to estimate or plan. When the unknowns are too large, you need an exploration phase (spike, POC, discovery: the name doesn't matter).

### When to Request One

- The system you need to integrate with has no documentation or poor documentation
- A core technical assumption is unverified ("can this API handle 10k req/s?")
- The domain is new to the team and business rules are unclear
- Multiple architectural approaches exist and the tradeoffs are not obvious
- The client says "it should be simple" but you can already see 3 ways it isn't

### How to Frame It

Do not say: *"I don't know how to do this."*

Say: **"There are unknowns that will determine the architecture. I can estimate after a {1–5 day} spike with a clear deliverable."**

### The Spike Contract

Present it as a bounded agreement:

| Element | Description |
|---------|-------------|
| **Goal** | Answer a specific question (not "explore the domain") |
| **Timebox** | Fixed duration. 1–5 days. Non-negotiable end date. |
| **Deliverable** | A written document: findings, recommendation, revised estimate |
| **Decision point** | At the end, stakeholders decide: proceed, pivot, or kill |

Example: *"I need 3 days to build a throwaway prototype of the payment integration. Deliverable: a document confirming whether Stripe Connect meets our multi-vendor payout requirements, with an architecture recommendation and a revised estimate."*

### If They Say No

If the exploration phase is denied:

1. State the risk explicitly in writing: "Without validating X, the estimate has a ±50% confidence range."
2. Propose a parallel approach: validate the assumption in the first sprint while building the known parts.
3. Do not pad estimates silently. Transparent uncertainty is better than hidden buffer.

---

## 4. Shaping the Brief (with the PM)

The PM's input document may be called a PRD (Product Requirements Document) or a project brief. In this framework, the [Project Brief Template](./PROJECT_BRIEF_TEMPLATE.md) serves as the PRD. Engineers don't write it, but you should shape it. A bad brief creates a bad TRD creates bad code. Intervene early.

### What a Good Brief Contains (Engineer's Checklist)

Use this to review the PM's brief before accepting it as input for your TRD:

- [ ] **Problem statement** clearly articulated, not a solution in disguise
- [ ] **Target user** named persona or segment, not "users"
- [ ] **Success metric** quantifiable, with a baseline and target
- [ ] **User stories or jobs-to-be-done** what the user wants to accomplish, not how
- [ ] **Scope boundary** explicit "out of scope" section
- [ ] **Priority** MoSCoW or similar ranking if multiple features
- [ ] **Constraints** timeline, budget, regulatory, technical
- [ ] **Assumptions** stated, not buried
- [ ] **Open questions** with owners and deadlines

### What to Push Back On

| Brief Problem | What to Say |
|-------------|-------------|
| Solution masquerading as a requirement | "This describes the *how*. Can we reframe as the *what* and *why*? That gives us room to find the best technical approach." |
| No success metric | "How will we know this worked? I need a metric to design the right level of instrumentation." |
| Scope is everything | "If everything is P0, nothing is P0. Can we rank these so I know what to protect if we hit a constraint?" |
| Assumptions stated as facts | "Is this validated? If not, let's mark it as an assumption so we can test it early." |
| No "out of scope" | "I need to know what we're NOT doing so I don't over-engineer. Can we list 3–5 things that are explicitly excluded?" |
| Vague user stories | "As a user, I want to manage my data. What does 'manage' mean? CRUD? Export? Sharing? Each implies different work." |

### The Brief Review Meeting

Request a 30-minute brief walkthrough before writing the TRD. Agenda:

1. PM presents the brief (10 min)
2. Engineers ask clarifying questions (10 min)
3. Identify gaps, assign owners for missing info (5 min)
4. Agree on timeline for brief finalization (5 min)

Output: annotated brief with engineer comments, list of open items with owners.

---

## 5. Setting Boundaries Against Scope Creep

Scope creep is the #1 project killer. It doesn't arrive as a big change. It arrives as a series of "small" additions that compound.

### Prevention Framework

#### 1. Anchor Everything to the Brief

Every request gets one question: **"Is this in the brief?"**

- **Yes:** proceed.
- **No, but it should have been:** update the brief, re-assess impact, get written approval.
- **No, and it's new:** it goes to the backlog. It is not part of this project.

#### 2. Make Cost Visible

When a stakeholder requests a change mid-project:

Do not say: *"That's out of scope."* (confrontational, conversation-ending)

Say: **"We can do that. Here's what it costs."**

Then present the trade-off:

| Option | Impact |
|--------|--------|
| **Add it, push deadline** | Delivery moves from {date} to {date}. Affects {downstream}. |
| **Add it, drop something** | We remove {feature Y} to make room. Which do you prefer? |
| **Add it next phase** | Ships in v2 after launch. No impact on current timeline. |

Force the stakeholder to choose. The decision is theirs, but the information is yours to provide.

#### 3. The "Yes, in Phase 2" Technique

Never say "no" to a good idea. Say **"yes, in phase 2."**

This acknowledges the value of the idea while protecting the current scope. Write it down in the Out of Scope section of the TRD with an ID, so it's tracked and not forgotten.

#### 4. Change Request Protocol

For any scope change after the TRD is approved:

1. Requester submits the change in writing (not verbally)
2. Engineer assesses impact: effort, risk, timeline, dependencies
3. Impact is shared with PM and stakeholders
4. PM decides: approve (with trade-off), defer, or reject
5. If approved: TRD is updated, new tasks are created, timeline is adjusted

No verbal agreements. No "just this one small thing." Writing forces thinking.

### Phrases That Protect Scope

| Situation | Phrase |
|-----------|--------|
| New feature request mid-sprint | "I'll add it to the backlog. For this sprint, the scope is locked." |
| "Can you just quickly add..." | "I can estimate it. Quick is relative; it may have dependencies." |
| Moving goalposts | "The original agreement was X. This is Y. Let's decide together which we're building." |
| Feature by committee | "I'm hearing different priorities. Can we get the decision-maker to align on one direction?" |
| Urgency without justification | "What changes if this doesn't ship this week?" |

---

## 6. Stakeholder Communication Cheat Sheet

Different stakeholders need different information. Speak their language.

### Client / End User

- **Cares about:** What it does. When they get it. Whether it solves their problem.
- **Don't tell them:** Technical architecture, stack choices, internal trade-offs.
- **Format:** Demo, screenshots, timeline milestones.
- **Frequency:** At key milestones (kickoff, mid-point, pre-launch).

### Product Owner / PM

- **Cares about:** Scope, priority, trade-offs, risks, timeline accuracy.
- **Don't tell them:** Implementation details (unless they ask).
- **Format:** Written status, impact assessments, decision requests.
- **Frequency:** Weekly or per-sprint.

### Engineering Manager

- **Cares about:** Team capacity, blockers, technical debt, cross-team dependencies.
- **Don't tell them:** Line-by-line code decisions.
- **Format:** Blockers list, risk register, dependency status.
- **Frequency:** Standup-level daily, deeper weekly.

### Other Engineers / Reviewers

- **Cares about:** Architecture, API contracts, schema, conventions, test coverage.
- **Don't tell them:** Business justification (link the brief).
- **Format:** TRD, ADRs, PR descriptions.
- **Frequency:** At design time and review time.

### General Rules

- Escalate blockers within 24 hours. Not in standup. Directly to the person who can unblock.
- Default to writing. Verbal agreements evaporate. Follow up every call with a written summary.
- Flag risk early and often. "I told you so" after the fact is worthless. "I see a risk" before the fact is valuable.

---

## 7. Pre-Kickoff Checklist

Run this checklist before writing your first line of code. Every item should be checked or explicitly marked N/A with a reason.

### Understanding

- [ ] I can explain the problem we're solving in one sentence
- [ ] I know who the target user is
- [ ] I know how success will be measured
- [ ] I have read the brief and flagged any gaps

### Scope

- [ ] The brief has an explicit "out of scope" section
- [ ] I know what the MVP is (smallest shippable unit)
- [ ] Priorities are ranked, not all P0
- [ ] Stakeholders have signed off on the scope in writing

### Technical Readiness

- [ ] I have access to all systems, repos, and environments I need
- [ ] External dependencies are documented with status and owner
- [ ] Unknown technical risks have been identified
- [ ] An exploration phase has been completed (or is not needed; state why)
- [ ] The TRD is written, reviewed, and approved

### Process

- [ ] I know who the decision-maker is (one person, not a group)
- [ ] Communication cadence is agreed (how often, what format, to whom)
- [ ] Change request process is understood by all stakeholders
- [ ] Definition of done is explicit (code review, QA, staging, prod)

### Team

- [ ] Roles are clear (who builds what, who reviews, who tests)
- [ ] Dependencies on other teams are communicated and acknowledged
- [ ] On-call / support expectations during and after launch are defined

---

## 8. Red Flags

If you see these, stop and address them before proceeding. Building on a broken foundation wastes everyone's time.

| Red Flag | What It Means | What to Do |
|----------|---------------|------------|
| No brief exists | The project is not defined | Refuse to estimate. Request a brief. |
| "We'll figure out the details as we go" | The scope will explode | Request a scoping session. Write down what "figured out" means. |
| Everyone is a decision-maker | No one is a decision-maker | Ask: "If we disagree, who makes the final call?" Get one name. |
| The deadline was set before the scope | The project is already late | Surface the constraint. Present options: cut scope, extend, or add resources. |
| No "out of scope" | Everything is in scope | Write one yourself and get it approved. |
| Estimate pressure | "Can't you just estimate it roughly?" | A rough estimate becomes a commitment. Say: "I can give a range after a spike." |
| Changing requirements between meetings | Unstable vision | Freeze the spec. "Let's lock requirements for 2 weeks, then review." |
| Third-party dependency with no contract | Integration risk | Demand a sandbox, documentation, or SLA before designing against it. |
| "This is just like project X" | It is not like project X | List the differences. Every project is unique. Analogies hide complexity. |
| Stakeholder hasn't seen the TRD | They will have opinions at the worst time | Share the TRD early. Silence is not approval. |
