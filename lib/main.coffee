if Meteor.is_client
  Meteor.startup ->
    game   = new Blocks()
    leonid = new Leonid(game)
