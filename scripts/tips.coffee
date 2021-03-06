tips =
    "peabody"           : "http://flowtv.org/wp-content/uploads/2009/03/peabody.png"
    "wtf"               : "You got a problem?"
    "wiki"              : "http://github.com/SCPR/wiki"
    "fliptable"         : "(ノಠ益ಠ)ノ彡┻━┻"
    "imagination"       : "http://i.imgur.com/4VKqndq.jpg"
    "facepalm"          : "http://i.imgur.com/4G1ZZWc.jpg"
    "homer"             : "http://i.imgur.com/C5WJ6Kw.jpg"
    "trump"             : "http://i.imgur.com/7wc9U8h.jpg"
    "vader"             : "http://i.imgur.com/dVVe3vc.jpg"
    "shark attack"      : "http://i.imgur.com/a0HU9lO.jpg"
    "derp"              : "http://i.imgur.com/EsiDxmt.png"
    "frysquint"         : "http://i.imgur.com/sb5qsC2.jpg"
    "king me"           : "http://i.imgur.com/mS39ywd.jpg"
    "swim"              : "http://i.imgur.com/vhXx8ue.gif"
    "mischief"          : "http://media.giphy.com/media/cnCwYWzCkwOoE/giphy.gif"
    "jealous dog"       : "http://a.scpr.org/i/c3ec858276a52b33e201454bb450abf7/88876-eight.jpg"
    "imbecile"          : "http://33.media.tumblr.com/tumblr_lqx6eoeR8T1qmt8ipo1_500.gif"
    "vacation days"     : "http://infoserverwiki.publicradio.org/index.php/2014_Holiday_Schedule"
    "city of angels"    : "http://media1.giphy.com/media/xA5dInQkpRCDe/giphy.gif"

module.exports = (robot) ->
    #-------------------
    # This sort-of works but not really
    #addRe = new RegExp("(?:add) \"([^\"]+)\" \"([^\"]+)\"", 'gi')
    #robot.respond addRe, (msg) ->
    #    match    = addRe.exec(msg.message.text)
    #    tip      = match[1]
    #    response = match[2]
    #    console.log "Got add message", tip, response
    #
    #    tips[tip] = response
    #    robot.respond new RegExp(tip, "gi"), (msg) ->
    #        msg.send response
    #
    #    msg.send "The command \"#{tip}\" is now available"

    #-------------------

    for tip,response of tips
        do (response) ->
            robot.respond new RegExp(tip, "gi"), (msg) ->
                msg.send response

    #-------------------

    robot.respond /open the pod bay doors/gi, (msg) ->
        msg.send "I'm afraid I can't do that, #{msg.message.user.name}"

    #-------------------

    robot.hear /^NOOO+/, (msg) ->
        msg.send tips['vader']

    robot.hear /you're fired/i, (msg) ->
        msg.send tips['trump']

    robot.hear /see what I mean/i, (msg) ->
        msg.send tips['swim']

    robot.hear /my mistake/i, (msg) ->
        msg.send tips['imbecile']

    robot.hear /I screwed up/i, (msg) ->
        msg.send tips['imbecile']

    robot.hear /city of angels/i, (msg) ->
        msg.send tips['city of angels']
