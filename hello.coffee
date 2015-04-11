charm = require('charm')(process);
keypress = require 'keypress'

charm.reset()
charm.cursor no

keypress process.stdin

process.stdin.on 'keypress',  (ch, key) ->
  charm
    .foreground "red"
    .left 1
    .write "Key: #{ch} (#{key.name})\n"
    .foreground "black"

  process.exit() if key.name is 'q'



charm
  .position i+1, i+1
  .foreground i+1
  .write s for s,i in 'Hello World :)'

charm
  .foreground "black"
  .write "\n"
