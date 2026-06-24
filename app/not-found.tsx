import Link from 'next/link'

export default function NotFound() {
  return (
    <main className="mx-auto flex min-h-[60vh] max-w-screen-sm flex-col items-center justify-center px-4 text-center">
      <h2 className="text-6xl font-bold text-zinc-900 dark:text-zinc-100">
        404
      </h2>
      <p className="mt-4 text-lg text-zinc-600 dark:text-zinc-400">
        This page could not be found.
      </p>
      <Link
        href="/"
        className="mt-8 rounded-full bg-zinc-900 px-6 py-2.5 text-sm font-medium text-white transition-colors hover:bg-zinc-700 dark:bg-zinc-100 dark:text-zinc-900 dark:hover:bg-zinc-300"
      >
        Back to Home
      </Link>
    </main>
  )
}
