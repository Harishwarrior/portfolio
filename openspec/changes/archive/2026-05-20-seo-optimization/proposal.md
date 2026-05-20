## Why

The portfolio website currently lacks key search engine optimization (SEO) configurations, including Open Graph/Twitter meta tags, a proper semantic HTML heading hierarchy, a dynamically generated sitemap, and rich JSON-LD structured schema data. These omissions limit the site's visibility, search ranking, social media preview aesthetics, and indexing performance on search engines like Google. Implementing these improvements now will establish a robust SEO foundation, unify canonical domains, and enable premium-quality visual preview cards when the site is shared.

## What Changes

- **Metadata Enrichment**: Add standard Open Graph (OG) and Twitter Card configurations in the root layout (`app/layout.tsx`) utilizing the existing `cover.jpg` preview asset.
- **Canonical Consistency**: Unify and align canonical URLs across `lib/constants.ts`, `app/layout.tsx`, and `app/robots.ts` to point to the production domain `https://harishanbalagan.com`.
- **Semantic HTML Hierarchy**: Realign heading elements to build a correct semantic hierarchy—introducing `<h1>` for the primary author identity in `app/header.tsx` and promoting top-level section headings on the homepage to `<h2>` in `app/page.tsx` while keeping Tailwind styles intact.
- **Automated Sitemap**: Create a new dynamic, statically-exportable sitemap generator module (`app/sitemap.ts`) to automate site mapping during export.
- **Structured Schema (JSON-LD)**: Integrate customized `Person` and `ProfilePage` JSON-LD schema-structured data scripts inside the homepage (`app/page.tsx`) to enable rich snippets in Google searches.

## Capabilities

### New Capabilities
- `seo-optimization`: Implements root meta tags, Open Graph/Twitter visual previews, proper semantic HTML structure, automated sitemap mapping, and JSON-LD schema structured profiles.

### Modified Capabilities
<!-- None. No existing spec requirements are changed. -->

## Impact

- `app/layout.tsx`: Modifying root metadata config to add keywords, Open Graph, and Twitter metadata.
- `app/header.tsx`: Wrapping the primary name in a semantically valid `<h1>` heading.
- `app/page.tsx`: Converting root section titles (`My works`, `Articles`, `Work Experience`, `Connect`) to `<h2>` headings, and injecting the JSON-LD schema script.
- `lib/constants.ts`: Updating `WEBSITE_URL` to match the official canonical domain (`https://harishanbalagan.com`).
- `app/sitemap.ts`: Defining a new static sitemap generator.
- `openspec/specs/seo-optimization/spec.md`: Creating the specification details for this capability.
