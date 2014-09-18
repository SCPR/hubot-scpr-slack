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
#   stakeholder - Unleash delicious steakholders in your chatroom
#
# Author:
#   jhoffing

steaks = [
  "http://2.bp.blogspot.com/-FQQGpoXMv08/Tgx2ubJCQWI/AAAAAAAAAOk/6Et62vQ5cEI/s1600/steakholder.jpg",
  "http://media-cache-ec0.pinimg.com/736x/64/52/e8/6452e888f74720bb86c3563b7cc95d70.jpg",
  "http://blog.seibert-media.net/wp-content/uploads/2013/06/agile_idrewing_steak_holder.png",
  "http://jaypgreene.files.wordpress.com/2009/04/stakeholder.jpg"
]

module.exports = (robot) ->
  robot.hear /stakeholders?/i, (msg) ->
    random_steak = steaks[Math.floor(Math.random() * steaks.length)]
    msg.send random_steak
