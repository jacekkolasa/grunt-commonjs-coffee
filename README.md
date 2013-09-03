# grunt-commonjs-coffee

Wraps .coffee and .js files into CommonJS modules for client-side usage.

## Getting Started
Install this grunt plugin next to your project's [grunt.js gruntfile][getting_started] with: ``npm install grunt-commonjs-coffee --save-dev``

Then add this line to your project's ``Gruntfile.coffee``:

```coffeescript
grunt.loadNpmTasks 'grunt-commonjs-coffee'
```

###CommonJS loader
You'll need a loader to detect your wrapped packages. You can use this simple [CommonJS loader](https://github.com/chrisabrams/commonjs) which is based off how [brunch.io](http://brunch.io) loads CommonJS packages.

[grunt]: https://github.com/gruntjs/grunt
[getting_started]: https://github.com/gruntjs/grunt/wiki/Getting-started

## Documentation
Configure which files to be copied in your `initConfig`:

```coffeescript
grunt.initConfig

  # ... other configs

  # wrap my modules with define
  commonjs:
    modules:
      cwd: 'assets/'
      src: ['**/*.coffee', '**/*.js']
      dest: 'dist/'

  # ... other configs
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [grunt][grunt].

## License
Copyright (c) 2012 Team Delicious, AVOS Systems Inc., Derek Petersen

Licensed under the MIT license.
