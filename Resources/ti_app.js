(function() {
  var MyApp, Timy, eventSplitter, getValue,
    __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  MyApp = {
    app: null,
    App: {},
    Model: {},
    View: {}
  };

  Timy = {
    View: {}
  };

  Backbone.setDomLibrary(TiQuery);

  getValue = function(object, prop) {
    if ((object != null ? object.prop : void 0) == null) return null;
    if (_.isFunction(object[prop])) {
      return object[prop]();
    } else {
      return object[prop];
    }
  };

  eventSplitter = /^(\S+)\s*(.*)$/;

  Timy.View.Abstract = (function(_super) {

    __extends(Abstract, _super);

    Abstract.prototype.view = null;

    Abstract.prototype.elements = {};

    Abstract.prototype.eventListeners = {};

    function Abstract(options) {
      this.cid = _.uniqueId('view');
      this._configure(options || {});
      this.initialize.apply(this, arguments);
      this.delegateEvents();
    }

    Abstract.prototype.wrapper = function(view) {
      return this.view = view;
    };

    Abstract.prototype.add = function(name, el) {
      return this.elements[name] = el;
    };

    Abstract.prototype.get = function(name) {
      if (_.has(this.elements, name)) return this.elements[name];
    };

    Abstract.prototype.destroy = function() {
      return delete this.view;
    };

    Abstract.prototype.render = function() {
      var el, name, view, _ref;
      view = $.View();
      _ref = this.elements;
      for (name in _ref) {
        el = _ref[name];
        view.add(el);
      }
      return view;
    };

    Abstract.prototype.delegateEvents = function(events) {
      var el, eventName, key, match, method, selector, _results;
      if (!(events || (events = this.events))) return;
      this.undelegateEvents();
      _results = [];
      for (key in events) {
        method = events[key];
        if (!_.isFunction(method)) method = this[events[key]];
        if (!method) {
          throw new Error("Event \"" + events[key] + "\" does not exist");
        }
        match = key.match(eventSplitter);
        eventName = match[1];
        selector = match[2];
        method = _.bind(method, this);
        el = _.has(this.elements, selector) ? this.elements[selector] : null;
        if (el) {
          $(el).bind(eventName, method);
          if (!_.has(this.eventListeners, selector)) {
            this.eventListeners[selector] = {};
          }
          _results.push(this.eventListeners[selector][events] = method);
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };

    Abstract.prototype.undelegateEvents = function() {
      var el, event, events, method, name, _ref, _results;
      _ref = this.eventListeners;
      _results = [];
      for (name in _ref) {
        events = _ref[name];
        el = this.elements[name];
        _results.push((function() {
          var _results2;
          _results2 = [];
          for (event in events) {
            method = events[event];
            _results2.push($(el).unbind(event, method));
          }
          return _results2;
        })());
      }
      return _results;
    };

    return Abstract;

  })(Backbone.View);

  Timy.View.Window = (function(_super) {

    __extends(Window, _super);

    function Window() {
      Window.__super__.constructor.apply(this, arguments);
    }

    Window.prototype.render = function() {
      return $.Window(this.options);
    };

    return Window;

  })(Timy.View.Abstract);

  Timy.View.NaviGroup = (function(_super) {

    __extends(NaviGroup, _super);

    function NaviGroup() {
      NaviGroup.__super__.constructor.apply(this, arguments);
    }

    NaviGroup.prototype.render = function() {
      return Ti.UI.iPhone.createNavigationGroup({
        window: this.view.render()
      });
    };

    return NaviGroup;

  })(Timy.View.Abstract);

  MyApp.View.MainWindow = (function(_super) {

    __extends(MainWindow, _super);

    function MainWindow() {
      MainWindow.__super__.constructor.apply(this, arguments);
    }

    MainWindow.prototype.render = function() {
      var window;
      window = MainWindow.__super__.render.call(this);
      window.add(this.view.render());
      return window.open();
    };

    return MainWindow;

  })(Timy.View.Window);

  Timy.View.ContainerWindow = (function(_super) {

    __extends(ContainerWindow, _super);

    function ContainerWindow() {
      ContainerWindow.__super__.constructor.apply(this, arguments);
    }

    ContainerWindow.prototype.render = function() {
      var window;
      window = ContainerWindow.__super__.render.call(this);
      window.add(this.view.render());
      return window;
    };

    return ContainerWindow;

  })(Timy.View.Window);

  MyApp.View.Hello = (function(_super) {

    __extends(Hello, _super);

    function Hello() {
      Hello.__super__.constructor.apply(this, arguments);
    }

    Hello.prototype.events = {
      'click button': 'changeColor'
    };

    Hello.prototype.initialize = function() {
      this.add('label1', $.Label({
        text: 'Hello, world!',
        top: 100,
        height: 150,
        color: '#fff',
        font: {
          fontSize: 50
        },
        textAlign: 'center'
      }));
      this.add('label2', $.Label({
        text: 'Hello, 4Point Design Team!',
        top: 50,
        height: 100,
        color: '#1798cc',
        font: {
          fontSize: 20
        },
        textAlign: 'center'
      }));
      return this.add('button', $.Button({
        title: 'click me!',
        top: 250,
        width: 100,
        height: 50,
        color: '#000'
      }));
    };

    Hello.prototype.changeColor = function() {
      return this.get('label2').color = '#fff';
    };

    return Hello;

  })(Timy.View.Abstract);

  MyApp.App = (function() {

    function App() {}

    App.prototype.run = function() {
      var contView, mainView, naviView;
      mainView = new MyApp.View.MainWindow();
      naviView = mainView.wrapper(new Timy.View.NaviGroup());
      contView = naviView.wrapper(new Timy.View.ContainerWindow({
        title: 'Test',
        backgroundColor: '#1798cc'
      }));
      contView.wrapper(new MyApp.View.Hello());
      return mainView.render();
    };

    return App;

  })();

  MyApp.app = new MyApp.App();

  MyApp.app.run();

}).call(this);
