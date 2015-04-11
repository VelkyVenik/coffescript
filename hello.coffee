charm = require('charm')(process);
keypress = require 'keypress'

charm.reset()
charm.cursor no
keypress process.stdin

line = 0
process.stdin.on 'keypress',  (ch, key) ->
  charm
    .delete "char"                  # silent
    .foreground "red"               # color
    .position 1,line                # on the same line
    .write "Key: "                  # do not erase this
    .erase "end"                    # erase previous key data
    .write "#{ch} (#{key.name})\n"  # key data

  process.exit() if key.name is 'q'

charm
  .position i+1, i+1
  .foreground i+1
  .write s for s,i in 'Hello World :) '

charm.position (x,y) ->
  line = y
