assert = require("assert")
describe "Array", ->
  describe "#indexOf()", ->
    it "should return -1 when the value is not present", ->
      assert.equal -1, [1, 2, 3].indexOf(5)
      assert.equal -1, [1, 2, 3].indexOf(0)
#  describe "#somethingElse()", ->
#    it 'should be awesome', ->
#      fail()

describe "Leonid", ->
  describe "#new(@game)", ->
    it 'should assign and setup the provided game', ->
      class ExampleGame
        constructor: ->
        setup: ->
      game = ExampleGame.new
      leonid = Leonid.new(game)
      expect(game).to_have_been_called().once()

