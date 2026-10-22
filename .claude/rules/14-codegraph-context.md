# CodeGraph MCP

Trigger: refactor zone-mapping and blind-spot passes (`.claude/rules/09-definition-of-ready-done.md`), feature scope/layer-impact checks on unfamiliar code, regression-risk checks (`.claude/rules/10-test-planning.md`), dead-code verification, or any "who calls this / what breaks if I change this / where else is this used" question.

## What it is

A local, auto-synced index of every symbol, call edge, and dependency in this repo (tree-sitter parsed, stored in `.codegraph/`, kept current by a file watcher — never needs a manual re-index step; `codegraph_status` shows pending-sync state if something looks stale).

## Default tool: `codegraph_explore`

One call, one question — returns the relevant symbols' verbatim source, the call paths between them (including interface/dynamic-dispatch hops grep can't follow), and a blast-radius summary. This is what this codebase's own patterns make grep unreliable for: Provider-injected classes like `BrewService` or `LocalPackageOperations`, and utilities like `ShellUtils`, are often resolved dynamically or passed through the widget tree, so a plain text search for a class name might miss call sites.

**Reach for `codegraph_explore` over grep/manual reading whenever the question is:**

- What calls this function/class, across the whole repo, not just this file?
- What does this symbol depend on, and what would changing it actually affect?
- Where else in the codebase is this pattern/symbol used?

## Specific hooks into the existing workflow

- **Refactor DoR, "zone mapped"** (`09`): enumerate actual dependents via `codegraph_explore`/`codegraph_impact`, not a manual read of the package.
- **Refactor blind-spot pass** (`09`): "external callers" — confirm the full list via `codegraph_explore`/`codegraph_callers` before and after the change, not by eye.
- **Dead-code verification** (`09`'s blind-spot pass): before deleting a class/method flagged as an orphaned-by-removal candidate, confirm zero remaining callers via `codegraph_impact` — don't delete on the strength of a grep that might have missed an interface-based call site.
- **Test planning, "regression risk in the same class/file"** (`.claude/rules/10-test-planning.md`): use `codegraph_callers`/`codegraph_impact` to find what else depends on the symbol you're changing, surfacing indirect regression risk a same-file test run won't catch.
- **Feature DoR, "scope named" / "layer impact known"** (`09`): for zones you haven't touched recently, confirm actual dependents instead of guessing from package structure alone.

## Other tools (unlisted by default, still callable)

`codegraph_node`, `codegraph_search`, `codegraph_callers`, `codegraph_callees`, `codegraph_impact`, `codegraph_files`, `codegraph_status` — call one of these directly instead of `codegraph_explore` only when you need one narrow thing (just the caller list, just impact depth N) rather than the bundled source+paths+blast-radius result.

## What it doesn't tell you

The graph is structural — calls, imports, inheritance — not behavioral. Treat a clean `codegraph_impact` result as "nothing else calls this," not as "nothing else behaviorally depends on this".

## If the tool errors or the index is out of sync

If a query errors, or `codegraph_status` shows a pending sync, don't treat the result as ground truth — fall back to a grep-based check and note the gap under Definition of Ready's "Open questions / blockers" instead of reporting the zone/blast-radius/dead-code check as done.
