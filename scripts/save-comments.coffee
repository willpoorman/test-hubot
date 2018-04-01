module.exports = (robot) ->
  robot.respond /save comment: (.*)\s(.*)/i, (res) ->
    command = res.match[0]
    user = res.match[1]
    timestamp = res.match[2]

    response = "Command: #{command}\n
                User: #{user}\n
                Timestamp: #{timestamp}"

    res.send response
    # res.send "Command: #{command}"
    # res.send "User: #{user}"
    # res.send "Timestamp: #{timestamp}"

  robot.respond /show users$/i, (res) ->
    # check permissions
    role = 'admin'
    user = robot.brain.userForName(res.message.user.name)
    return res.reply "Access Denied\nCan't find roles for: #{name}" unless user?
    unless robot.auth.hasRole(user, role)
        res.reply "Access Denied\n#{user.name} does not have the required role: #{role}"
        return

    # build user id and name list
    response = ""

    for own key, user of robot.brain.data.users
      response += "#{user.id} #{user.name}"
      response += " <#{user.email_address}>" if user.email_address
      response += "\n"

    res.send response
