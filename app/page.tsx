'use client'
import { useState } from 'react'
import { motion } from 'motion/react'
import { XIcon } from 'lucide-react'
import { Spotlight } from '@/components/ui/spotlight'
import {
  MorphingDialog,
  MorphingDialogTrigger,
  MorphingDialogContent,
  MorphingDialogClose,
  MorphingDialogContainer,
} from '@/components/ui/morphing-dialog'
import Link from 'next/link'
import {
  PROJECTS,
  WORK_EXPERIENCE,
  BLOG_POSTS,
  EMAIL,
} from './data'

const VARIANTS_CONTAINER = {
  hidden: { opacity: 0 },
  visible: {
    opacity: 1,
    transition: {
      staggerChildren: 0.15,
    },
  },
}

const VARIANTS_SECTION = {
  hidden: { opacity: 0, y: 20, filter: 'blur(8px)' },
  visible: { opacity: 1, y: 0, filter: 'blur(0px)' },
}

const TRANSITION_SECTION = {
  duration: 0.3,
}

type ProjectMediaProps = {
  video?: string
  image?: string
}

function ProjectMedia({ video, image }: ProjectMediaProps) {
  if (!video && !image) {
    return (
      <div className="aspect-video w-full rounded-xl bg-zinc-100 dark:bg-zinc-800 flex items-center justify-center text-zinc-400">
        No Preview
      </div>
    )
  }

  if (image && !video) {
    return (
      <MorphingDialog
        transition={{
          type: 'spring',
          bounce: 0,
          duration: 0.3,
        }}
      >
        <MorphingDialogTrigger>
          <img
            src={image}
            alt=""
            className="aspect-video w-full cursor-zoom-in rounded-xl object-cover"
          />
        </MorphingDialogTrigger>
        <MorphingDialogContainer>
          <MorphingDialogContent
            key="content"
            className="relative aspect-video rounded-2xl bg-zinc-50 p-1 ring-1 ring-zinc-200/50 ring-inset dark:bg-zinc-950 dark:ring-zinc-800/50"
          >
            <img
              src={image}
              alt=""
              className="aspect-video h-[50vh] w-full rounded-xl object-cover md:h-[70vh]"
            />
          </MorphingDialogContent>
          <MorphingDialogClose
            key="close"
            className="fixed top-6 right-6 h-fit w-fit rounded-full bg-white p-1"
            variants={{
              initial: { opacity: 0 },
              animate: {
                opacity: 1,
                transition: { delay: 0.3, duration: 0.1 },
              },
              exit: { opacity: 0, transition: { duration: 0 } },
            }}
          >
            <XIcon className="h-5 w-5 text-zinc-500" />
          </MorphingDialogClose>
        </MorphingDialogContainer>
      </MorphingDialog>
    )
  }

  return (
    <MorphingDialog
      transition={{
        type: 'spring',
        bounce: 0,
        duration: 0.3,
      }}
    >
      <MorphingDialogTrigger>
        <video
          src={video}
          autoPlay
          loop
          muted
          className="aspect-video w-full cursor-zoom-in rounded-xl"
        />
      </MorphingDialogTrigger>
      <MorphingDialogContainer>
        <MorphingDialogContent
          key="content"
          className="relative aspect-video rounded-2xl bg-zinc-50 p-1 ring-1 ring-zinc-200/50 ring-inset dark:bg-zinc-950 dark:ring-zinc-800/50"
        >
          <video
            src={video}
            autoPlay
            loop
            muted
            className="aspect-video h-[50vh] w-full rounded-xl md:h-[70vh]"
          />
        </MorphingDialogContent>
        <MorphingDialogClose
          key="close"
          className="fixed top-6 right-6 h-fit w-fit rounded-full bg-white p-1"
          variants={{
            initial: { opacity: 0 },
            animate: {
              opacity: 1,
              transition: { delay: 0.3, duration: 0.1 },
            },
            exit: { opacity: 0, transition: { duration: 0 } },
          }}
        >
          <XIcon className="h-5 w-5 text-zinc-500" />
        </MorphingDialogClose>
      </MorphingDialogContainer>
    </MorphingDialog>
  )
}

const TILTED_IMAGES = [
  'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1000&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1555066931-4365d14bab8c?q=80&w=1000&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1587620962725-abab7fe55159?q=80&w=1000&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1542831371-29b0f74f9713?q=80&w=1000&auto=format&fit=crop',
]

function TiltedCarousel() {
  const images = [...TILTED_IMAGES, ...TILTED_IMAGES]
  return (
    <div className="flex gap-4 overflow-hidden py-10">
      <div className="flex animate-scroll hover:[animation-play-state:paused] gap-4">
        {images.map((src, i) => (
          <motion.div
            key={`carousel-${i < TILTED_IMAGES.length ? 'a' : 'b'}-${i % TILTED_IMAGES.length}`}
            className="h-48 w-64 shrink-0 overflow-hidden rounded-2xl bg-zinc-100 dark:bg-zinc-800 shadow-xl"
            style={{ rotate: i % 2 === 0 ? -3 : 3 }}
            whileHover={{ scale: 1.05, rotate: 0, zIndex: 10 }}
            transition={{ type: 'spring', stiffness: 300, damping: 20 }}
          >
            <img src={src} alt="" className="h-full w-full object-cover" />
          </motion.div>
        ))}
      </div>
    </div>
  )
}

export default function Personal() {
  const [filter, setFilter] = useState<'mobile' | 'package' | 'tool'>('mobile')

  const filteredProjects = PROJECTS.filter(p => p.category === filter)

  return (
    <motion.main
      variants={VARIANTS_CONTAINER}
      initial="hidden"
      animate="visible"
    >
      <motion.section
        key="carousel"
        variants={VARIANTS_SECTION}
        transition={TRANSITION_SECTION}
        className="w-full overflow-hidden"
      >
        <TiltedCarousel />
      </motion.section>

      <div className="mx-auto max-w-screen-sm px-4 space-y-24 mt-16">

        <motion.section
          key="projects"
          variants={VARIANTS_SECTION}
          transition={TRANSITION_SECTION}
        >
          <div className="flex items-center justify-between mb-8">
            <h3 className="text-lg font-medium">My works</h3>
            <div className="flex gap-1 rounded-full bg-zinc-100 p-1 dark:bg-zinc-900 border border-zinc-200 dark:border-zinc-800">
              <button
                onClick={() => setFilter('mobile')}
                className={`rounded-full px-3 py-1 text-xs font-medium transition-colors ${filter === 'mobile'
                  ? 'bg-white text-black shadow-sm dark:bg-zinc-800 dark:text-zinc-50'
                  : 'text-zinc-500 hover:text-zinc-900 dark:hover:text-zinc-100'
                  }`}
              >
                Mobile Apps
              </button>
              <button
                onClick={() => setFilter('package')}
                className={`rounded-full px-3 py-1 text-xs font-medium transition-colors ${filter === 'package'
                  ? 'bg-white text-black shadow-sm dark:bg-zinc-800 dark:text-zinc-50'
                  : 'text-zinc-500 hover:text-zinc-900 dark:hover:text-zinc-100'
                  }`}
              >
                Packages
              </button>
              <button
                onClick={() => setFilter('tool')}
                className={`rounded-full px-3 py-1 text-xs font-medium transition-colors ${filter === 'tool'
                  ? 'bg-white text-black shadow-sm dark:bg-zinc-800 dark:text-zinc-50'
                  : 'text-zinc-500 hover:text-zinc-900 dark:hover:text-zinc-100'
                  }`}
              >
                Tools
              </button>
            </div>
          </div>

          <div className="grid grid-cols-1 gap-6 sm:grid-cols-2">
            {filteredProjects.map((project) => (
              <div key={project.id} className="group space-y-2">
                <div className="relative rounded-2xl bg-zinc-50/40 p-1 ring-1 ring-zinc-200/50 ring-inset dark:bg-zinc-950/40 dark:ring-zinc-800/50 transition-all duration-300 group-hover:ring-emerald-500/30">
                  <ProjectMedia video={project.video} image={project.image} />
                </div>
                <div className="px-1">
                  <a
                    className="font-base group/link relative inline-block font-[450] text-zinc-900 dark:text-zinc-50"
                    href={project.link}
                    target="_blank"
                    rel="noopener noreferrer"
                  >
                    {project.name}
                    <span className="absolute bottom-0.5 left-0 block h-[1px] w-full max-w-0 bg-emerald-500 transition-all duration-200 group-hover/link:max-w-full"></span>
                  </a>
                  <p className="text-base text-zinc-600 dark:text-zinc-400">
                    {project.description}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </motion.section>

        <motion.section
          key="articles"
          variants={VARIANTS_SECTION}
          transition={TRANSITION_SECTION}
        >
          <h3 className="mb-5 text-lg font-medium">Articles</h3>
          <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
            {BLOG_POSTS.map((post) => (
              <a
                key={post.uid}
                href={post.link}
                target="_blank"
                rel="noopener noreferrer"
                className="group overflow-hidden rounded-xl border border-zinc-200 bg-zinc-50/50 transition-all hover:border-emerald-500/30 hover:shadow-lg dark:border-zinc-800 dark:bg-zinc-900/50 dark:hover:border-emerald-500/30"
              >
                <div className="aspect-[2/1] overflow-hidden bg-zinc-100 dark:bg-zinc-800">
                  <img
                    src={post.image}
                    alt={post.title}
                    className="h-full w-full object-cover transition-transform duration-300 group-hover:scale-105"
                  />
                </div>
                <div className="p-4">
                  <h4 className="font-medium text-zinc-900 dark:text-zinc-100 group-hover:text-emerald-600 dark:group-hover:text-emerald-400 transition-colors line-clamp-2">
                    {post.title}
                  </h4>
                  <p className="mt-1 text-sm text-zinc-500 dark:text-zinc-400 line-clamp-2">
                    {post.description}
                  </p>
                </div>
              </a>
            ))}
          </div>
        </motion.section>

        <motion.section
          key="experience"
          variants={VARIANTS_SECTION}
          transition={TRANSITION_SECTION}
        >
          <h3 className="mb-5 text-lg font-medium">Work Experience</h3>
          <div className="flex flex-col space-y-2">
            {WORK_EXPERIENCE.map((job) => {
              const isLink = job.link && job.link !== '#' && job.link !== ''
              const Wrapper = isLink ? 'a' : 'div'

              return (
                <Wrapper
                  key={job.id}
                  className="relative overflow-hidden rounded-2xl bg-zinc-300/30 p-[1px] dark:bg-zinc-600/30 block"
                  {...(isLink
                    ? {
                      href: job.link,
                      target: '_blank',
                      rel: 'noopener noreferrer',
                    }
                    : {})}
                >
                  <Spotlight
                    className="from-emerald-500/20 via-emerald-400/10 to-transparent blur-2xl dark:from-emerald-900/20 dark:via-emerald-800/10 dark:to-transparent"
                    size={64}
                  />
                  <div className="relative h-full w-full rounded-[15px] bg-white p-4 dark:bg-zinc-950">
                    <div className="relative flex w-full flex-row justify-between">
                      <div>
                        <h4 className="font-normal dark:text-zinc-100">
                          {job.title}
                        </h4>
                        <p className="text-zinc-500 dark:text-zinc-400">
                          {job.company}
                        </p>
                      </div>
                      <p className="text-zinc-600 dark:text-zinc-400">
                        {job.start} - {job.end}
                      </p>
                    </div>
                  </div>
                </Wrapper>
              )
            })}
          </div>
        </motion.section>

        <motion.section
          key="connect"
          variants={VARIANTS_SECTION}
          transition={TRANSITION_SECTION}
        >
          <h3 className="mb-5 text-lg font-medium">Connect</h3>
          <p className="text-zinc-600 dark:text-zinc-400">
            Feel free to contact me at{' '}
            <a className="underline text-emerald-700 dark:text-emerald-400" href={`mailto:${EMAIL}`}>
              {EMAIL}
            </a>
          </p>
        </motion.section>
      </div>
    </motion.main>
  )
}
