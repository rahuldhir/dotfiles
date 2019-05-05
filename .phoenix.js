const MOD = ['ctrl', 'alt'];
const DEFAULT_WINDOW_RATIO = 0.85;
const SMALL_WINDOW_RATIO = 0.65;

function initialize(keys) {
  for (let i = 0; i < keys.length; i++) {
    keys[i].enable();
  }
}

function reloadKeys(keys) {
  for (let i = 0; i < keys.length; i++) {
    keys[i].disable();
    keys[i].enable();
  }
}

const fullWidth = (screen) => screen.width;
const fullHeight = (screen) => screen.height;

const halfWidth = (screen) => Math.ceil(fullWidth(screen) / 2);
const halfHeight = (screen) => Math.ceil(fullHeight(screen) / 2);

const defaultWidth = (screen) => Math.ceil(fullWidth(screen) * DEFAULT_WINDOW_RATIO);
const defaultHeight = (screen) => Math.ceil(fullHeight(screen) * DEFAULT_WINDOW_RATIO);

const smallWidth = (screen) => Math.ceil(fullWidth(screen) * SMALL_WINDOW_RATIO);
const smallHeight = (screen) => Math.ceil(fullHeight(screen) * SMALL_WINDOW_RATIO);

const keyBindings = [
  new Key('h', MOD, () => {

      let s = Screen.main().flippedVisibleFrame();
      Window.focused().setFrame({
          y: 0,
          x: 0,
          width: halfWidth(s),
          height: fullHeight(s),
      });

  }),
  new Key('j', MOD, () => {

      let s = Screen.main().flippedVisibleFrame();
      let defaultWindowSize = {
          y: Math.ceil((fullHeight(s) - defaultHeight(s)) / 2),
          x: Math.ceil((fullWidth(s) - defaultWidth(s)) / 2),
          width: defaultWidth(s),
          height: defaultHeight(s),
      };

      let smallWindowSize = {
          y: Math.ceil((fullHeight(s) - smallHeight(s)) / 2),
          x: Math.ceil((fullWidth(s) - smallWidth(s)) / 2),
          width: smallWidth(s),
          height: smallHeight(s),
      };

      let windowSize = defaultWindowSize;
      let currentWindowSize = Window.focused().frame();

      let isDefault = JSON.stringify(currentWindowSize) == JSON.stringify(defaultWindowSize);
      let isSmall = JSON.stringify(currentWindowSize) == JSON.stringify(smallWindowSize);

      console.log(JSON.stringify(currentWindowSize), JSON.stringify(smallWindowSize));
      if (isDefault || isSmall) {
        windowSize = smallWindowSize;
      }

      Window.focused().setFrame(windowSize);
  }),
  new Key('k', MOD, () => {
    Window.focused().maximize();
  }),
  new Key('l', MOD, () => {

      let s = Screen.main().flippedVisibleFrame();
      Window.focused().setFrame({
          y: 0,
          x: halfWidth(s),
          width: halfWidth(s),
          height: fullHeight(s),
      });

  }),
];

Phoenix.set ({
  openAtLogin: true
});

initialize(keyBindings);
Event.on('screensDidChange', reloadKeys(keyBindings));
