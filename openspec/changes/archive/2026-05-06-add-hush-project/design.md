## Context

The portfolio site is a Next.js App Router project. All projects shown on the home page are sourced from a single typed array `PROJECTS` in `app/data.ts`. Each entry conforms to a `Project` type with fields `name`, `description`, `link`, optional `video`/`image`, an `id`, and a `category` of `'mobile' | 'package' | 'tool'`. The home page (`app/page.tsx`) iterates this array and renders cards generically, so adding a project is purely a data-level change.

This change is small in scope (one array append), but a brief design note is included to lock down the field-level decisions so implementation is unambiguous.

## Goals / Non-Goals

**Goals:**
- Surface the published Hush Android app on the portfolio with correct metadata.
- Match the structure, tone, and ordering conventions of existing mobile entries (TvStats, Rewardive, Namma Wallet, Thrifty Grocery).
- Keep the change reviewable as a single-file diff.

**Non-Goals:**
- No changes to the `Project` type, the rendering component, layout, or styling.
- No new asset pipeline, image hosting, or CMS integration.
- No detail page, case study, or blog post for Hush in this change.

## Decisions

- **Category = `'mobile'`.** Hush is a published Android app, so it belongs with the existing mobile entries. *Alternatives:* `'tool'` was considered but is reserved for developer tooling (Flutter Claude Skills, JankKiller).
- **`link` points to the Play Store listing** (`https://play.google.com/store/apps/details?id=com.harishanbalagan.hush`). *Alternatives:* a marketing site or GitHub repo — neither exists for Hush, and the Play Store page is the canonical, install-ready destination.
- **`id` follows the existing `projectN` sequence.** The next free identifier is `project5` (current mobile entries occupy `project1`–`project4`). *Alternative:* a semantic id like `hush` was considered but would diverge from the established numeric pattern used by every other mobile project entry.
- **Insertion order: prepend to the mobile group.** Listing Hush first among mobile projects highlights the newest published app, matching the implicit "latest first" order other portfolios follow. *Alternative:* appending preserves stable ordering but buries the newest work.
- **Image handling: omit `image` initially.** The `Project` type makes `image` optional, and existing entries (Rewardive, Thrifty Grocery) already render without media. A feature graphic can be added in a follow-up once a hosted asset URL is chosen. *Alternative:* embed a Play Store screenshot URL — Play Store image URLs are not stable contracts and risk breaking.
- **Description style.** Use a single sentence, present-tense, ≤ ~90 characters, mirroring the existing entries (e.g. "Discover all credit card, debit card, and bank offers in one place.").

## Risks / Trade-offs

- **Stale Play Store link** → Mitigation: the bundle id–based URL is the canonical Play Store format and remains valid for the app's lifetime; if the listing is unpublished the card simply 404s, which is acceptable and easy to spot.
- **Card renders without an image, looking sparser than image-rich cards** → Mitigation: this is already the case for two existing mobile entries, so visual consistency is preserved; a follow-up can add an image without schema changes.
- **Description accuracy** → Mitigation: the description should be drafted from the actual Play Store listing copy; the implementation task notes this so the implementer pulls the description from the live listing rather than inventing one.

## Migration Plan

Not applicable — this is a static content change with no runtime, data, or dependency migration. Rollback is a single revert of the `app/data.ts` edit.

## Open Questions

- Final wording of the `description` (drafted at implementation time from the Play Store listing).
- Whether to add a feature-graphic `image` now or defer to a follow-up.
