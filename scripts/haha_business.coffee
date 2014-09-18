# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   haha business - KPCC's equivalent to the Easy Button.
#
# Author:
#   jmeeker

module.exports = (robot) ->
  robot.hear /haha business/i, (msg) ->
    msg.send "http://i.imgur.com/o7CJqCV.jpg"
