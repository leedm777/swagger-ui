class HeaderView extends Backbone.View
  events: {
    'click #show-asterisk-icon'     : 'showAsterisk'
    'click #explore'                : 'showCustom'
    'keyup #input_baseUrl'          : 'showCustomOnKeyup'
    'keyup #input_apiKey'           : 'showCustomOnKeyup'
  }

  initialize: ->


  showAsterisk: (e) ->
    @trigger(
      'update-swagger-ui'
      {discoveryUrl:"http://localhost:8088/ari/api-docs/resources.json", apiKey:""}
    )

  showCustomOnKeyup: (e) ->
    @showCustom() if e.keyCode is 13

  showCustom: (e) ->
    e?.preventDefault()
    @trigger(
      'update-swagger-ui'
      {discoveryUrl: $('#input_baseUrl').val(), apiKey: $('#input_apiKey').val()}
    )

  update: (url, apiKey, trigger = false) ->
    $('#input_baseUrl').val url
    $('#input_apiKey').val apiKey
    @trigger 'update-swagger-ui', {discoveryUrl:url, apiKey:apiKey} if trigger
