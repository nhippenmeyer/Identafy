class Identafy.Views.MainLanding extends Backbone.View

  template: JST['main/landing']
  id: 'landing_page'

  events:
    'keypress input': 'keypress'
    'click input[type=submit]': 'submit'

  render: ->
    @$el.html @template()
    this

  keypress: (event) ->
    @submit() if event.keyCode is 13

  submit: ->
    return if @$('input[type=submit]').attr 'disabled'
    @$('input[type=submit]').attr 'disabled', 'disabled'
    signup = new Identafy.Models.Signup
      email: @$("input[name='signup[email]']").val()
    signup.save {},
      success: @successCallback
      error: @errorCallback

  successCallback: =>
    @$('.form').removeClass('error').addClass('success').find('.message').html(
      "Thank you for signing up, we'll be in touch with you soon.")
    @$('.form .inputs').hide()
    @$('.form').animate {backgroundColor: 'rgb(200,255,200)'}, 750
    @showMessage()

  errorCallback: (model, xhr) =>
    @$('input[type=submit]').removeAttr 'disabled'
    @$('.form').addClass('error').find('.message').html xhr.responseJSON.errors.email[0]
    @$('.form').animate {backgroundColor: 'rgb(255,200,200)'}, 750
    @showMessage()

  showMessage: ->
    @$('.form .message').animate {opacity: 1}, 750