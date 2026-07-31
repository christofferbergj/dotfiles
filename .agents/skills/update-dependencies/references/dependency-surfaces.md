# Dependency Surface Inventory

This is the exhaustive reference for the `update-dependencies` sweep. Apply every section to every detected JavaScript or TypeScript package-manager root. Record a section as absent when its signals do not exist.

Exclude dependency directories, caches, build output, and vendored examples unless the repository deliberately owns dependency declarations inside them.

## Package graph

Account for:

- Root and workspace `package.json` files, including production, development, optional, and peer dependencies.
- The lockfile owned by the detected package manager.
- Workspace catalogs, constraints, overrides, resolutions, package extensions, aliases, and protocol specifiers.
- Patched dependencies and the commands or tests that prove each patch still applies.
- Nested package-manager roots that are intentionally independent of the root workspace.

Read the manager and version from repository declarations and the lockfile. Use that manager's installed help to select its recursive or workspace-aware outdated, audit, list, explanation, and targeted-update commands. Prefer machine-readable output when the installed version supports it. An Audit run may query registries but must not install, update, rewrite a lockfile, or run fix commands.

## Automation

Inspect tracked CI and automation configuration for external versioned references:

- GitHub workflow and composite-action `uses:` entries.
- Reusable workflows and external CI plugins, orbs, tasks, and setup actions.
- Bootstrap or release scripts that download a named tool version.

Local paths and repository-owned actions are not external dependencies. Preserve the repository's existing tag, full-version, commit-SHA, or digest style unless a policy change is explicitly in scope.

## Containers and development environments

Inspect:

- `FROM` declarations in tracked Dockerfiles.
- Image declarations in Compose, CI containers and services, deployment manifests, and development-container configuration.
- Versioned development-container features or templates.

When an image tag is derived from a package, runtime, or shared variable, account for it under that owning declaration instead of inventing a separate update. Preserve the repository's tag-versus-digest policy.

## Runtimes and package-manager toolchains

Reconcile linked declarations across:

- `packageManager`, `engines`, `devEngines`, Corepack, and Volta configuration.
- Mise, asdf, nvm, Node-version, and other local toolchain files.
- CI matrices, container base images, deployment configuration, and bootstrap scripts.

A newer runtime or package manager is a sensitive candidate, not an automatic update. All declarations selected for an upgrade move together; mismatched declarations are a policy conflict to resolve or hold.

## Security and supply-chain policy

Run the detected manager's read-only advisory command and inventory all reported severities. Apply the repository's documented remediation threshold. When no threshold exists, classify every reported advisory and record the missing threshold as a policy gap; severity alone does not authorize automatic remediation.

Inspect Renovate, Dependabot, package-manager, registry, and CI configuration for:

- Allowed, ignored, grouped, or scheduled updates.
- Range, pinning, lockfile, registry, and integrity policy.
- Security-specific exceptions and their expiry or rationale.

## Generated and source-managed surfaces

Identify generated contracts, vendored sources, provenance locks, and refresh scripts affected by dependency installation or validation. Use their owning refresh path when regeneration is part of the chosen update. Keep incidental generated changes outside the sweep and report upstream-owned migrations at their ownership boundary.

For a patched dependency, verify both patch application and the behavior that motivated the patch before retaining, rebasing, or removing it.

## Lint, format, and doctor stack

Detect the actual installed and imported stack rather than relying on a fixed package list:

- Ultracite and its selected backend.
- Oxlint, Oxfmt, ESLint, Prettier, Biome, and type-aware lint integrations.
- React Doctor and its lint integration.
- Loaded JavaScript lint plugins and shared workspace config packages.
- Root, shared, and scoped configuration files plus inline suppressions.

Any included change to this surface requires the `linting-alignment` handoff described in the main skill.

## Inventory reconciliation

Deduplicate dynamic or repeated declarations under their owner, but retain every consumer that must stay aligned. The inventory is complete only when each detected surface is represented by a ledger entry, linked to an owning entry, or explicitly recorded as absent.
