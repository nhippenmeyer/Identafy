window.Identafy =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new @Routers.Main()
    Backbone.history.start pushState: true

$(document).ready ->
  Identafy.initialize()
