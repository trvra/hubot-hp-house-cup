# Description
#   A little Hubot script for keeping track of House Cup Points
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot give +<x> points to <house> - add x points to house
#   hubot take -<x> points from house - subtract x points from house
#   hubot hosue cup standings - print current points stored
#
# Examples:
#   hubot give 20 points to Ravenclaw
#   hubot -20 points Slytherin
#   hubot 10 points to Gryffindor
#
# Notes:
#   Inspired by the House Cup held at Some Office in Chicago, a cool space
#   full of cool people. Check it out: http://instagram.com/p/uzJW85D6yx
#   It is best if people are actually interested in using Harry Potter house
#   points to keep track of random positive / negative actions in the chat,
#   as things can get out of hand pretty quickly unless a relative
#   points scale is established. Having a Headmaster is advised to keep
#   order in Hogwarts! A Muggle house is available to include those who dont
#   understand or cant decide on a house. The Regex errs on the side of
#   complexity to make a bad attempt at capturing any possible phrasing
#   for the command. Please let me know if this ends up interfering with
#   any other script! I really have no clue what I'm doing.
#
# Author:
#   Trevor Adams

module.exports = (robot) ->

  robot.respond /(take)?.*?(\-|\+)?(\d+)(?:(?!from).)*(from)?.*(gryffindor|hufflepuff|muggles|ravenclaw|slytherin)/i, (msg) ->
    tg = msg.match[1]                   # "give" or "take" or ""
    operator = msg.match[2]             # "+" or "-" or ""
    points = parseInt(msg.match[3])     # number of points to change
    tf = msg.match[4]                   # "take" or "from" or ""
    house = msg.match[5].toLowerCase()  # house to change points of

    if tg is "take" or operator is "-" or tf is "from"
      operator = -1
    else
      operator = 1

    if house and points
      points *= operator
      points += robot.brain.get(house) or 0
      plural = if points is 1 then "" else "s"
      has = if house is "muggles" then " have " else " has "
      robot.brain.set(house, points)
      msg.send house[0].toUpperCase() + house.slice(1) +
        " now" + has + points + " point" + plural + "!"
    else
      msg.send "Magic isn't real, that didn't work."

  robot.respond /\w*house cup standing\w*/i, (msg) ->
    houses = ["gryffindor", "hufflepuff", "ravenclaw", "slytherin", "muggles"]
    standings = "The House Cup standings are:"
    for house in houses
      points = robot.brain.get(house) or 0
      plural = if points is 1 then "" else "s"
      properHouse = house[0].toUpperCase() + house.slice(1)
      has = if house is "muggles" then " have " else " has "
      standings += "\n\t" + properHouse + has + points + " point" + plural
    msg.send standings

  robot.respond /\w*house cup help\w*/i, (msg) ->
    hpHelp = "hubot [give/take] [+/-] POINTS [to/from] HOUSE"
    hpHelp += "\nhubot house cup standings"
    msg.send hpHelp
