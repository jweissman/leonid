# lib/engine.leonid.coffee

class Engine

# Set up the canvas element
  constructor: () ->
    console.log "Engine#constructor"
#    Engine.current_game = @game
    Engine.canvas       = document.getElementById("canvas")
    Engine.viewport     = Engine.canvas.getContext("2d")

  # Set up click events
  setupEvents: =>
    console.log "Engine#setupEvents"
    Engine.canvas.addEventListener "click", (e) ->
      Leonid.game.click(e)

  # Do something, this is where we want to associate
  # a new block to a player. Explained later in the tutorial

  # Set up listeners for the draw method
  startUpdateListener: =>
    console.log "Engine#startUpdateListener"
    redrawCanvas = ->
      console.log "Engine#startUpdateListener##redrawCanvas"
      context = new Meteor.deps.Context()
      context.on_invalidate redrawCanvas
      context.run ->
        Leonid.game.draw()

    # The redraw method that allows us to project the updated
    # game objects onto the Canvas element
    redrawCanvas()
