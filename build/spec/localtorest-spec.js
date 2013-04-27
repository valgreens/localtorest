(function() {
  describe("LocalToRest.js", function() {
    it("Should be in the global object", function() {
      expect(LocalToRest).toBeDefined();
      return expect(LocalToRest).toEqual(window.LocalToRest);
    });
    it("Should have version", function() {
      return expect(LocalToRest.VERSION).toBe('0.1.0');
    });
    describe('Model', function() {
      it('Should have Model', function() {
        return expect(LocalToRest.Model).toBeDefined();
      });
      it('Should have a unique id', function() {
        var model, model2;

        model = new LocalToRest.Model();
        expect(model.lid).toBe('l1');
        model2 = new LocalToRest.Model();
        expect(model2.lid).toBe('l2');
        return expect(model.lid).not.toBe(model2.lid);
      });
      return it('Should have attributes property', function() {
        var model;

        model = new LocalToRest.Model();
        return expect(model.attributes).toEqual({});
      });
    });
    return describe('Utils', function() {
      describe('uniqueId', function() {
        beforeEach(function() {
          this.id = LocalToRest.utils.uniqueId();
          this.id1 = LocalToRest.utils.uniqueId('l');
          return this.id2 = LocalToRest.utils.uniqueId('l');
        });
        it('Should return prefix + id', function() {
          return expect(this.id1).toMatch(/^l/);
        });
        it('Should return id if there is not prefix', function() {
          return expect(this.id).toMatch(/^\d/);
        });
        return it('Should return unique id every time is called', function() {
          return expect(this.id1).not.toBe(this.id2);
        });
      });
      return describe('extend', function() {
        beforeEach(function() {
          this.a = {
            key1: 'value1',
            key2: 'value2'
          };
          this.b = {
            key3: 'value3',
            key4: 'value4'
          };
          this.c = {
            key5: 'value5',
            key6: 'value6'
          };
          return this.d = {
            key3: 'value7',
            key4: 'value8'
          };
        });
        it('Should return an object if call with one argument', function() {
          return expect(LocalToRest.utils.extend(this.a)).toEqual(this.a);
        });
        it('Should extend first object with second', function() {
          return expect(LocalToRest.utils.extend(this.a, this.b).key3).toBe('value3');
        });
        it('Should extend first object with all objects passed as arguments', function() {
          return expect(LocalToRest.utils.extend(this.a, this.b, this.c).key5).toBe('value5');
        });
        return it('Should overwrite propierties of the previous objects', function() {
          return expect(LocalToRest.utils.extend(this.a, this.b, this.d).key3).toBe('value7');
        });
      });
    });
  });

}).call(this);
