(function() {
  var LocalToRest, Model, idCounter, root, silce, utils,
    __slice = [].slice;

  root = this;

  LocalToRest = root.LocalToRest = {};

  LocalToRest.VERSION = '0.1.0';

  silce = Array.prototype.slice;

  Model = LocalToRest.Model = function(attributes, options) {
    var attr;

    this.lid = utils.uniqueId('l');
    attr = attributes || {};
    return this;
  };

  utils = LocalToRest.utils = {};

  idCounter = 0;

  utils.uniqueId = function(prefix) {
    var id;

    id = ++idCounter + '';
    if (prefix != null) {
      return prefix + id;
    } else {
      return id;
    }
  };

  utils.extend = function() {
    var key, obj, prop, source, sources, _i, _len;

    obj = arguments[0], sources = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
    for (_i = 0, _len = sources.length; _i < _len; _i++) {
      source = sources[_i];
      for (key in source) {
        prop = source[key];
        obj[key] = prop;
      }
    }
    return obj;
  };

}).call(this);
