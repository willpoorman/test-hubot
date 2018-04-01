module.exports = (robot) ->
  if robot.adapterName != 'slack'
    return

  robot.react (res) ->
    robot.logger.debug res.message.type, res.message.reaction
    if res.message.type == "added"
      robot.adapter.client.web.reactions.add(res.message.reaction, {channel: res.message.item.channel, timestamp: res.message.item.ts})
