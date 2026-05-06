## Why

Hush is a published Android app by the portfolio owner (live on Google Play under the bundle id `com.harishanbalagan.hush`) that is not currently represented on the portfolio site. Adding it keeps the projects list current and gives visitors a way to discover and install the app from the Play Store.

## What Changes

- Add a new `Project` entry for **Hush** to the `PROJECTS` array in `app/data.ts`.
  - `link` points to the Play Store listing: `https://play.google.com/store/apps/details?id=com.harishanbalagan.hush`.
  - `category` is `'mobile'` (consistent with TvStats, Rewardive, Namma Wallet, Thrifty Grocery).
  - `id` continues the existing `projectN` numbering (next free slot, e.g. `project5`).
  - Include a short, single-sentence `description` matching the tone of the other entries.
  - Optionally include an `image` once a representative screenshot/feature graphic is available; otherwise omit (the existing `Rewardive` and `Thrifty Grocery` entries already render without media).

## Capabilities

### New Capabilities
- `portfolio-projects`: Defines which projects must appear in the portfolio's projects list and the required shape of each entry. Introduced now to formally capture the requirement that the Hush app must be listed.

### Modified Capabilities
<!-- None — openspec/specs/ is currently empty, so there is no existing capability to modify. -->


## Impact

- **Code**: `app/data.ts` (single array append).
- **Rendering**: The home page projects section (`app/page.tsx`) already iterates over `PROJECTS`, so the new card appears with no template changes.
- **APIs / dependencies**: None.
- **External**: Adds an outbound link to the Play Store; no third-party SDKs or integrations introduced.
