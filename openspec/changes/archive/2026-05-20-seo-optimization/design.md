## Context

The portfolio website is a personal presentation showcasing professional accomplishments. It uses Next.js 15, React 19, Tailwind CSS v4, and standard static site export (`output: 'export'`). Currently, the site lacks key SEO foundations:
1. There is a canonical base URL mismatch between `app/layout.tsx` and `lib/constants.ts` (the latter pointing to Vercel staging instead of the custom domain).
2. It lacks dynamic sitemap generation, missing the sitemap mapping file entirely.
3. It has no JSON-LD structured schema script.
4. It lacks Open Graph (OG) and Twitter Card rich sharing metadata.
5. Heading tags skip `<h1>` and `<h2>` elements completely, degrading accessibility and search engine outline clarity.

## Goals / Non-Goals

**Goals:**
- Unify the canonical address across all files to "https://harishanbalagan.com".
- Implement standard Open Graph and Twitter Card tags in `app/layout.tsx`.
- Adjust page structure semantics: use `<h1>` for the primary name identity in `app/header.tsx` and `<h2>` for top-level page sections in `app/page.tsx` while keeping identical visual styling.
- Automate sitemap mapping under static export via standard `app/sitemap.ts`.
- Embed rich Person-type structured JSON-LD schemas inside the main homepage.

**Non-Goals:**
- Creating internal dynamic blog rendering routes or post parsing mechanisms (blog links remain external redirects as defined in `app/data.ts`).
- Altering visual aesthetics, typography parameters, or adding user interfaces.
- Integrating external server-side database dependencies or server rendering features.

## Decisions

### Decision 1: Direct Inline JSON-LD Schema Tag Injection
- **Rationale:** Injecting a raw `<script type="application/ld+json">` element containing a JSON-encoded schema directly inside `app/page.tsx` ensures optimal pre-rendering during static exports. Search crawlers can parse it instantly without executing deferred Javascript.
- **Alternatives Considered:** External JSON-LD script loading or custom metadata integration, which are overly complex for a single-page static profile.

### Decision 2: Heading Semantic Elevation (Strict Hierarchy)
- **Rationale:** Upgrading the primary name identity to `<h1>` and top-level sections to `<h2>` (while retaining the exact Tailwind styles) builds a perfect, logical document outline. Google indexing highly prioritizes semantic heading flows over skipped tags.
- **Alternatives Considered:** Using hidden/screen-reader-only `<h1>` tags, which is less accessible and can occasionally be flagged as search manipulation by search bots.

### Decision 3: App Router Dynamic Sitemap (`app/sitemap.ts`)
- **Rationale:** Using the built-in Next.js `app/sitemap.ts` module with `export const dynamic = 'force-static'` is native, requires zero external packages, and builds seamlessly alongside other static files.
- **Alternatives Considered:** Custom shell scripting post-build or third-party sitemap generators, which require maintenance and are vulnerable to breaking during minor framework updates.

## Risks / Trade-offs

### Risk 1: Layout Shifts (CLS) or Animation Glitches due to Tag Changes
- **Mitigation:** Upgrade heading elements strictly on the semantic tag level (e.g., `<h3 className="text-lg">` to `<h2 className="text-lg">`) to keep CSS selectors, spacing parameters, and Framer Motion spring transitions unchanged.

### Risk 2: Indexing of Staging Vercel URLs
- **Mitigation:** Ensure that `lib/constants.ts` website constant, `layout.tsx` canonical link, and `app/sitemap.ts` output strictly point to the production canonical domain "https://harishanbalagan.com".
