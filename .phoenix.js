const MOD = ['ctrl', 'alt'];
const DEFAULT_WINDOW_RATIO = 0.85;

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

function getMainScreenSize() {
  return Screen.main().flippedVisibleFrame();
}

function getFullWidth() {
  return getMainScreenSize().width;
}

function getFullHeight() {
  return getMainScreenSize().height;
}

function getHalfWidth() {
  return getFullWidth() / 2;
}

function getHalfHeight() {
  return getFullHeight() / 2;
}

function getDefaultWidth() {
  return getFullWidth() * DEFAULT_WINDOW_RATIO;
}

function getDefaultHeight() {
  return getFullHeight() * DEFAULT_WINDOW_RATIO;
}

var keyBindings = [
  new Key('h', MOD, () => {
      Window.focused().setFrame({
          y: 0,
          x: 0,
          width: getHalfWidth(),
          height: getFullHeight(),
      });
  }),
  new Key('j', MOD, () => {
      Window.focused().setFrame({
          y: (getFullHeight() - getDefaultHeight()) / 2,
          x: (getFullWidth() - getDefaultWidth()) / 2,
          width: getDefaultWidth(),
          height: getDefaultHeight(),
      });
  }),
  new Key('k', MOD, () => {
    Window.focused().maximize();
  }),
  new Key('l', MOD, () => {
      Window.focused().setFrame({
          y: 0,
          x: getHalfWidth(),
          width: getHalfWidth(),
          height: getFullHeight(),
      });
  }),
];

Phoenix.set ({
  openAtLogin: true
});

initialize(keyBindings);
Event.on('screensDidChange', reloadKeys(keyBindings));
