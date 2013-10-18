window.require.register 'blah': (exports, require, module) ->
  module.export =
    red: '#ff0000'
    white: '#ffffff'
    blue: '#00ff00'
  
