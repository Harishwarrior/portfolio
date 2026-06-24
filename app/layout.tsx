import type { Metadata, Viewport } from 'next'
import { Geist, Geist_Mono } from 'next/font/google'
import './globals.css'
import { Header } from './header'
import { Footer } from './footer'
import { ThemeProvider } from 'next-themes'

import { WEBSITE_DESCRIPTION, WEBSITE_URL } from '@/lib/constants'

export const viewport: Viewport = {
  width: 'device-width',
  initialScale: 1,
  themeColor: '#ffffff',
}

export const metadata: Metadata = {
  metadataBase: new URL(WEBSITE_URL),
  alternates: {
    canonical: WEBSITE_URL,
  },
  title: {
    default: 'Harish - Flutter Developer',
    template: '%s | Harish',
  },
  description: WEBSITE_DESCRIPTION,
  keywords: [
    'Flutter',
    'Flutter Developer',
    'Mobile Developer',
    'iOS Developer',
    'Android Developer',
    'Software Engineer',
    'Chennai',
    'Hush Notification Manager',
    'TvStats',
    'Rewardive',
    'Namma Wallet',
    'JankKiller',
  ],
  openGraph: {
    title: 'Harish - Flutter Developer',
    description:
      'Tech enthusiast from Chennai, India. Software Engineer specializing in Flutter development, mobile apps, and custom developer tools.',
    url: WEBSITE_URL,
    siteName: 'Harish Portfolio',
    images: [
      {
        url: '/cover.jpg',
        width: 1200,
        height: 630,
        alt: 'Harish Portfolio Cover',
      },
    ],
    locale: 'en_US',
    type: 'website',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Harish - Flutter Developer',
    description:
      'Tech enthusiast from Chennai, India. Software Engineer specializing in Flutter development, mobile apps, and custom developer tools.',
    site: '@theflutterboi',
    creator: '@theflutterboi',
    images: ['/cover.jpg'],
  },
}

const geist = Geist({
  variable: '--font-geist',
  subsets: ['latin'],
})

const geistMono = Geist_Mono({
  variable: '--font-geist-mono',
  subsets: ['latin'],
})

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body
        className={`${geist.variable} ${geistMono.variable} bg-white tracking-tight antialiased dark:bg-zinc-950`}
      >
        <ThemeProvider
          enableSystem={true}
          attribute="class"
          storageKey="theme"
          defaultTheme="system"
        >
          <div className="flex min-h-screen w-full flex-col font-[family-name:var(--font-geist)]">
            <div className="relative mx-auto w-full max-w-screen-sm px-4 pt-20">
              <Header />
            </div>
            <div className="flex-1">{children}</div>
            <div className="relative mx-auto w-full max-w-screen-sm px-4">
              <Footer />
            </div>
          </div>
        </ThemeProvider>
      </body>
    </html>
  )
}
