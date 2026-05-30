# AGENTS.md

This file provides guidance to Codex (Codex.ai/code) when working with code in this repository.

## Commands

- `npm run dev` — Next.js dev server at http://localhost:3000
- `npm run build` — produces a static export (writes to `out/`)
- `npm run start` — serves a built app
- `npm run lint` — ESLint (Next + Prettier rules)

There is no test suite. Biome is configured (`biome.json`) but not wired to an npm script; ESLint + Prettier is the active formatting/lint path.

## Architecture

This is a **Next.js 16.1.5 App Router** static site (`next.config.mjs` sets `output: 'export'`), forked from the [`nim`](https://github.com/ibelick/nim) template. Treat it as a content-driven portfolio, not a dynamic app — there are no API routes, no server actions, and no runtime backend.

Implications of static export:
- `images: { unoptimized: true }` — use plain `<img>` tags, not `next/image`. Existing components already do this.
- All routes must be statically renderable. Don't introduce dynamic segments without `generateStaticParams`, request-time data fetching, or middleware.
- Assets in `public/` are served at the site root (e.g. `public/hush.png` → `/hush.png`).

### Content model

Almost all displayed content is centralized in **`app/data.ts`**, which exports typed arrays:
- `PROJECTS` — categorized as `mobile | package | tool`. Filter pills on the home page key off `category`. Each project may have an `image` or `video`; if neither, `ProjectMedia` renders a "No Preview" placeholder.
- `WORK_EXPERIENCE` — rendered in chronological order as authored (newest first).
- `BLOG_POSTS` — these are the *cards* shown on the home page. The actual article bodies live as MDX files at `app/blog/<slug>/page.mdx`. Adding a post requires editing both: the MDX file for the page, and `BLOG_POSTS` for the home-page card.
- `SOCIAL_LINKS` / `EMAIL` — social links also need a matching SVG case in the `SocialIcon` switch in `app/header.tsx`; an unknown label silently renders no icon.

### Page composition

- `app/layout.tsx` wraps every route with `Header` (top) and `Footer` (bottom) plus a `ThemeProvider` (next-themes). Routes only render their main content.
- `app/page.tsx` is the home page: an animated photo carousel, then projects / articles / experience / connect sections. It's a client component (`'use client'`) because of motion + interactive filter state.
- `app/header.tsx` contains the bio paragraphs and a `totalExperience(year, month)` helper that computes years/months live from the current date — keep using it instead of hardcoding durations.
- `mdx-components.tsx` customizes MDX rendering for blog posts (typography, code highlighting via `sugar-high`).

### UI primitives

`components/ui/` holds the reusable motion-primitives (e.g. `MorphingDialog`, `Spotlight`, `TextEffect`). These are template-provided animation components — prefer composing them over rolling new motion logic. `lib/utils.ts` exposes the standard `cn()` (clsx + tailwind-merge) helper.

### Styling

Tailwind CSS v4 via `@tailwindcss/postcss` — there is no `tailwind.config.{js,ts}`. Configuration (theme tokens, custom utilities) lives in `app/globals.css` using v4's CSS-first directives. Dark mode is class-based, toggled by next-themes.
