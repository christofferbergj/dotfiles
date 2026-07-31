# Agent Documentation Audit Rubric

Use this rubric during diagnosis and again during the final read-through. It is a decision aid, not a replacement for repository authority: project-specific intent wins over generic advice when that intent is clear and safe.

## Authority and contract integrity

- Trace each instruction to an owner, scope, consumer, and source of truth.
- Read the effective stack in precedence order instead of reviewing files in isolation.
- Treat setup outputs, label vocabularies, issue workflows, domain routing, generated instructions, and skill-consumed documents as interfaces.
- Preserve exact values and repeated constraints when consumers depend on them.
- Resolve a conflict from repository evidence only when ownership and intent are clear. Otherwise classify it as **Conflict**, quote both requirements, describe the consequence, and keep it out of the edit set.

The governing test is: “Would this change preserve every load-bearing project behavior while making the effective stack more accurate or useful?”

## Correctness and freshness

Check that:

- Commands exist, accept the documented flags or output fields, and run from the stated directory.
- Paths, package names, workspaces, owners, and architecture descriptions match the current repository.
- Generated-file instructions point to the generator and the editable source, not merely to a prohibition.
- External service or repository-state claims are checked live when safe and relevant.
- Examples still demonstrate the intended workflow rather than a superseded one.
- History explains surprising guidance that may encode a deliberate decision.

Prefer verified absence to invented detail. If a source, environment, or live check is unavailable, state what could not be established and narrow the edit accordingly.

## Context value and progressive disclosure

Agent context is an instruction budget. Give always-loaded guidance only the facts and decisions that repay that cost.

### Root guidance

A useful root entry point usually contains:

- A one-line repository purpose.
- The actual package manager or primary toolchain.
- Non-standard setup, formatting, validation, and test commands.
- Repository-wide constraints and non-obvious gotchas.
- Precise routes to deeper guidance.

Route prose filesystem tours, facts obvious from manifests, and branch-specific procedures to their current sources or narrower documentation.

### Scoped guidance

Place an instruction in a nested scope when it applies throughout that scope and would distract elsewhere. Favor stable capabilities, boundaries, and domain concepts over volatile inventories of files. Retain a short root-level pointer when agents need to discover the scoped material.

### Routed reference

Move detailed procedures, lookup tables, examples, and volatile reference material behind a pointer whose wording tells the agent exactly when to read it. Keep a required rule inline when routing would make compliance unreliable. Prefer authoritative source or code links over prose that merely mirrors them.

Progressive disclosure is successful when the common path stays legible and every specialized path remains discoverable at the moment it becomes relevant.

## Usefulness and actionability

Every retained instruction should change likely agent behavior. Look for:

- A concrete trigger, decision, command, invariant, or completion condition.
- Enough context to select the right branch without guessing.
- A positive target: what the agent should do and where it should repair a problem.
- Exact hard guardrails only where safety, data integrity, or workflow contracts require them.
- Rich repository references that let the agent inspect current truth.

Vague encouragement, generic software advice, obvious filesystem facts, and large example sets often consume attention without changing behavior. Repair, route, merge, or remove them unless repository evidence shows they are load-bearing.

## Internal consistency and scope

Compare guidance as merged for representative work:

- Root plus each scoped `AGENTS.md` or equivalent.
- Agent entry point plus every required routed document.
- Skill trigger plus its steps, references, and repository setup contract.
- Canonical instruction plus each ecosystem-specific discovery adapter.

Check terminology, commands, precedence, ownership, and completion criteria. Apparent duplication is justified when a short constraint must be automatically loaded in multiple independent scopes; duplicated explanations and mutable facts should have one source.

## Skills and discovery

When the repository includes skills:

- Verify the trigger or manual invocation matches how the skill is actually used.
- When a skill has a correctness-critical common sequence, keep its steps and checkable completion criteria in the entry point. Reference-only and router skills may remain sequence-free; disclose branch-specific reference behind precise pointers.
- Check every linked resource and command in its documented working directory.
- Verify each intended agent ecosystem can discover the canonical skill through the repository's chosen mechanism.
- Distinguish repository-owned skills from locked, vendored, generated, or upstream-owned skills before editing.

Use the declared installation, refresh, or publication workflow for source-managed material. An upstream report is a successful boundary outcome when the local repository is not the owner.

## Judgment for capable agents

Prefer a small set of durable interfaces over a dense web of rigid rules. State the invariant and let the agent exercise judgment inside it. Long examples, exhaustive prohibitions, and historical workarounds need current evidence to remain.

Keep safety boundaries, release policy, ownership seams, and workflow contracts explicit when they protect real behavior.

## Decision quality

Grade a proposed change with these questions:

1. **Evidence:** What current repository or live evidence supports it?
2. **Behavior:** Which likely agent action becomes more correct?
3. **Scope:** Is this the narrowest place that reliably carries the rule?
4. **Authority:** Who owns the content and how is it meant to change?
5. **Consistency:** What other instruction stacks or consumers does it affect?
6. **Durability:** Will it survive ordinary repository evolution?
7. **Discoverability:** Can the intended agent reach it at the right time?
8. **Verification:** How will the changed route or claim be exercised?

An edit earns its place only when these answers are concrete. A style-only rewrite, speculative cleanup, or unresolved ownership change stays out.

## Source boundary

This rubric is a synthesis, not a copy, of source material read during the session that created the skill:

- [The new rules of context engineering for Claude 5 models](https://x.com/trq212/article/2080710971228918066) — fewer overconstraints for capable models, interface-oriented instructions, lean roots, progressive disclosure, and source-rich references.
- [A Complete Guide To AGENTS.md](https://www.aihero.dev/a-complete-guide-to-agents-md) — instruction-budget discipline, minimal universal roots, scoped monorepo guidance, stable concepts, and active removal of stale or contradictory instructions.
- The repository audit from the same session — live command verification, workflow documents as contracts, protected conflict reporting, source-managed boundaries, discovery adapters, justified scoped repetition, and positive repair paths.
- [`writing-great-skills`](../writing-great-skills/SKILL.md) — predictable process, checkable completion criteria, information hierarchy, single-source discipline, no-op pruning, and positive steering.

Future audits should use this packaged synthesis unless the user asks for a fresh source review. If a requested source cannot be accessed, report the exact gap and avoid attributing unverified ideas to it.
