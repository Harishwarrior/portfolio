## ADDED Requirements

### Requirement: Hush app is listed as a mobile project

The portfolio's projects list SHALL include an entry for the Hush Android app so that visitors can discover and install it from the Google Play Store.

The entry MUST be exposed through the `PROJECTS` array consumed by the home page and MUST conform to the existing `Project` type used by all other entries.

#### Scenario: Hush entry is present in the projects data
- **WHEN** the `PROJECTS` array exported from `app/data.ts` is read
- **THEN** it contains exactly one entry whose `name` is `"Hush"`

#### Scenario: Hush entry uses the mobile category
- **WHEN** the Hush entry is inspected
- **THEN** its `category` field equals `"mobile"`

#### Scenario: Hush entry links to the Play Store listing
- **WHEN** the Hush entry is inspected
- **THEN** its `link` field equals `"https://play.google.com/store/apps/details?id=com.harishanbalagan.hush"`

#### Scenario: Hush entry has a unique non-empty id
- **WHEN** the Hush entry is inspected
- **THEN** its `id` field is a non-empty string that does not collide with the `id` of any other entry in `PROJECTS`

#### Scenario: Hush entry has a human-readable description
- **WHEN** the Hush entry is inspected
- **THEN** its `description` field is a non-empty single-sentence string describing what the app does

#### Scenario: Hush card renders on the home page
- **WHEN** the home page (`app/page.tsx`) is rendered
- **THEN** a project card for "Hush" is visible in the projects section and its primary action navigates to the Play Store link above

### Requirement: Project entries conform to a shared shape

Every entry in the `PROJECTS` array SHALL satisfy the `Project` TypeScript type so that the home page can render them generically without per-entry conditionals beyond the existing optional `image`/`video` handling.

#### Scenario: All entries type-check
- **WHEN** the project's TypeScript type checker runs against `app/data.ts`
- **THEN** every entry in `PROJECTS`, including the Hush entry, satisfies the `Project` type with no errors

#### Scenario: Category is one of the allowed values
- **WHEN** any entry's `category` field is inspected
- **THEN** its value is one of `"mobile"`, `"package"`, or `"tool"`
