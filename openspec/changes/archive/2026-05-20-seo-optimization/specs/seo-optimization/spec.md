## ADDED Requirements

### Requirement: Canonical Domain Alignment
The website MUST define a unified and consistent production canonical domain across all environment variables, metadata configurations, and robots.txt sitemap references.

#### Scenario: Canonical domain lookup
- **WHEN** the system builds and reads constants, layout metadata, or robots.txt rules
- **THEN** it SHALL resolve all instances of the site URL to the official domain "https://harishanbalagan.com"

### Requirement: Open Graph and Twitter Rich Media Metadata
The website root layout metadata MUST define comprehensive Open Graph and Twitter Card meta elements, enabling standard visual preview cards upon URL sharing.

#### Scenario: Rich media sharing card rendering
- **WHEN** a client or social crawler fetches the root page HTML
- **THEN** it SHALL display Open Graph tags (type, locale, url, siteName, images, title, description) and Twitter tags (card, site, creator, images, title, description) pointing to the official cover image asset.

### Requirement: Semantic HTML Heading Hierarchy
The main pages MUST implement a semantically correct HTML heading hierarchy where a single, unique `<h1>` element is used for the author's primary name identity, and `<h2>` elements are used for top-level layout sections.

#### Scenario: Home page semantic header rendering
- **WHEN** the home page is rendered in the DOM
- **THEN** the brand/name "Harish" in the header SHALL be wrapped inside an `<h1>` tag, and the section headings ("My works", "Articles", "Work Experience", "Connect") SHALL be wrapped in `<h2>` tags, preserving their original typography styling.

### Requirement: Statically Exported XML Sitemap
The application MUST automate sitemap mapping during static builds, exporting a fully valid `sitemap.xml` file at the root.

#### Scenario: Automated sitemap build
- **WHEN** the project runs `npm run build` to output the static files
- **THEN** it SHALL produce a valid `sitemap.xml` listing the canonical URL with priority 1.0.

### Requirement: Structured JSON-LD Schema Integration
The homepage MUST integrate custom JSON-LD schema-structured data scripts to present structured details about the author, their job title, employer, email, and social networks directly to search crawlers.

#### Scenario: JSON-LD script inclusion
- **WHEN** the homepage is loaded in a client or search crawler browser
- **THEN** the DOM SHALL contain an inline `<script type="application/ld+json">` element encoding the correct Person schema.
