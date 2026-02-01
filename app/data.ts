type Project = {
  name: string
  description: string
  link: string
  video?: string
  image?: string
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
  image: string
}

type SocialLink = {
  label: string
  link: string
}

export const PROJECTS: Project[] = [
  {
    name: 'TvStats',
    description: 'Monitor Apple TV system performance with real-time CPU and memory metrics.',
    link: 'https://tvstats.harishanbalagan.com/',
    image: 'https://tvstats.harishanbalagan.com/screenshots/0_APP_APPLE_TV_0.png',
    id: 'project1',
    category: 'mobile',
  },
  {
    name: 'Rewardive',
    description: 'Discover all credit card, debit card, and bank offers in one place.',
    link: 'https://rewardive.app/',
    id: 'project2',
    category: 'mobile',
  },
  {
    name: 'Namma Wallet',
    description: 'Open-source Flutter app to manage digital travel tickets and passes.',
    link: 'https://github.com/Namma-Flutter/namma_wallet',
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
    image: 'https://private-user-images.githubusercontent.com/38380040/515700285-57cdb77d-db53-4e94-a429-5f4b6a3b4166.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Njk4NjYxNTEsIm5iZiI6MTc2OTg2NTg1MSwicGF0aCI6Ii8zODM4MDA0MC81MTU3MDAyODUtNTdjZGI3N2QtZGI1My00ZTk0LWE0MjktNWY0YjZhM2I0MTY2LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjAxMzElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwMTMxVDEzMjQxMVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTAwMTgwZWM3MmFlMmVlN2U1ZDc2ZjJiYzAwOTQ2NjI1YmY5ZmU5ODgyYzY3MTNlZjVjOGNlMDU2NWZkYWJhNmUmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.DhyOlgnPKVg0ihJrfQ3wdakAhgRpQunc9yrm91I0iF8',
    id: 'tool1',
    category: 'tool',
  },
  {
    name: 'JankKiller',
    description: 'Flutter DevTools extension for performance optimization.',
    link: 'https://github.com/Harishwarrior/jankkiller',
    image: 'https://github.com/user-attachments/assets/94e32c84-f556-4846-a191-71923810b510',
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
    image: 'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*I1su4-ziFBsgt6uJHvOHSw.png',
  },
  {
    title: 'Vibe coding with Flutter',
    description: 'AI assisted coding in Flutter using free API and MCP',
    link: 'https://medium.com/nammaflutter/vibe-coding-with-flutter-61414d6080b8',
    uid: 'article2',
    image: 'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*VQtmobFklu45YVP8zu6D2w.jpeg',
  },
  {
    title: 'Streamlining Xcode with tools and tips — Part 1',
    description: 'Tips and tools to improve your Xcode workflow.',
    link: 'https://medium.com/@harishwarrior/streamlining-xcode-with-tools-and-tips-part-1-22997d852441',
    uid: 'article3',
    image: 'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*s-czaE_thsECntq6BrGxbg.jpeg',
  },
  {
    title: 'Streamlining Xcode with tools and tips — Part 2',
    description: 'More tips and tools for Xcode productivity.',
    link: 'https://medium.com/@harishwarrior/streamlining-xcode-with-tools-and-tips-part-2-9a17fd2c843c',
    uid: 'article4',
    image: 'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*uZnW0MZbtKKzu5UY4qtv7g.jpeg',
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
