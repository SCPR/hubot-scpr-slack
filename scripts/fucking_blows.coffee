qs = require('querystring')

module.exports = (robot) ->
    URL = "http://fucking-blows.herokuapp.com"

    robot.hear /^(.+) fucking blows[\.!]*?$/i, (msg) ->
        text = msg.match[1]
        name = msg.message.user.name

        if text.match(/^bryan/i)
            msg.reply "You fucking blow!"
        else
            query = qs.stringify(text: text, name: name)
            msg.send "#{URL}/fuckingblows?#{query}.png"
