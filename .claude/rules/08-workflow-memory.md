# Workflow Memory

Two root files carry state across sessions and thread through the workflows in `09` and the `start-work` skill. Both are plain markdown. This rule is always loaded, so all of the below is ambient behavior.

## WORK_STATE.md — resume point

- **At the start of any session, or on "resume":** read `WORK_STATE.md` first and summarize it back before doing anything else, then continue the task in place.
- **While working a multi-step task:** keep "Status", "Plan", and "Test plan" current *as you go*.
- **On "let's stop here" or pausing:** set "Status" to `Paused` and make sure Plan / Test plan / Open questions reflect exactly what's done and what's left.
- **When the task actually reaches Definition of Done:** the standard closeout below runs automatically.
- Only one active task block at a time. 

## CHANGELOG.md — completed work log

- **On completing and verifying a task:** append an entry without being asked.
- Name the files/areas touched and flag anything the *next* session needs to know.
- Append only — never rewrite or delete prior entries.

## Standard task closeout

1. Confirm build + the relevant tests are actually green by running them (`flutter test`).
2. Append a `CHANGELOG.md` entry naming the files/areas touched.
3. Clear the finished task from `WORK_STATE.md`.
