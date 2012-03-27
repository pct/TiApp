(function() {
  var MyApp, root,
    __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  root = this;

  MyApp = root.MyApp = {
    app: null,
    App: {},
    Model: {},
    View: {}
  };

  MyApp.App = (function() {

    function App() {}

    App.prototype.run = function() {
      var contView, mainView, naviView;
      mainView = new Template.View.MainWindow();
      naviView = mainView.wrapper(new Template.View.NaviGroup());
      contView = naviView.wrapper(new Template.View.ContainerWindow({
        title: 'Test',
        backgroundColor: '#1798cc'
      }));
      contView.wrapper(new MyApp.View.Main());
      return mainView.render();
    };

    return App;

  })();

  MyApp.View.Main = (function(_super) {

    __extends(Main, _super);

    function Main() {
      Main.__super__.constructor.apply(this, arguments);
    }

    Main.prototype.events = {
      'click button': 'changeColor'
    };

    Main.prototype.initialize = function() {
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

    Main.prototype.changeColor = function() {
      return this.get('label2').color = '#fff';
    };

    return Main;

  })(Template.View.Abstract);

  MyApp.app = new MyApp.App();

  MyApp.app.run();

}).call(this);
