import sharp from 'sharp'
import { readdir, mkdir } from 'fs/promises'
import { join, parse } from 'path'
import { existsSync } from 'fs'

const CAROUSEL_DIR = 'public/carousel'
const OPTIMIZED_DIR = 'public/carousel/opt'

const WIDTH = 512
const HEIGHT = 384

async function optimize() {
  if (!existsSync(OPTIMIZED_DIR)) {
    await mkdir(OPTIMIZED_DIR, { recursive: true })
  }

  const files = await readdir(CAROUSEL_DIR)
  const webpFiles = files.filter(f => f.endsWith('.webp') && !f.startsWith('.'))

  for (const file of webpFiles) {
    const input = join(CAROUSEL_DIR, file)
    const { name } = parse(file)
    const output = join(OPTIMIZED_DIR, `${name}.webp`)

    const meta = await sharp(input).metadata()
    console.log(`${file}: ${meta.width}x${meta.height} → ${WIDTH}x${HEIGHT}`)

    await sharp(input)
      .resize(WIDTH, HEIGHT, { fit: 'cover', position: 'centre' })
      .webp({ quality: 80, effort: 4 })
      .toFile(output)
  }

  console.log(`\nDone. ${webpFiles.length} images optimized → ${OPTIMIZED_DIR}/`)
}

optimize().catch(console.error)
