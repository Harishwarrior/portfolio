'use client'
import { useState } from 'react'
import { cn } from '@/lib/utils'
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
import { PROJECTS, WORK_EXPERIENCE, BLOG_POSTS, EMAIL } from './data'
import { PhoneMockup } from '@/components/ui/phone-mockup'

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
  title: string
}

function ProjectMedia({ video, image, title }: ProjectMediaProps) {
  if (!video && !image) {
    return (
      <div className="flex aspect-video w-full items-center justify-center rounded-xl bg-zinc-100 text-zinc-400 dark:bg-zinc-800">
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
            alt={`Preview image of ${title}`}
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
              alt={`Enlarged image of ${title}`}
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
          aria-label={`Preview video of ${title}`}
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
            aria-label={`Enlarged video of ${title}`}
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
  '/carousel/PXL_20220309_163948803~2_Original.webp',
  '/carousel/PXL_20220522_211112715.PORTRAIT_Original.webp',
  '/carousel/PXL_20221119_121931327_Original.webp',
  '/carousel/IMG_5705_Original.webp',
  '/carousel/FullSizeRender_Original.webp',
  '/carousel/IMG_2631_Original.webp',
  '/carousel/IMG_2634_Original.webp',
  '/carousel/IMG_2700_Original.webp',
  '/carousel/IMG_2707_Original.webp',
  '/carousel/IMG_0236_Original.webp',
  '/carousel/IMG_3564_Original.webp',
  '/carousel/IMG_3572_Original.webp',
  '/carousel/IMG_3597_Original.webp',
  '/carousel/IMG_3600_Original.webp',
  '/carousel/IMG_5532_Original.webp',
  '/carousel/IMG_5540_Original.webp',
  '/carousel/IMG_5706_Original.webp',
  '/carousel/IMG_5712_Original.webp',
  '/carousel/IMG_5721_Original.webp',
  '/carousel/IMG_5882_Original.webp',
  '/carousel/IMG_5918_Original.webp',
]

const AppStoreBadge = () => (
  <div className="flex items-center gap-2 rounded-lg border border-zinc-200 px-3 py-1.5 dark:border-zinc-800">
    <svg className="h-4 w-4 fill-current" viewBox="0 0 384 512">
      <path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.1-77.5-19.1-36.9 0-103.4 18-175.9 101.4C26.7 304.7 6.1 364.6 6.1 433.2c0 93.4 52.7 239.2 131.8 239.2 38.7 0 54.8-24.5 101.3-24.5 46.1 0 60.5 24.5 101.3 24.5 39.5 0 88-145.8 88-145.8s-35.3-14.3-35.3-157.1c.1-85.3 71-124 71-124.1z" />
    </svg>
    <div className="flex flex-col leading-none">
      <span className="text-[8px] uppercase">Download on the</span>
      <span className="text-xs font-semibold">App Store</span>
    </div>
  </div>
)

const PlayStoreBadge = () => (
  <div className="flex items-center gap-2 rounded-lg border border-zinc-200 px-3 py-1.5 dark:border-zinc-800">
    <svg className="h-4 w-4 fill-current" viewBox="0 0 512 512">
      <path d="M325.3 234.3L104.6 13l280.8 161.2-60.1 60.1zM47 0C34 6.8 25.3 19.2 25.3 35.3v441.3c0 16.1 8.7 28.5 21.7 35.3l256.6-256L47 0zm425.2 225.6l-58.9-34.1-65.7 64.5 65.7 64.5 60.1-34.1c18-14.3 18-46.5-1.2-60.8zM104.6 499l280.8-161.2-60.1-60.1L104.6 499z" />
    </svg>
    <div className="flex flex-col leading-none">
      <span className="text-[8px] uppercase">Get it on</span>
      <span className="text-xs font-semibold">Google Play</span>
    </div>
  </div>
)

function AppShowcase({ project }: { project: (typeof PROJECTS)[0] }) {
  return (
    <div className="group relative overflow-hidden rounded-3xl border border-zinc-200 bg-white p-8 dark:border-zinc-800 dark:bg-zinc-950/50">
      <div className="flex flex-col items-center gap-12 md:flex-row">
        <div className="relative w-full max-w-[280px] shrink-0">
          <PhoneMockup>
            <ProjectMedia
              video={project.video}
              image={project.image}
              title={project.name}
            />
          </PhoneMockup>
        </div>

        <div className="flex flex-col gap-6">
          <div className="flex flex-col gap-4">
            {project.icon && (
              <img
                src={project.icon}
                alt={`${project.name} icon`}
                className="h-16 w-16 rounded-2xl shadow-lg"
              />
            )}
            <h3 className="text-3xl font-bold text-zinc-900 dark:text-zinc-50">
              {project.name}
            </h3>
            <p className="text-lg text-zinc-600 dark:text-zinc-400">
              {project.description}
            </p>
          </div>

          <div className="mt-4 flex flex-wrap gap-3">
            {project.appStore && (
              <a
                href={project.appStore}
                target="_blank"
                rel="noopener noreferrer"
                className="transition-transform hover:scale-105"
              >
                <AppStoreBadge />
              </a>
            )}
            {project.playStore && (
              <a
                href={project.playStore}
                target="_blank"
                rel="noopener noreferrer"
                className="transition-transform hover:scale-105"
              >
                <PlayStoreBadge />
              </a>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}

function TiltedCarousel() {
  const images = [...TILTED_IMAGES, ...TILTED_IMAGES]
  return (
    <div className="flex gap-4 overflow-hidden py-10">
      <div className="animate-scroll flex gap-4 [will-change:transform] hover:[animation-play-state:paused]">
        {images.map((src, i) => (
          <motion.div
            key={`carousel-${i < TILTED_IMAGES.length ? 'a' : 'b'}-${i % TILTED_IMAGES.length}`}
            className="h-48 w-64 shrink-0 overflow-hidden rounded-2xl bg-zinc-100 shadow-xl dark:bg-zinc-800"
            style={{ rotate: i % 2 === 0 ? -3 : 3 }}
            whileHover={{ scale: 1.05, rotate: 0, zIndex: 10 }}
            transition={{ type: 'spring', stiffness: 300, damping: 20 }}
          >
            <img
              src={src}
              alt=""
              aria-hidden="true"
              className="h-full w-full object-cover"
              loading={i < 2 ? 'eager' : 'lazy'}
              fetchPriority={i < 2 ? 'high' : 'low'}
              decoding="async"
            />
          </motion.div>
        ))}
      </div>
    </div>
  )
}

export default function Personal() {
  const [filter, setFilter] = useState<'mobile' | 'package' | 'tool'>('mobile')

  const filteredProjects = PROJECTS.filter((p) => p.category === filter)

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

      <div className="mx-auto mt-16 max-w-screen-sm space-y-24 px-4 sm:max-w-screen-md">
        <motion.section
          key="projects"
          variants={VARIANTS_SECTION}
          transition={TRANSITION_SECTION}
        >
          <div className="mb-8 flex items-center justify-between">
            <h3 className="text-lg font-medium">My works</h3>
            <div className="flex gap-1 rounded-full border border-zinc-200 bg-zinc-100 p-1 dark:border-zinc-800 dark:bg-zinc-900">
              <button
                onClick={() => setFilter('mobile')}
                className={`rounded-full px-3 py-1 text-xs font-medium transition-colors ${
                  filter === 'mobile'
                    ? 'bg-white text-black shadow-sm dark:bg-zinc-800 dark:text-zinc-50'
                    : 'text-zinc-500 hover:text-zinc-900 dark:hover:text-zinc-100'
                }`}
              >
                Mobile Apps
              </button>
              <button
                onClick={() => setFilter('package')}
                className={`rounded-full px-3 py-1 text-xs font-medium transition-colors ${
                  filter === 'package'
                    ? 'bg-white text-black shadow-sm dark:bg-zinc-800 dark:text-zinc-50'
                    : 'text-zinc-500 hover:text-zinc-900 dark:hover:text-zinc-100'
                }`}
              >
                Packages
              </button>
              <button
                onClick={() => setFilter('tool')}
                className={`rounded-full px-3 py-1 text-xs font-medium transition-colors ${
                  filter === 'tool'
                    ? 'bg-white text-black shadow-sm dark:bg-zinc-800 dark:text-zinc-50'
                    : 'text-zinc-500 hover:text-zinc-900 dark:hover:text-zinc-100'
                }`}
              >
                Tools
              </button>
            </div>
          </div>

          <div
            className={cn(
              'grid grid-cols-1 gap-6',
              filter === 'mobile' ? 'md:grid-cols-1' : 'sm:grid-cols-2',
            )}
          >
            {filteredProjects.map((project) =>
              filter === 'mobile' ? (
                <AppShowcase key={project.id} project={project} />
              ) : (
                <div key={project.id} className="group space-y-2">
                  <div className="relative rounded-2xl bg-zinc-50/40 p-1 ring-1 ring-zinc-200/50 transition-all duration-300 ring-inset group-hover:ring-emerald-500/30 dark:bg-zinc-950/40 dark:ring-zinc-800/50">
                    <ProjectMedia
                      video={project.video}
                      image={project.image}
                      title={project.name}
                    />
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
              ),
            )}
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
                  <h4 className="line-clamp-2 font-medium text-zinc-900 transition-colors group-hover:text-emerald-600 dark:text-zinc-100 dark:group-hover:text-emerald-400">
                    {post.title}
                  </h4>
                  <p className="mt-1 line-clamp-2 text-sm text-zinc-500 dark:text-zinc-400">
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
                  className="relative block overflow-hidden rounded-2xl bg-zinc-300/30 p-[1px] dark:bg-zinc-600/30"
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
            <a
              className="text-emerald-700 underline dark:text-emerald-400"
              href={`mailto:${EMAIL}`}
            >
              {EMAIL}
            </a>
          </p>
        </motion.section>
      </div>
    </motion.main>
  )
}
