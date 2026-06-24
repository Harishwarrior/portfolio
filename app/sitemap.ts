import { MetadataRoute } from 'next'
import { WEBSITE_URL } from '@/lib/constants'

export const dynamic = 'force-static'

export default function sitemap(): MetadataRoute.Sitemap {
  return [
    {
      url: WEBSITE_URL,
      lastModified: '2026-06-24',
      changeFrequency: 'monthly',
      priority: 1.0,
    },
  ]
}
