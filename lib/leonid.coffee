class Leonid
  constructor: (@game) ->
    @game.setup()

    engine = new Engine(@game)
    engine.setupEvents()
    engine.startUpdateListener()

