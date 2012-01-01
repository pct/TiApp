(function() {

  $.App = {
    init: function() {
      return $.App.initTabGroup();
    },
    initTabGroup: function() {
      var mainWindow;
      $.App.tabGroup = new TabGroup();
      mainWindow = $.Views.Main.createMainWindow({
        title: 'Main',
        id: 'mainWindow',
        orientationModes: $.Helpers.Application.createOrientiationModes
      });
      $.App.mainWindow = new Tab({
        id: 'mainTab',
        className: 'tabElement',
        title: 'Main',
        window: mainWindow
      });
      $.App.tabGroup.addTab($.App.mainWindow);
      $.App.tabGroup.addEventListener('focus', function(e) {
        $.App.currentTab = e.tab;
        return info($.App.currentTab);
      });
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
      id: 'main-label',
      text: 'Hello, world!',
      color: '#fff',
      fontSize: 40,
      textAlign: 'center'
    });
    view = new View();
    view.add(label);
    window.add(view);
    return window;
  };

}).call(this);
