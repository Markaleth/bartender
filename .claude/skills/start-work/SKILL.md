---
name: start-work
description: Start any unit of work, with or without a ticket — branch, gather context, confirm goal, draft DoR/DoD in WORK_STATE.md, implement, open PR. Use when the user says "start / pick up / work on X" or invokes /start-work.
---

Gather the goal/scope conversationally or from a provided issue description. Name or infer the flavor: feature, refactor (name the target zone), or upgrade (name the target version/axis).

Follow the steps below exactly, including every checkpoint (goal confirmation, PR). Don't skip or batch them.

# Start Work

## 1. Identify the source and the flavor

- Gather the information conversationally — goal, scope.
- Name the flavor: **Feature**, **Refactor**, or **SDK/Dependency Upgrade**.

## 2. Branch

- `git checkout main && git pull origin main` (or `develop`)
- Create a new branch `{kebab-slug-from-description}`.

## 3. Confirm the goal — checkpoint

State back, in your own words, what this task is actually trying to achieve. Post this and wait for confirmation before continuing.

## 4. Cross-reference and draft DoR/DoD

- Draft the Definition of Ready and Definition of Done from `.claude/rules/09-definition-of-ready-done.md`. Write it into `WORK_STATE.md`.

## 5. Plan → Execute → Definition of Done

Proceed through Plan → Execute → Definition of Done.

## 6. Pull request and implementation summary — checkpoint

- On Definition of Done being met, propose the PR.
- On approval, push the branch and open the PR.
- Standard closeout per `.claude/rules/08-workflow-memory.md`.
