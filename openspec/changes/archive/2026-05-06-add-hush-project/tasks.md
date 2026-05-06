## 1. Draft the Hush entry

- [x] 1.1 Open the live Play Store listing at `https://play.google.com/store/apps/details?id=com.harishanbalagan.hush` and copy a single-sentence, present-tense description (≤ ~90 chars) that mirrors the tone of existing entries in `app/data.ts`.
- [x] 1.2 Confirm the next free `id` for a mobile project by scanning `PROJECTS` in `app/data.ts` (existing mobile ids are `project1`–`project4`, so use `project5`).
- [x] 1.3 Decide whether to include an `image` URL in this change; if no stable hosted asset is available, omit the field (consistent with the existing `Rewardive` and `Thrifty Grocery` entries) and leave a follow-up note.

## 2. Update the projects data

- [x] 2.1 In `app/data.ts`, prepend a new `Project` entry to the `PROJECTS` array with: `name: 'Hush'`, the description from 1.1, `link: 'https://play.google.com/store/apps/details?id=com.harishanbalagan.hush'`, `id` from 1.2, and `category: 'mobile'`.
- [x] 2.2 If 1.3 produced a hosted image URL, add it as the optional `image` field on the new entry; otherwise leave the field off entirely (do not set an empty string).
- [x] 2.3 Verify the file still satisfies the `Project` type and that no other entry's `id` collides with the new one.

## 3. Verify rendering

- [x] 3.1 Run the project's type check / lint (`npm run lint` or equivalent from `package.json`) and ensure it passes.
- [ ] 3.2 Start the dev server (`npm run dev`) and load the home page in a browser.
- [ ] 3.3 Confirm the Hush card renders in the projects section, its title reads "Hush", and clicking the card opens the Play Store URL.
- [ ] 3.4 Confirm no existing project card has visually regressed (ordering, spacing, image/video rendering for entries that have those fields).

## 4. Wrap up

- [ ] 4.1 Commit the change to `app/data.ts` with a message in the repo's existing convention (recent commits use prefixes like `refactor:` / `feat:` — use `feat: add Hush app to projects`).
- [ ] 4.2 Open a PR (or push to the working branch) following the repo's existing flow; no additional review checklist required since the diff is a single data append.
