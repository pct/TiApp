(function() {

  Ti.UI.createWindow;

  TiApp.App = {
    init: function() {
      return TiApp.App.initMainWindow();
    },
    initMainWindow: function() {
      var main, nav;
      main = $.Window();
      nav = Ti.UI.iPhone.createNavigationGroup({
        window: TiApp.Views.Main.createMainWindow({
          title: 'Main'
        })
      });
      main.add(nav);
      return main.open();
    }
  };

  TiApp.Helpers.Application = {
    createOrientiationModes: function() {
      var modes;
      modes = [Titanium.UI.PORTRAIT, Titanium.UI.UPSIDE_PORTRAIT, Titanium.UI.LANDSCAPE_LEFT, Titanium.UI.LANDSCAPE_RIGHT];
      return modes;
    }
  };

  Ti.UI.createWindow;

  Ti.UI.createLabel;

  Ti.UI.createButton;

  Ti.UI.createView;

  TiApp.Views.Main.createMainWindow = function(options) {
    var button, label, label4, view, window,
      _this = this;
    window = $.Window(options).setBackgroundColor('#1798cc');
    label = $.Label({
      text: 'Hello, world!',
      top: 100,
      height: 150,
      color: '#fff',
      font: {
        fontSize: 50
      },
      textAlign: 'center'
    });
    button = $.Button({
      title: 'click me!',
      top: 250,
      width: 100,
      height: 50,
      color: '#000'
    });
    label4 = $.Label({
      text: 'Hello, 4Point Design Team!',
      top: 50,
      height: 100,
      color: '#1798cc',
      font: {
        fontSize: 20
      },
      textAlign: 'center'
    });
    view = $.View();
    $(button).click(function() {
      return label4.color = '#fff';
    });
    view.add(label);
    view.add(label4);
    view.add(button);
    window.add(view);
    return window;
  };

}).call(this);
