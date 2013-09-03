module.exports = (grunt) ->
  grunt.initConfig
    nodeunit:
      files: ['test/test.coffee']

    commonjs:
      test:
        cwd: 'test/fixtures/'
        src: ['**/*.coffee', '**/*.js']
        dest: 'tmp/'

    clean:
      test: ['tmp/']

  # Load this plugin's tasks.
  grunt.loadTasks 'tasks'

  # Load installed tasks
  grunt.file.glob
  .sync('./node_modules/grunt-*/tasks')
  .forEach(grunt.loadTasks)

  # Shortcuts
  grunt.registerTask 'test', ['clean', 'commonjs', 'nodeunit']

  # Default task
  grunt.registerTask 'default', 'test'
