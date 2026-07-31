# Ultracite and Oxc ownership

Read this reference only after discovering the repository's installed versions, entry configs, scripts, and imports. It records relationship invariants verified against primary sources on 2026-07-26; current installed source and official documentation remain authoritative.

## Ultracite is the preset and orchestrator

Ultracite supports multiple provider stacks. Detect the selected provider from the repository's entry config and command path instead of assuming that the presence of `ultracite` means Oxlint.

For its Oxlint provider, Ultracite normally creates two thin, repository-owned entry configs:

- An Oxlint config that imports the core preset plus selected framework or plugin presets.
- An Oxfmt config that spreads the Ultracite formatter preset.

The `ultracite check` and `ultracite fix` wrappers run Oxfmt and Oxlint as separate steps. Preserve that split when comparing direct tool commands with the wrapper.

The optional JavaScript-plugin preset is not part of the native core lane. Discover its current members from the installed `ultracite/oxlint/js-plugins` export and verify that each selected package is installed where the config can resolve it. Membership and defaults are versioned upstream facts, not a fixed agency package list.

Current Ultracite source regenerates existing Oxlint and Oxfmt entry configs during initialization. Its Oxlint update retains recognized Ultracite preset imports but can discard unrelated local config; its Oxfmt update rewrites the entry file. Inspect the installed generator source and test it away from the working tree before using initialization as an alignment tool.

Sources:

- [Ultracite Oxlint provider](https://www.ultracite.ai/docs/provider/oxlint)
- [Ultracite configuration](https://www.ultracite.ai/docs/configuration)
- [Ultracite monorepos](https://www.ultracite.ai/docs/monorepos)
- [Ultracite command source](https://github.com/haydenbleasel/ultracite/tree/main/packages/cli/src/commands)
- [Ultracite Oxlint generator](https://github.com/haydenbleasel/ultracite/blob/main/packages/cli/src/linters/oxlint.ts)
- [Ultracite Oxfmt generator](https://github.com/haydenbleasel/ultracite/blob/main/packages/cli/src/linters/oxfmt.ts)

## Oxlint owns lint configuration

Oxlint distinguishes native plugins from JavaScript plugins:

- `plugins` enables native rule groups. An explicit value changes the default plugin contribution, so inspect effective configuration before editing it.
- `jsPlugins` loads JavaScript packages or files through the ESLint-compatible bridge. Package resolution, aliases, and native-name collisions are part of the configuration contract.

JavaScript plugins and type-aware linting are explicitly outside Oxlint's semantic-versioning guarantees. Non-major upgrades can also produce new diagnostics: rule additions and default changes are non-breaking, while fixes can change rule behavior. Dependency alignment therefore needs behavioral comparison at every semver level.

Oxlint resolves the nearest root or nested config for each file. Child configs do not automatically merge with parents; they must extend a shared config explicitly when inheritance is intended. Passing an explicit config path disables nested lookup.

Oxlint `extends` currently carries rules, plugins, and overrides, not every top-level property. Ultracite's documented Oxlint entry config therefore copies `core.ignorePatterns` explicitly. That line is behavior, not redundant prose.

Type-aware linting is a separate lane with an additional companion, TypeScript program construction, root-only configuration options, and monorepo build or declaration requirements. Derive its current dependency and TypeScript compatibility from the installed versions and official docs.

Sources:

- [Oxlint configuration](https://oxc.rs/docs/guide/usage/linter/config.html)
- [Oxlint nested configs](https://oxc.rs/docs/guide/usage/linter/nested-config)
- [Oxlint built-in plugins](https://oxc.rs/docs/guide/usage/linter/plugins)
- [Oxlint JavaScript plugins](https://oxc.rs/docs/guide/usage/linter/js-plugins.html)
- [Oxlint type-aware linting](https://oxc.rs/docs/guide/usage/linter/type-aware)
- [Oxlint versioning](https://oxc.rs/docs/guide/usage/linter/versioning)

## Oxfmt owns formatting configuration

Oxfmt is a separate executable with its own entry config, supported languages, ignore rules, nested discovery, and output. Its nearest config wins for a file; an explicit config path disables nested discovery.

Config-scoped ignore patterns, Git ignores, and Prettier-compatible ignore files do not have identical scope or override behavior. Preserve the mechanism that matches repository intent, and verify representative generated, vendored, and workspace files before replacing one with another.

Formatter changes require a before-and-after diff even when the option or release is semver-compatible. Keep mechanical reformatting separate when it would hide a policy or dependency change.

Sources:

- [Oxfmt configuration](https://oxc.rs/docs/guide/usage/formatter/config.html)
- [Oxfmt ignore files](https://oxc.rs/docs/guide/usage/formatter/ignore-files)
- [Oxfmt language support](https://oxc.rs/docs/guide/usage/formatter/language-support)
- [Oxfmt unsupported features](https://oxc.rs/docs/guide/usage/formatter/unsupported-features)

## React Doctor has plugin and analyzer lanes

React Doctor's standalone CLI complements an existing lint setup. It combines lint diagnostics with project-level analysis such as dead-code, dependency, and security checks. Its standalone Oxlint plugin exposes rules inside the linter, but project-level scan rules do not run through that plugin.

Discover whether the repository uses the CLI, the plugin, both, or neither. Compare their configured severities, ignores, scopes, and CI behavior without assuming that one replaces the other. The CLI has its own `doctor.config.*` or `package.json` configuration and monorepo project selection.

Current React Doctor documentation promises adoption of existing JSON ESLint and Oxlint configs. It does not promise equivalent adoption of TypeScript Oxlint entry configs, which Ultracite commonly generates. Verify the effective rules instead of assuming those two policy surfaces are aligned.

Sources:

- [React Doctor overview](https://www.react.doctor/docs)
- [React Doctor config files](https://www.react.doctor/docs/configuration/config-files)
- [React Doctor ESLint and Oxlint plugins](https://www.react.doctor/docs/configuration/eslint-and-oxlint-plugins)
- [React Doctor CLI reference](https://www.react.doctor/docs/reference/cli-reference)
