---
name: audit-agent-documentation
description: Periodically audit and improve a repository's agent documentation without weakening project-specific contracts.
disable-model-invocation: true
---

# Audit Agent Documentation

Treat the repository's agent guidance as one **instruction stack**: agents experience root guidance, scoped guidance, routed references, and skills together. Treat documentation consumed by a workflow as a **contract**, even when it looks like ordinary prose.

Infer the authorization mode from the request:

- **Audit-only** — diagnose and report proposed changes without editing.
- **Improve** — the default; audit, make focused edits, and validate them.
- **Publish** — improve, then commit, push, or open a review only when the user explicitly requests that publication boundary.

Read [`references/AUDIT-RUBRIC.md`](references/AUDIT-RUBRIC.md) completely before judging the documentation. It contains the evaluation criteria and the source-bounded synthesis from the two articles and the session that produced this skill.

## 1. Establish authority and boundaries

Resolve the repository root, current worktree and branch, working-tree status, and the instruction files that govern the task itself. Read applicable `AGENTS.md` and equivalent agent instructions from the broadest scope to the most specific scope before examining candidates for change.

Identify existing user changes and keep them intact. Record any explicit setup, generation, source-management, publication, or ownership rules that constrain agent documentation.

**Complete when:** the governing instruction chain, dirty-worktree boundaries, and protected or source-managed surfaces are all identified.

## 2. Inventory the instruction stack

Search by role across every agent-documentation convention present. Account for:

- Root and nested agent entry points such as `AGENTS.md`, `CLAUDE.md`, and ecosystem-specific instruction surfaces that exist in the repository.
- Documents and context maps reached from those entry points.
- Repository-local skills, their routed references, and their discovery adapters.
- Setup outputs, lock or provenance manifests, generated guidance, and the source files or commands that own them.
- Nearby documentation and repository examples that reveal local conventions.

Exclude dependencies, build output, and vendored examples unless the repository deliberately uses one as an agent-facing source.

For each surface, determine its scope, consumer, load condition (always loaded or routed), owner or source, and authoritative replacement path. Keep this as working notes unless the user asks for an audit artifact.

**Complete when:** every discovered agent-facing entry point is accounted for, every routed document needed to understand its contract has been read, and the search boundary is explicit.

## 3. Verify documentation against reality

Treat each factual claim as a hypothesis. Verify relevant paths, scripts, package-manager commands, CLI fields, workspace boundaries, generated-file repair paths, symlink targets, and architecture claims against the repository or a safe live check. Use the repository's prescribed documentation lookup tool when external technical documentation is needed.

Use history and nearby examples when intent or ownership is unclear. For source-managed material, verify its provenance and declared refresh mechanism; route improvements through that mechanism or classify them as upstream work.

**Complete when:** every suspected defect and every proposed factual change has current evidence, while unverifiable claims are labeled as gaps rather than filled from memory.

## 4. Diagnose the merged stack

Apply every section of [`references/AUDIT-RUBRIC.md`](references/AUDIT-RUBRIC.md) to the guidance as an agent receives it: root plus the scoped instructions and routed contracts for every discovered scope.

Classify each candidate:

- **Keep** — correct, useful, well-scoped, and worth its context.
- **Add** — a verified missing invariant, gotcha, route, or repair path has meaningful leverage.
- **Repair** — useful intent has stale facts, vague wording, a broken command, or a missing discovery seam.
- **Narrow** — valid guidance belongs in a smaller scope.
- **Route** — useful detail belongs behind a precise pointer.
- **Merge** — multiple rules express one contract and need one source.
- **Remove** — obsolete, contradicted, or behaviorally inert.
- **Conflict** — applicable authorities disagree and project intent does not resolve the choice safely.
- **Upstream** — improvement belongs in a generated, vendored, locked, or externally maintained source.

Short repetition can be a deliberate scope anchor; retain it when automatic loading makes the constraint materially more reliable. A protected conflict is reported precisely and excluded from the edit set while unambiguous work continues.

**Complete when:** every candidate has evidence, ownership, a classification, and either a justified destination or a justified decision to leave it.

## 5. Choose a focused change set

Prioritize changes in this order:

1. Incorrect, stale, contradictory, unsafe, or undiscoverable guidance.
2. Always-loaded context that obscures higher-value instructions.
3. Vague direction that needs an actionable positive path.
4. Pure editorial preference, which normally stays unchanged.

Keep project-specific intent and required workflow semantics stable. Root guidance should carry repository-wide essentials and non-obvious gotchas; scoped documents should carry scope-specific invariants; branch-specific or volatile detail should sit behind precise pointers.

**Complete when:** each planned edit has a concrete behavioral benefit, a verified basis, and the narrowest appropriate owner and scope.

## 6. Execute the authorized mode

In **Audit-only** mode, leave the filesystem unchanged and turn the focused change set into an evidence-backed proposal.

In **Improve** or **Publish** mode, make the smallest coherent edits that realize the plan:

- Correct verified facts without changing the workflow they serve.
- Replace vague prohibitions with the desired action and its repair path; retain hard guardrails where safety or contract integrity requires them.
- Prefer stable capabilities and domain concepts over brittle file tours.
- Link to authoritative source, code, or generated output instead of copying volatile detail.
- Preserve one canonical source and use the repository's supported discovery mechanism—often a pointer, adapter, or symlink—for other consumers.
- Apply generated or source-managed changes through their owning source and refresh path; leave a precise upstream finding when that path is outside the task's authority.

**Complete when:** Audit-only has a complete proposal and unchanged filesystem; Improve or Publish has a diff containing only intended agent-documentation changes, protected semantics and user work remain intact, and each meaning has one source of truth.

## 7. Validate as a future agent

In Audit-only mode, re-check every proposed change and confirm the final filesystem status matches the initial status. In Improve or Publish mode, read every changed document end to end. Then re-read every merged instruction stack affected by the change or proposal; sample representative unaffected stacks and verify:

- Local links, anchors, paths, symlinks, and discovery entry points resolve.
- Commands and repair paths still work in their documented context.
- Scope and precedence are unambiguous, with no new contradiction or orphaned reference.
- Generated or source-managed integrity checks still pass.
- Repository formatting, documentation checks, and required validation gates pass, followed by `git diff --check` and a final status review.

Use an independent reviewer when available; otherwise perform a fresh rubric-based pass after setting the draft aside. Record exact blockers and unrun checks.

**Complete when:** every changed or proposed claim and route has been exercised or explicitly marked unverified, all applicable gates have a recorded result, and the final status matches the authorized mode and focused change set.

## 8. Report and publish if authorized

Lead with the outcome. Summarize:

- What changed or is proposed, and why it improves agent behavior.
- Important guidance deliberately retained, especially project-specific contracts.
- Conflicts, source gaps, or upstream work left unresolved.
- Validation performed, checks still pending, and whether hosted checks have settled or remain unknown.

A clean audit may produce no edits. For later runs, reassess the current repository and history rather than treating a prior audit as current truth. In **Publish** mode, follow the repository's publication guidance and perform only the requested commit, push, or review action after local validation. Record the branch, target base, resulting URL or state where applicable, and whether hosted checks are settled or pending.

**Complete when:** the user can distinguish verified improvements, intentional non-changes, unresolved boundaries, and validation status without relying on the hidden working notes, and any requested publication is complete or has an exact blocker.
