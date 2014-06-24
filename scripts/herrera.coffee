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
#   herrera - Unleash the awesome energy of Miguel Herrera on your chatroom
#
# Author:
#   sdillingham

herreras = [
  "http://i.imgur.com/U6fy9b1.gif",
  "http://i.imgur.com/R5fAwRc.gif",
  "http://i.imgur.com/WB2pc3n.gif",
  "http://i.imgur.com/JO4uMRz.gif",
  "http://i.imgur.com/I1QlwV0.gif",
  "http://i.imgur.com/zC7WT2w.gif"
]

module.exports = (robot) ->
  robot.hear /herrera/i, (msg) ->
    msg.send msg.random hererras