root = @
LocalToRest = root.LocalToRest = {}

LocalToRest.VERSION = '0.1.0'

silce = Array.prototype.slice

Model = LocalToRest.Model = (attributes, options)->
	@lid = utils.uniqueId('l')
	attr = attributes || {}
	@

utils = LocalToRest.utils = {}

idCounter = 0
utils.uniqueId = (prefix) ->
	id = ++idCounter + ''
	if prefix? then prefix + id else id

utils.extend = (obj, sources...)->
	for source in sources
		for key, prop of source
			obj[key] = prop
	obj