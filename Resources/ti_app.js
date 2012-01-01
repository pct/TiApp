(function() {

  $.App = {
    init: function() {
      return $.App.initTabGroup();
    },
    initTabGroup: function() {
      var mainWindow;
      $.App.tabGroup = new TabGroup();
      mainWindow = $.Views.Main.createMainWindow({
        title: 'Main'
      });
      $.App.mainWindow = new Tab({
        className: 'tabElement',
        title: 'Main',
        window: mainWindow
      });
      $.App.tabGroup.addTab($.App.mainWindow);
      return $.App.tabGroup.open();
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
        fontSize: 40
      },
      textAlign: 'center'
    });
    view = new View;
    view.add(label);
    window.add(view);
    return window;
  };

}).call(this);
