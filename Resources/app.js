var TiApp;

TiApp = {
  App: {},
  Models: {},
  Helpers: {},
  Views: {
    Main: {}
  }
};

Ti.include('redux.js');

inc('ti_app.js');

TiApp.App.init();
