---
name: update-dependencies
description: Audit and update JavaScript and TypeScript dependency surfaces while preserving repository policy.
disable-model-invocation: true
---

# Update Dependencies

Treat dependency maintenance as a **sweep**: discover every version-bearing surface the repository owns, then account for each one before changing any.

Infer the authorization mode from the request:

- **Audit** — inventory and assess updates without changing files.
- **Improve** — the default; apply policy-compatible updates, validate them, and leave the result uncommitted.
- **Publish** — improve, then commit, push, or open a review only when the user explicitly requests that publication boundary.

Repository instructions, manifests, and maintenance configuration own project policy. This skill supplies the process around them. When applicable authorities disagree and current repository evidence does not resolve the conflict, hold the disputed update and continue with unambiguous work.

## 1. Establish the maintenance contract

Resolve the Git root, current branch, worktree status, and every package-manager root inside the repository. Read applicable `AGENTS.md` and equivalent instructions from broadest to narrowest scope, then follow their routes to dependency, security, release, CI, generated-code, and validation guidance.

For each package-manager root, identify the manager and version from its declaration and lockfile. Record workspace boundaries, required scripts, update automation, version-range policy, patched or generated artifacts, toolchain declarations, default branch, and publication rules. Use the repository's manager; a different globally available manager is not a substitute.

Preserve existing user changes as an explicit boundary. In Audit mode, every command in the run must be read-only.

**Complete when:** every JavaScript or TypeScript package-manager root has a governing policy and command source, every existing dirty file is included or excluded deliberately, and any unsupported or conflicting root is identified without blocking independent roots.

## 2. Inventory every detected surface

Read [`references/dependency-surfaces.md`](references/dependency-surfaces.md) completely, then apply every section to each package-manager root. Record absent surfaces as absent rather than silently skipping them.

Use the installed manager's current help before choosing its read-only outdated, audit, list, or explanation commands. Inspect all owned workspace manifests rather than relying only on the root summary. Resolve dynamic versions to the declaration that supplies them, and count that declaration once.

Maintain a working ledger with:

| Surface | Current | Eligible target | Risk | Policy or evidence | Decision |
| --- | --- | --- | --- | --- | --- |
| package, action, image, or toolchain | exact ref | exact ref or current | patch, minor, major, non-semver, security, or linked | repository or primary source | current, include, hold, or split |

Keep the ledger as working notes unless the user asks for an artifact.

**Complete when:** every detected package dependency, lockfile, external automation reference, static container reference, runtime or package-manager declaration, advisory, patch, and lint-stack dependency has one ledger entry or a documented owning source.

## 3. Decide the sweep

Classify candidates by semver distance when semver applies and by runtime, tooling, CI, toolchain, or security impact. Treat majors, non-comparable refs, runtime-sensitive libraries, security remediations, package-manager or runtime upgrades, and changes with migration instructions as sensitive.

Build the package-dependency candidate set from the installed package manager's workspace-aware resolution and treat that result as authoritative. For sensitive candidates in that set, use primary sources—official migration guides, changelogs, releases, package manifests, published source, and platform documentation—to assess compatibility. Use the repository's prescribed documentation lookup mechanism when one exists.

Give every candidate one outcome:

- **Include** — compatible with repository policy and safe to validate in this sweep.
- **Hold** — stays unchanged for a concrete compatibility, policy, or evidence gap.
- **Split** — needs a separately scoped migration and stays unchanged in this sweep.
- **Current** — already current, locally derived, or otherwise creates no update.

Treat linked declarations as one decision: runtime versions across local tooling and CI, package-manager pins across manifests and bootstrap files, and dynamically derived images across their source and consumer.

When an included update touches Ultracite, a lint or formatter backend, React Doctor, a loaded JavaScript lint plugin, or a shared lint-config package, invoke `linting-alignment` before changing lint configuration. If that skill is unavailable, preserve configuration and hold any update whose safety depends on a config migration.

**Complete when:** every candidate has an evidence-backed outcome, every sensitive include has a compatibility case, every hold or split has an exact reason, and every detected lint-stack change has completed or safely deferred its alignment handoff.

## 4. Apply included updates

In Audit mode, keep the worktree unchanged and continue to validation and reporting.

In Improve or Publish mode, update one coherent risk group at a time with the repository's package manager and inspect the diff between groups.

- A broad update command is allowed for a package-manager root only when every candidate it can select is **Include**.
- If any candidate is **Hold** or **Split**, use targeted selectors for every included update in that root. Do not run a broad update and repair held versions afterward.
- If the manager cannot exclude held candidates reliably, update included dependencies individually or hold the inseparable group.
- Preserve declared ranges, workspace and catalog protocols, aliases, overrides or resolutions, lockfile ownership, package-manager configuration, patches, automation pin style, and container tag-or-digest policy unless changing that policy is explicitly in scope.
- Apply runtime and package-manager upgrades only when the request or repository policy clearly includes them.
- Keep rejected probes and unrelated generated or source-managed changes out of the final diff.

After each group, confirm that every changed ref maps to an **Include** decision and every **Hold** or **Split** ref remains at its original value.

**Complete when:** manifests, lockfiles, automation refs, container refs, and selected toolchain declarations contain only included updates; all held and split candidates remain unchanged; and the diff contains no unrelated user or generated changes.

## 5. Validate the result

In Audit mode, run only repository-approved read-only checks. Skip installs, fix or formatting commands, generators, builds with owned output, and any validation entry point that can change the worktree; record each skipped gate and confirm the final filesystem status matches the initial status.

In Improve or Publish mode, run the repository's required install or lockfile-consistency check and its documented formatting, linting, type-checking, testing, build, generation, and validation gates that apply to the changed surfaces. In every mode, also:

- Run `git diff --check` in Git worktrees.
- Re-run the dependency inventory and reconcile every remaining outdated item with the ledger.
- Re-run the applicable security audit after a security remediation.
- Validate changed automation, container, patch, and generated-artifact surfaces with the repository's own tools or established checks.
- Run the validation required by `linting-alignment` when the lint stack changed.
- Inspect status again after validation because installs and generators may create additional changes.

When a check fails, establish whether the included update caused it. Fix the update, hold it, or split it; keep unrelated baseline failures out of the sweep and record their exact evidence. A blocked update is not publishable.

**Complete when:** Audit mode records the validation required for every proposed include and preserves the initial filesystem; Improve or Publish mode has every applied include passing its applicable gates or removed with an exact blocker; the final ledger matches the filesystem; and the worktree contains only authorized changes.

## 6. Report and publish only when requested

Lead with whether the repository was already current, was updated successfully, or remains blocked. Summarize included, held, and split candidates; sensitive-update evidence; changed surfaces; security findings; and each validation result. Distinguish pending hosted checks from failures.

Audit mode ends with an unchanged worktree. Improve mode ends with the validated changes uncommitted and unpublished.

In Publish mode, follow repository guidance and perform only the explicitly requested boundary:

- Stage and commit only the sweep's files when a commit is requested.
- Push only when a push is requested.
- Create or update a review only when one is requested, targeting the repository's discovered base branch and reporting the decision ledger and validation state.

Stop before publication when no changes remain or validation is blocked.

**Complete when:** the user can see the full accounted-for surface, every include/hold/split decision, the exact validation state, and either the requested publication result or the precise reason publication stopped.
