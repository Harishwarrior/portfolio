## 1. Canonical Base Realignment

- [x] 1.1 Update the production domain constant `WEBSITE_URL` in `lib/constants.ts` to "https://harishanbalagan.com"
- [x] 1.2 Confirm canonical URL resolution alignment inside `app/layout.tsx` and `app/robots.ts`

## 2. Root Layout Metadata Extension

- [x] 2.1 Add descriptive keywords array inside the root metadata configuration in `app/layout.tsx`
- [x] 2.2 Implement robust Open Graph (`openGraph`) metadata properties targeting site name, canonical URL, and preview imagery in `app/layout.tsx`
- [x] 2.3 Implement standard Twitter Card (`twitter`) metadata parameters including summaries, creator handle, and cover image path in `app/layout.tsx`

## 3. Semantic Heading Hierarchy Alignment

- [x] 3.1 Wrap the main name link "Harish" inside an `<h1>` tag inside the Header component `app/header.tsx`, preserving original CSS styles
- [x] 3.2 Upgrade root homepage section headings (*My works*, *Articles*, *Work Experience*, *Connect*) from `<h3>` to `<h2>` inside `app/page.tsx`, keeping styling consistent

## 4. Static Sitemap Generation

- [x] 4.1 Create native sitemap generator `app/sitemap.ts` implementing the dynamic force-static parameter
- [x] 4.2 Validate sitemap compilation coordinates matching the official canonical site root

## 5. Rich Search Snippet Schema Integration

- [x] 5.1 Define comprehensive Person and ProfilePage typed JSON-LD structured data mapping all relevant details in `app/page.tsx`
- [x] 5.2 Inject custom JSON-LD schema structure as an inline script tag directly in the homepage component layout

## 6. Verification and Audit

- [x] 6.1 Run local production compiler `npm run build` to verify standard static file outputs compile cleanly
- [x] 6.2 Confirm correct generation of sitemap metadata (`sitemap.xml` and `robots.txt`) in build directory
