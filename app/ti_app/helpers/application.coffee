TiApp.Helpers.Application =
    createOrientiationModes: ->
        modes = [
            Titanium.UI.PORTRAIT
            Titanium.UI.UPSIDE_PORTRAIT
            Titanium.UI.LANDSCAPE_LEFT
            Titanium.UI.LANDSCAPE_RIGHT
        ]

        modes
