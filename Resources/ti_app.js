(function() {

  $.App = {
    init: function() {
      return $.App.initMainWindow();
    },
    initMainWindow: function() {
      var main, nav;
      main = new Window;
      nav = Ti.UI.iPhone.createNavigationGroup({
        window: $.Views.Main.createMainWindow({
          title: 'Main'
        })
      });
      main.add(nav);
      return main.open();
    }
  };

  $.Helpers.Application = {
    createOrientiationModes: function() {
      var modes;
      modes = [Titanium.UI.PORTRAIT, Titanium.UI.UPSIDE_PORTRAIT, Titanium.UI.LANDSCAPE_LEFT, Titanium.UI.LANDSCAPE_RIGHT];
      return modes;
    }
  };

  $.Views.Main.createMainWindow = function(options) {
    var label, view, window;
    window = new Window(options).setBackgroundColor('#1798cc');
    label = new Label({
      text: 'Hello, world!',
      color: '#fff',
      font: {
        fontSize: 50
      },
      textAlign: 'center'
    });
    view = new View;
    view.add(label);
    window.add(view);
    return window;
  };

}).call(this);
