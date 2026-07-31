---
name: linting-alignment
description: Align repository lint and formatting policy with its owning presets. Use for shared configuration reviews and for upgrades involving Ultracite, Oxlint/Oxfmt, or React Doctor. Also use for evidence-based cleanup of plugins and local exceptions.
---

# Linting Alignment

Alignment is repository-policy-first: stay as close as current upstream behavior permits while preserving local rules that still protect a real project constraint. Treat configuration as an executable ownership graph, not a list of familiar package names.

Infer the authorized mode from the request:

- **Review** — inspect and report; leave the worktree unchanged.
- **Align** — inspect, make focused changes, and validate. This is the default when the user asks to update, fix, migrate, or configure the toolchain.
- **Publish** — align, then commit, push, or open a review only when the user explicitly requests that boundary.

## 1. Establish repository authority

Resolve the repository root, active branch, working-tree status, and applicable root and scoped agent instructions. Read the repository's code-style, contribution, dependency, generated-file, and validation guidance that governs the affected scope.

Identify existing user changes before running tools. Derive the package manager, workspace layout, supported runtimes, base branch, and requested publication boundary from repository evidence rather than convention.

**Complete when:** the governing policy, validation entry points, branch boundary, and every pre-existing dirty file are identified.

## 2. Build the ownership graph

Inventory the linting surface by following executable relationships:

- Package manifests, lockfiles, workspace declarations, and root or package scripts.
- Root and nested linter, formatter, analyzer, ignore, editor, hook, and CI configuration.
- Imports, `extends`, spreads, plugin declarations, CLI invocations, generated files, and package peer or optional dependencies.
- Inline disables and formatter ignores in first-party source.

For each discovered node, record its role and owner: orchestrator or preset, linter, formatter, native plugin, runtime-loaded plugin, standalone analyzer, type-aware companion, scoped config, or execution consumer. Follow imports into the installed package or published source until the effective preset, plugin membership, and configuration owner are known. Derive the package set from this graph; a familiar tool name is not proof that a package or rule is active.

Separate four execution lanes:

1. **Core lane** — formatter and linter commands.
2. **Plugin lane** — native or runtime-loaded rules executed by the linter.
3. **Analyzer lane** — standalone static-analysis CLIs whose project scans exceed plugin coverage.
4. **Type-aware lane** — semantic rules, compiler diagnostics, and their project-graph dependencies.

When the graph contains Ultracite, Oxlint, Oxfmt, React Doctor, or their integrations, read [`references/toolchain-ownership.md`](references/toolchain-ownership.md) completely before classifying any configuration as redundant.

**Complete when:** every configured command resolves through its configs and imports to installed owners, every nested scope and execution lane is accounted for, and duplicate or competing tools are distinguished from intentional complementary lanes.

## 3. Establish a comparable baseline

Before alignment edits, run the smallest repository-approved read-only commands that exercise every active lane in scope. Record exact commands, versions, exit codes, diagnostic counts or categories, and representative effective configuration. Prefer a tool's print-config, rule-list, debug, or file-list command when it proves which config and rules are active.

Keep the comparison controlled: same working tree, environment, targets, and flags before and after. If the toolchain change already exists in the worktree, construct the prior baseline from a fixed Git point in an isolated temporary worktree or another equally comparable artifact. Existing CI may serve only when its revision, command, and environment match. Label an unavailable baseline as a gap; do not call a diagnostic a regression without a comparison.

If a baseline command fails, isolate that failure from the requested change. The baseline is evidence, not permission to repair unrelated source.

**Complete when:** every active lane has a reproducible before-state or an exact comparison gap, and the same probes are ready for the after-state.

## 4. Verify the owning layer

For a current-version configuration review, inspect installed preset and package source. For an upgrade or migration, also inspect primary release notes, migration guides, package manifests, and official documentation for every changed graph node. Use the repository-prescribed documentation service when one exists.

Verify the facts that could change local leverage: preset membership, rule defaults, bundled versus external plugins, peer requirements, config merge and discovery semantics, ignore behavior, fixer behavior, type-aware requirements, supported file types, and stability guarantees.

Classify each upstream change as **include**, **no-op**, **hold**, **split**, or **follow-up**, with evidence. A semver-compatible release can still add diagnostics or formatting output, so release classification never replaces the baseline.

**Complete when:** the effective current behavior is proven and every in-scope upstream change has an evidence-backed disposition.

## 5. Decide local leverage

Classify every local preset layer, rule override, plugin, nested config, ignore pattern, suppression, duplicate command, and non-default formatter option as **keep**, **remove**, **narrow**, **source-fix**, **migrate**, or **defer**.

A change is directly warranted only by current evidence: verified upstream coverage, a live diagnostic, a broken resolution edge, conflicting execution, an obsolete dependency, an invalid scope, or an explicit repository-policy change. Keep deviations that still encode domain safety, framework behavior, generated-code boundaries, compatibility, performance, or a deliberate migration baseline.

Prefer a source fix when the rule is correct and the fix is smaller than the exception. Prefer the narrowest valid exception when the code is intentionally different. Preserve a standalone analyzer when its CLI covers work the plugin lane cannot, and preserve type-aware checks only with their runtime and project graph requirements intact.

**Complete when:** every changed or retained non-default choice has evidence, an owner, a lane, and a recorded disposition.

## 6. Probe, then apply

Probe one ownership edge or rule group at a time and rerun its focused baseline command. Use temporary worktrees or disposable copies for migrations and generator experiments; keep rejected probes out of the user's worktree.

In Review mode, keep every probe read-only, leave the worktree unchanged, and continue to comparison and reporting without applying dispositions.

Treat setup and initialization commands as generators until current source or a reviewed dry run proves they preserve custom configuration. When regeneration would replace repository-owned policy, edit the thin entry config directly or apply the generator's reviewed diff selectively.

Before simplifying config, prove its merge and discovery behavior. Preserve explicit ignore propagation when presets do not extend it. Preserve or add an explicit parent extension where the nearest nested config otherwise replaces the root. Account for flags that disable nested discovery and for paths resolved relative to the declaring config.

In Align or Publish mode, apply only the dispositions from step 5. Update policy documentation only when policy changed; release-note bookkeeping stays in the review or change record.

**Complete when:** the worktree contains only chosen changes, every modified graph edge resolves, and rejected experiments and incidental formatter churn are absent.

## 7. Compare and validate

Rerun the exact baseline probes with the same scope and environment. Compare effective config, exit status, diagnostics, formatting output, and relevant runtime cost lane by lane. Explain each difference from either the requested change or a verified upstream change.

In Review mode, use only repository-approved read-only checks and record mutation-capable gates as skipped. In Align or Publish mode, run the repository's required formatter, lint, type, test, and aggregate validation gates. Follow with `git diff --check` when Git is present. Review the final diff and verify that:

- Each dependency is required by a live graph edge.
- Each config and ignore applies at its intended scope.
- Plugin, analyzer, and type-aware lanes have not been mistaken for substitutes.
- Existing baseline failures remain isolated from the alignment.

Fix, hold, or split regressions caused by the alignment. Record exact blockers instead of broadening the change into unrelated cleanup.

**Complete when:** before and after are comparable, all differences are accounted for, required gates pass or have exact blockers, and the final diff matches the authorized scope.

## 8. Report at the requested boundary

Lead with the outcome. Summarize the ownership graph, directly warranted changes, important local policy retained, baseline comparison, validation results, held or deferred work, and any source or comparison gaps.

In Review mode, confirm the worktree is unchanged. In Align mode, stop before publication. In Publish mode, follow repository guidance and publish only the validated alignment files through the explicitly requested boundary; report pending hosted checks separately from failures.

**Complete when:** the user can see what owns the toolchain, why each local deviation changed or stayed, how the after-state compares with baseline, and the exact publication state.
