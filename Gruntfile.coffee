module.exports = (grunt) ->

	grunt.initConfig

		pkg: grunt.file.readJSON 'package.json'

		resources:
			src: 'src/localtorest.coffee'
			spec: 'src/spec/*.coffee'

		coffee:
			src:
				files:
					'build/localtorest.js': '<%= resources.src %>'
					'build/spec/localtorest-spec.js': '<%= resources.spec %>'

		jasmine:
			pivotal:
				src: 'build/localtorest.js'
				options:
					specs: 'build/spec/localtorest-spec.js'

		watch:
			src:
				files: ['<%= resources.src %>', '<%= resources.spec %>']
				tasks: ['coffee', 'jasmine']

	
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-jasmine'

	grunt.registerTask 'default', ['coffee', 'jasmine']
