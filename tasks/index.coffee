###
grunt-commonjs-coffee
https://github.com/tuxracer/grunt-commonjs-coffee

Copyright (c) 2013 Team Delicious, AVOS Systems Inc.
Licensed under the MIT license.
###

path = require 'path'

# commonjs: {
#   modules: {
#    cwd: 'assets/',
#    src: ['assets/*.js'],
#    dest: 'dist/'
#   }
# }

module.exports = (grunt) ->

  # ==========================================================================
  # TASKS
  # ==========================================================================
  grunt.registerMultiTask 'commonjs', 'Wrap .js files for commonjs.', ->
    @files.forEach (file) ->
      file.src.map (filepath) ->
        definePath = filepath.replace /\.\w+$/, ''
        original = grunt.file.read path.join file.cwd, filepath
        isCoffeeScript = filepath.slice(-7) is '.coffee'

        if isCoffeeScript
          original = original.replace /(\r\n|\n|\r)/g, '\n  '
          grunt.file.write file.dest + filepath, "window.require.define \"#{definePath}\": (exports, require, module) ->\n  #{original}\n"
        else
          grunt.file.write file.dest + filepath, "window.require.define({\"#{definePath}\": function(exports, require, module) {\n#{original}}});\n\n"
