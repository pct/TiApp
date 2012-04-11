(function() {
  var MyApp, Template, root,
    __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  root = this;

  MyApp = root.MyApp = {
    app: null,
    App: {},
    Model: {},
    View: {},
    Window: {}
  };

  MyApp.App = (function() {

    function App() {}

    App.prototype.run = function() {
      var main;
      main = new MyApp.Window.Main().render();
      return main.open();
    };

    return App;

  })();

  Backbone.setDomLibrary(TiQuery);

  Template = (function(_super) {

    __extends(Template, _super);

    function Template(options) {
      this._configure(options || {});
      this.initialize.apply(this, arguments);
      this.delegateEvents();
    }

    Template.prototype.delegateEvents = function() {};

    return Template;

  })(Backbone.View);

  MyApp.Window.Main = (function(_super) {

    __extends(Main, _super);

    function Main() {
      Main.__super__.constructor.apply(this, arguments);
    }

    Main.prototype.initialize = function() {
      this.main_window = $.Window({
        backgroundColor: '#1798cc'
      });
      this.content_window = $.Window({
        backgroundColor: '#1798cc',
        navBarHidden: false,
        title: 'Main Window'
      });
      this.nav_group = Ti.UI.iPhone.createNavigationGroup({
        window: this.content_window
      });
      this.label1 = $.Label({
        text: '4Point Design',
        top: 100,
        height: 150,
        color: '#fff',
        font: {
          fontSize: 50
        },
        textAlign: 'center'
      });
      this.button = $.Button({
        title: 'click me!',
        top: 250,
        width: 100,
        height: 50,
        color: '#000'
      });
      return this.bind();
    };

    Main.prototype.bind = function() {
      var _this = this;
      return $(this.button).click(function() {
        return _this.open_second_window();
      });
    };

    Main.prototype.render = function() {
      this.content_window.add(this.label1);
      this.content_window.add(this.button);
      this.main_window.add(this.nav_group);
      return this.main_window;
    };

    Main.prototype.open_second_window = function() {
      return this.nav_group.open(new MyApp.Window.Second().render());
    };

    Main.prototype.destroy = function() {};

    return Main;

  })(Template);

  MyApp.Window.Second = (function(_super) {

    __extends(Second, _super);

    function Second() {
      Second.__super__.constructor.apply(this, arguments);
    }

    Second.prototype.initialize = function() {
      this.label1 = $.Label({
        text: 'Hello, world!',
        top: 100,
        height: 150,
        color: '#fff',
        font: {
          fontSize: 50
        },
        textAlign: 'center'
      });
      this.label2 = $.Label({
        text: 'This is the Second Window',
        top: 50,
        height: 100,
        color: '#1798cc',
        font: {
          fontSize: 20
        },
        textAlign: 'center'
      });
      this.button = $.Button({
        title: 'say hello!',
        top: 250,
        width: 100,
        height: 50,
        color: '#000'
      });
      this.window = $.Window({
        backgroundColor: '#333',
        title: 'Second Window',
        backButtonTitle: 'Back'
      });
      return this.bind();
    };

    Second.prototype.bind = function() {
      return $(this.button).click(function(e) {
        return alert('hello!');
      });
    };

    Second.prototype.render = function() {
      this.window.add(this.label1);
      this.window.add(this.label2);
      this.window.add(this.button);
      return this.window;
    };

    Second.prototype.destroy = function() {};

    return Second;

  })(Template);

  new MyApp.App().run();

}).call(this);
