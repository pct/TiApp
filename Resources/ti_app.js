(function() {
  var AppSync, Template, Tiapp, root,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  root = this;

  Tiapp = root.Tiapp = {
    App: {},
    Model: {},
    View: {},
    Window: {}
  };

  Tiapp.App = (function() {

    function App() {}

    App.prototype.run = function() {
      var main;
      Tiapp.AppSync = new AppSync();
      main = new Tiapp.Window.Main().render();
      return main.open();
    };

    return App;

  })();

  Ti.UI.createActivityIndicator;

  Ti.UI.createButton;

  Ti.UI.createEmailDialog;

  Ti.UI.createImageView;

  Ti.UI.createLabel;

  Ti.UI.createOptionDialog;

  Ti.UI.createPicker;

  Ti.UI.createProgressBar;

  Ti.UI.createScrollView;

  Ti.UI.createTab;

  Ti.UI.createTabGroup;

  Ti.UI.createTableView;

  Ti.UI.createTableViewRow;

  Ti.UI.createToolbar;

  Ti.UI.createView;

  Ti.UI.createWebView;

  Ti.UI.createWindow;

  AppSync = (function() {

    function AppSync(ip, port) {
      this.ip = ip != null ? ip : 'localhost';
      this.port = port != null ? port : 3000;
      this.current = void 0;
      this.code = null;
    }

    AppSync.prototype.wait = function() {
      var _this = this;
      return setTimeout((function() {
        return _this.sync();
      }), 3000);
    };

    AppSync.prototype.sync = function() {
      var appsync, self, xhr;
      self = this;
      appsync = Tiapp.AppSync;
      xhr = Ti.Network.createHTTPClient();
      xhr.setTimeout(40000);
      xhr.onload = function() {
        var error_message, result;
        xhr.abort();
        result = JSON.parse(this.responseText);
        if (!result) {
          this.onerror();
        }
        try {
          if (result.success) {
            if (this.current && this.current.close !== undefined) {
              this.current.close();
            }
            if (self.code !== result.code) {
              self.code = result.code;
              this.current = eval(result.code);
              $.log("Deployed");
            }
          }
          return self.wait();
        } catch (e) {
          error_message = void 0;
          if (e.line === undefined) {
            error_message = e.toString();
          } else {
            error_message = "Line " + e.line + ": " + e.message;
          }
          return $.debug(error_message);
        }
      };
      xhr.onerror = function() {
        alert("HttpRequest ERROR, Please check if server started!");
        if (this.current && this.current.close !== undefined) {
          return this.current.close();
        }
      };
      xhr.open("GET", "http://" + this.ip + ":" + this.port);
      return xhr.send();
    };

    return AppSync;

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

  Tiapp.Window.Main = (function(_super) {

    __extends(Main, _super);

    function Main() {
      return Main.__super__.constructor.apply(this, arguments);
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
        title: 'click to show window2',
        top: 250,
        width: 200,
        height: 50,
        color: '#000'
      });
      return this.bind();
    };

    Main.prototype.open_second_window = function() {
      return this.nav_group.open(new Tiapp.Window.Second().render());
    };

    Main.prototype.bind = function() {
      var _this = this;
      $(this.button).click(function() {
        return _this.open_second_window();
      });
      return this.main_window.addEventListener('close', function(e) {
        return _this.destroy();
      });
    };

    Main.prototype.render = function() {
      this.content_window.add(this.label1);
      this.content_window.add(this.button);
      this.main_window.add(this.nav_group);
      return this.main_window;
    };

    Main.prototype.destroy = function() {
      this.label1 = null;
      this.button = null;
      this.nav_group = null;
      return this.main_window.close();
    };

    return Main;

  })(Template);

  Tiapp.Window.Second = (function(_super) {

    __extends(Second, _super);

    function Second() {
      return Second.__super__.constructor.apply(this, arguments);
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
      var _this = this;
      $(this.button).click(function(e) {
        return alert('hello!');
      });
      return this.window.addEventListener('close', function(e) {
        return _this.destroy();
      });
    };

    Second.prototype.render = function() {
      this.window.add(this.label1);
      this.window.add(this.label2);
      this.window.add(this.button);
      return this.window;
    };

    Second.prototype.destroy = function() {
      this.label1 = null;
      this.label2 = null;
      this.button = null;
      return this.window.close();
    };

    return Second;

  })(Template);

  new Tiapp.App().run();

}).call(this);
