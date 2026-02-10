'use client'

import { cn } from '@/lib/utils'

interface PhoneMockupProps {
  children: React.ReactNode
  className?: string
}

export function PhoneMockup({ children, className }: PhoneMockupProps) {
  return (
    <div className={cn('relative mx-auto w-full max-w-[280px]', className)}>
      {/* Outer Frame */}
      <div className="relative aspect-[9/19.5] w-full rounded-[3rem] border-8 border-zinc-900 bg-zinc-900 p-1.5 ring-1 shadow-2xl ring-zinc-800">
        {/* Antenna lines */}
        <div className="absolute top-16 -left-2 h-10 w-0.5 bg-zinc-800" />
        <div className="absolute top-32 -left-2 h-10 w-0.5 bg-zinc-800" />
        <div className="absolute top-16 -right-2 h-10 w-0.5 bg-zinc-800" />
        <div className="absolute top-32 -right-2 h-10 w-0.5 bg-zinc-800" />

        {/* Dynamic Island */}
        <div className="absolute top-4 left-1/2 z-20 h-6 w-24 -translate-x-1/2 rounded-full bg-black shadow-inner" />

        {/* Time and Status Bar Mock */}
        <div className="absolute top-4 left-0 z-10 flex w-full justify-between px-8 text-[10px] font-semibold text-white/90">
          <span>9:41</span>
          <div className="flex gap-1">
            <div className="h-2 w-2 rounded-full border-[1.5px] border-white/90" />
            <div className="h-2 w-3 rounded-sm bg-white/90" />
          </div>
        </div>

        {/* Screen Content */}
        <div className="relative h-full w-full overflow-hidden rounded-[2.2rem] bg-white dark:bg-zinc-950">
          {children}
        </div>
      </div>
    </div>
  )
}
