class Identafy.Routers.Main extends Backbone.Router

  routes:
    '': 'landing'

  landing: ->
    view = new Identafy.Views.MainLanding
    $('#page_content').html view.render().el