###
grunt-commonjs-coffee
https://github.com/tuxracer/grunt-commonjs-coffee

Copyright (c) 2013 Team Delicious, AVOS Systems Inc.
Licensed under the MIT license.
###

path = require 'path'
grunt = require 'grunt'

indentStr = (str) ->
  str.replace(/(\r\n|\n|\r)/g, '\n  ')

isCoffeeScript = (filepath) ->
  filepath.slice(-7) is '.coffee'

wrapDefine = (filepath, content) ->
  definePath = filepath.replace /\.\w+$/, ''
  if isCoffeeScript filepath
    content = indentStr content
    "window.require.register '#{definePath}': (exports, require, module) ->\n  #{content}\n"
  else
    "window.require.register({'#{definePath}': function(exports, require, module) {#{content}}});\n"

module.exports = (grunt) ->
  grunt.registerMultiTask 'commonjs', 'Wrap .coffee and .js files for commonjs.', ->
    @filesSrc.forEach (filepath, index) =>
      content = grunt.file.read path.join filepath
      dest = path.join @files[index].dest
      cwd = @data.cwd.replace './', ''
      # subtract the cwd from pathname and possible leading slash
      filepath = new RegExp(cwd + '\\/?(.*)').exec(filepath)[1]
      wrapped = wrapDefine filepath, content

      grunt.file.write dest, wrapped
