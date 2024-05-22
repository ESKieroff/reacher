import pino from 'pino'
import dayjs from 'dayjs'

const log = pino({
  base: {
    pid: false,
  },
  timestamp: () => `,"time":"${dayjs().format()}"`,
  // Remove the prettifier property
})

export default log
