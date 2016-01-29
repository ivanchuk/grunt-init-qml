module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"
    watch:
      scripts:
        files: ['**/*.qml']
        tasks: ['command']
        options:
          spawn: false
    command:
      run_cmd:
        cmd: './build-and-run.sh <%=pkg.name%>'

  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-commands"

  grunt.registerTask "default", ["command"]
