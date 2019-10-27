const fs = require('fs')
const { promisify } = require('util')
let { exec } = require('child_process')
exec = promisify(exec)

const list = fs
  .readFileSync('./extensions.txt')
  .toString()
  .split(/\n/)

list.map(n =>
  exec(`code --install-extension ${n}`, error => {
    if (error) {
      throw new Error(error)
    } else {
      console.info(`installed ${n}`)
    }
  }),
)
