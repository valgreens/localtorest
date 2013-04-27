describe "LocalToRest.js", ->

	it "Should be in the global object", ->
		expect(LocalToRest).toBeDefined()
		expect(LocalToRest).toEqual(window.LocalToRest)

	it "Should have version", ->
		expect(LocalToRest.VERSION).toBe('0.1.0')

	describe 'Model', ->

		it 'Should have Model', ->
			expect(LocalToRest.Model).toBeDefined()

		it 'Should have a unique id', ->
			model = new LocalToRest.Model()
			expect(model.lid).toBe('l1')
			model2 = new LocalToRest.Model()
			expect(model2.lid).toBe('l2')
			expect(model.lid).not.toBe(model2.lid)

		it 'Should have attributes property', ->
			model = new LocalToRest.Model()
			expect(model.attributes).toEqual({})


	describe 'Utils', ->
		describe 'uniqueId', ->

			beforeEach ->
				@id = LocalToRest.utils.uniqueId()
				@id1 = LocalToRest.utils.uniqueId('l')
				@id2 = LocalToRest.utils.uniqueId('l')

			it 'Should return prefix + id', ->
				expect(@id1).toMatch(/^l/)

			it 'Should return id if there is not prefix', ->
				expect(@id).toMatch(/^\d/)

			it 'Should return unique id every time is called', ->
				expect(@id1).not.toBe(@id2)

		describe 'extend', ->

			beforeEach ->
				@a =
					key1: 'value1'
					key2: 'value2'
				@b =
					key3: 'value3'
					key4: 'value4'
				@c = 
					key5: 'value5'
					key6: 'value6'
				@d =
					key3: 'value7'
					key4: 'value8'

			it 'Should return an object if call with one argument', ->
				expect(LocalToRest.utils.extend(@a)).toEqual(@a)

			it 'Should extend first object with second', ->
				expect(LocalToRest.utils.extend(@a, @b).key3).toBe('value3')

			it 'Should extend first object with all objects passed as arguments', ->
				expect(LocalToRest.utils.extend(@a, @b, @c).key5).toBe('value5')

			it 'Should overwrite propierties of the previous objects', ->
				expect(LocalToRest.utils.extend(@a, @b, @d).key3).toBe('value7')

