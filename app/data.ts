type Project = {
  name: string
  description: string
  link: string
  video: string
  id: string
  category?: 'mobile' | 'package' | 'tool'
}

type WorkExperience = {
  company: string
  title: string
  start: string
  end: string
  link?: string
  id: string
}

type BlogPost = {
  title: string
  description: string
  link: string
  uid: string
}

type SocialLink = {
  label: string
  link: string
}

export const PROJECTS: Project[] = [
  {
    name: 'TvStats',
    description: 'TV show tracking app with 6k+ downloads.',
    link: 'https://tvstats.harishanbalagan.com/',
    video: '',
    id: 'project1',
    category: 'mobile',
  },
  {
    name: 'Rewardive',
    description: 'Rewards and loyalty program app.',
    link: 'https://play.google.com/store/apps/details?id=app.rewardive',
    video: '',
    id: 'project2',
    category: 'mobile',
  },
  {
    name: 'Namma Wallet',
    description: 'Personal finance and wallet management app.',
    link: 'https://apps.apple.com/in/app/namma-wallet/id6757295408',
    video: '',
    id: 'project3',
    category: 'mobile',
  },
  {
    name: 'Thrifty Grocery',
    description: 'Quick commerce comparison app.',
    link: '',
    video: '',
    id: 'project4',
    category: 'mobile',
  },
  {
    name: 'Team',
    description: 'Team collaboration app built at Thiran Technologies.',
    link: 'https://play.google.com/store/apps/details?id=com.thirantech.team&hl=en_IN',
    video: '',
    id: 'project5',
    category: 'mobile',
  },
  {
    name: '959 FM',
    description: 'Radio streaming app built at Thiran Technologies.',
    link: 'https://apps.apple.com/in/app/959-fm/id1615935976',
    video: '',
    id: 'project6',
    category: 'mobile',
  },
  {
    name: 'svg_to_font_convertor',
    description: 'Dart package to convert SVG icons to custom icon fonts.',
    link: 'https://pub.dev/packages/svg_to_font_convertor',
    video: '',
    id: 'package1',
    category: 'package',
  },
  {
    name: 'Flutter Claude Skills',
    description: 'Claude Code skills for Flutter development.',
    link: 'https://github.com/Harishwarrior/flutter-claude-skills',
    video: '',
    id: 'tool1',
    category: 'tool',
  },
  {
    name: 'JankKiller',
    description: 'Flutter DevTools extension for performance optimization.',
    link: 'https://github.com/Harishwarrior/jankkiller',
    video: '',
    id: 'tool2',
    category: 'tool',
  },
]

export const WORK_EXPERIENCE: WorkExperience[] = [
  {
    company: 'E2 Infosystems Ltd',
    title: 'Senior Software Engineer',
    start: 'Aug 2023',
    end: 'Present',
    id: 'work1',
  },
  {
    company: 'Stealth Startup',
    title: 'Freelance Software Engineer',
    start: 'Jul 2023',
    end: 'Jul 2023',
    id: 'work2',
  },
  {
    company: 'Thiran Technologies',
    title: 'Software Engineer',
    start: 'Aug 2021',
    end: 'Jul 2023',
    link: 'https://thirantech.com/',
    id: 'work3',
  },
  {
    company: 'INFOGRO TECHNOLOGY',
    title: 'Intern',
    start: 'Nov 2019',
    end: 'Nov 2019',
    id: 'work4',
  },
]

export const BLOG_POSTS: BlogPost[] = [
  {
    title: 'iOS app development without Mac — sort of',
    description: 'A guide to developing iOS apps without owning a Mac.',
    link: 'https://medium.com/@harishwarrior/ios-app-development-without-mac-sort-of-0fda8cf3e15a',
    uid: 'article1',
  },
  {
    title: 'Vibe coding with Flutter',
    description: 'Exploring the joy of building with Flutter.',
    link: 'https://medium.com/nammaflutter/vibe-coding-with-flutter-61414d6080b8',
    uid: 'article2',
  },
  {
    title: 'Streamlining Xcode with tools and tips — Part 1',
    description: 'Tips and tools to improve your Xcode workflow.',
    link: 'https://medium.com/@harishwarrior/streamlining-xcode-with-tools-and-tips-part-1-22997d852441',
    uid: 'article3',
  },
  {
    title: 'Streamlining Xcode with tools and tips — Part 2',
    description: 'More tips and tools for Xcode productivity.',
    link: 'https://medium.com/@harishwarrior/streamlining-xcode-with-tools-and-tips-part-2-9a17fd2c843c',
    uid: 'article4',
  },
]

export const SOCIAL_LINKS: SocialLink[] = [
  {
    label: 'Twitter',
    link: 'https://twitter.com/theflutterboi',
  },
  {
    label: 'LinkedIn',
    link: 'https://www.linkedin.com/in/harishanbalagan',
  },
  {
    label: 'YouTube',
    link: 'https://www.youtube.com/@theflutterboi',
  },
  {
    label: 'GitHub',
    link: 'https://github.com/harishwarrior',
  },
]

export const EMAIL = 'harishanbalagandev@gmail.com'
