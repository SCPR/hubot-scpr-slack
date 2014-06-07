url = require 'url'
pos = require 'pos'
http = require 'http'
request = require 'request'


gifize = (msg) ->
  try
    msg.send( "Here we go!!" )
    to_convert = msg.match.input.split( 'gifize' )
    to_convert.shift()
    words = find_words( to_convert[0] )
    console.log words
    for word in words
      do (word) ->
        get_gif_results(msg, word, send_results)

  catch e
    console.log "error: #{e.message}"

get_gif_results = (msg, search_term, callback) ->
  gif_results = []
  gif_sites = shuffleArray(["giftube.com", "forgifs.com", "gifbin.com", "gifsoup.com", "reddit.com/r/gifs", "tumblr.com/tagged/gif", "gifflix.com", "gifs.icanhascheezburger.com", "senorgif.memebase.com"])
  to_search = "#{search_term}&as_sitesearch=#{gif_sites[0]}&as_filetype:gif"
  url = "http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{to_search}"
  request url, (error, response, body) ->
    if !error && response.statusCode == 200
      result = JSON.parse(body)['responseData']['results']
      if result.length == 0
        get_gif_results(msg, search_term, callback)
      else
        gif_to_return = result[0]['unescapedUrl']
        msg.send search_term
        msg.send gif_to_return
        #gif_results.push([search_term, gif_to_return])
        #callback(msg, gif_results);
    else
      console.log "something failed"

send_results = (msg, results) ->
  console.log results
  for result in results
    console.log results
    do (result) ->
      msg.send "(#{result[0]})"
      msg.send result[1]

remote_file_exists = (uri) ->
  uri = url.parse(uri)
  options = {
    hostname: uri.host,
    port: uri.port,
    path: uri.path,
    method: 'HEAD'
  }
  req = http.request(options, (res) ->
    console.log(res.statusCode)
  )
  req.write('data\n')
  req.end()
  return req.res.statusCode == 200

get_static_image_results = ( search_term, msg ) ->
  url = "ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{search_term}"
  msg.http(url).headers('User-Agent': 'hubot').get() (err, res, body) ->
    if err
      return
    result = $.parseJSON(res.body)['responseData']['results'][0]
    return result['unescapedUrl']

find_words = (to_convert) ->
  to_return = []
  to_be_combined = []
  last_type = ""
  words = new pos.Lexer().lex(to_convert)
  taggedWords = new pos.Tagger().tag(words)
  for tagged in taggedWords
    word = tagged[0]
    type = tagged[1]
    to_return.push(word)
    #     unshortened_type = type
    #     if (type == 'VBZ' && last_type == 'PRP')
    #       type = 'skip'
    #     else if ( type == 'VBZ' && last_type.substring(0,2) == 'NN' )
    #       type = 'skip'
    #     else if ( type == 'VBD' )
    #       type = 'skip'
    #     else
    #       type = type.substring(0,2)
    #     if type == 'VB' || type == 'NN'
    #       if ( type == 'NN' && ( last_type.substring(0,2) == 'NN' || last_type == 'VBG' ) )
    #         to_return[to_return.size - 1] = to_return[to_return.size - 1 ] + " #{word}"
    #         console.log to_return
    #       else
    #         to_be_combined.push(word)
    #         to_return.push(to_be_combined.join( ' ' ))
    #
    #       to_be_combined = []
    #     else if  type == 'JJ'
    #       to_be_combined.push(word)
    #     last_type = unshortened_type
    #   to_return.push(to_be_combined.join( ' ' )) unless to_be_combined.length < 0
    #   return to_return
  return to_return
shuffleArray = (array) ->
  for i in [array.length-1..1]
    j = Math.floor Math.random() * (i + 1)
    [array[i], array[j]] = [array[j], array[i]]
  array

module.exports = (robot) ->

    robot.hear /gifize/i, (msg) ->
      gifize(msg)


