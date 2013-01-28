Shapes  = new Meteor.Collection('shapes')
Players = new Meteor.Collection('players')

class Blocks

  constructor: ->
    console.log 'Blocks#constructor'

  setup: =>
    console.log "Blocks#setup"
    player = {}

    # Here we have a simple prompt which asks for the players name as assigns it to
    # the player_name variable.
    player_name = prompt("Player Name", "Player")

    # This bit of Meteor data code creates a new player object and assigns the player_name
    # and it also captures the player_id so we can...
    player_id = Players.insert(
      name:  player_name
      score: 0
    )

    # ...temporarily set it in the session to be able to assign shapes/blocks to our player.
    Session.set "player_id", player_id

  click: (e) =>
    console.log 'Blocks#click!'

    # We use the .insert method to create a new Shape object and position it.
    # This shape still hasn't been drawn to the screen, this will be done in the
    # Canvas redraw method explained later.
    Shapes.insert
      positionx: e.pageX
      positiony: e.pageY

    # grab the current Player based on the player_id session value.
    me = Players.findOne(Session.get("player_id"))

    # update their score
    newscore = me.score + 1

    # Update the object in the database.
    Players.update Session.get("player_id"),
      $set:
        score: newscore

  draw: =>
    console.log 'Blocks#run!'

    # The .find({}) Meteor method gets ALL the objects of that type.
    shapes = Shapes.find({})

    # Loop through each object
    shapes.forEach (shape) ->

      # Basic Canvas creation of a blue-ish square at the database-value position X & Y
      Engine.viewport.fillStyle = "rgba(0, 0, 200, 0.5)"
      Engine.viewport.fillRect shape.positionx, shape.positiony, 20, 20

if Meteor.is_client
  # Show the template for the players
  Template.leaderboard.players = ->
    Players.find {},
      sort:
        score: -1
        name: 1
