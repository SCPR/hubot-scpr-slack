# Description:
#   Defines periodic executions

module.exports = (robot) ->
  cronJob = require('cron').CronJob
  tz = 'America/Los_Angeles'
  new cronJob("0 */5 * * * *", standUpTime, null, true, tz)

  standUpTime = ->
    robot.messageRoom "#kernelpanic", "OK everyone it's standup time!"