grunt = require 'grunt'

grunt.file.defaultEncoding = 'utf8'

module.exports =
  coffee: (test) ->
    test.expect 1

    expected = grunt.file.read 'test/expected/blah.coffee'
    actual = grunt.file.read 'tmp/blah.coffee'

    test.equal actual, expected, 'should prepend CoffeeScript module with define'
    test.done()

  js: (test) ->
    test.expect 1

    expected = grunt.file.read 'test/expected/foo.js'
    actual = grunt.file.read 'tmp/foo.js'

    test.equal actual, expected, 'should wrap JavaScript module with define'
    test.done()
