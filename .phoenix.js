Phoenix.set ({
  openAtLogin: true
});

// Set "control" and "option" as modifier keys
const MOD = ['ctrl', 'alt'];
// Percent of screen that a default window should occupy
const DEFAULT_WINDOW_RATIO = 0.85;
// Top padding to account for menu bar
const HEIGHT_CORRECTION = 15;

var screen = Screen.main().flippedVisibleFrame();

// Computed sizes
var defaultWidth = screen.width * DEFAULT_WINDOW_RATIO;
var defaultHeight = screen.height * DEFAULT_WINDOW_RATIO;
var halfWidth = screen.width / 2;
var halfHeight = screen.height / 2;

// Configured window positions
var windowLocations = {
    default: {
        y: ((screen.height - defaultHeight) / 2) + HEIGHT_CORRECTION,
        x: (screen.width - defaultWidth) / 2,
        width: defaultWidth,
        height: defaultHeight
    },
    full: {
        y: 0,
        x: 0,
        width: screen.width,
        height: screen.height
    },
    left: {
        y: 0,
        x: 0,
        width: halfWidth,
        height: screen.height
    },
    right: {
        y: 0,
        x: halfWidth,
        width: halfWidth,
        height: screen.height
    },
}

// Move focused window to left
var leftHalf = new Key('h', MOD, () => {
    Window.focused().setFrame(windowLocations.left);
});

// Move focused window to right
var rightHalf = new Key('l', MOD, () => {
    Window.focused().setFrame(windowLocations.right);
});

// Move focused window to center and resize to default window size
var centerWindow = new Key('j', MOD, () => {
    Window.focused().setFrame(windowLocations.default);
});

// Resize window to fit full screen
var maximizeWindow = new Key('k', MOD, () => {
    Window.focused().setFrame(windowLocations.full);
});
