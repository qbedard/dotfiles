function moveWindow(rect, screen) {
  screen = screen || Screen.main();
  const scr = screen.visibleFrameInRectangle();
  Window.focused().setFrame({
    x: Math.round(scr.x + rect.x * scr.width),
    y: Math.round(scr.y + rect.y * scr.height),
    width: Math.round(scr.width * rect.width),
    height: Math.round(scr.height * rect.height),
  });
}

// Halves
Key.on("h", ["cmd", "control", "shift"], () => {
  moveWindow({ x: 0, y: 0, width: 0.5, heigh: 1.0 });
});

Key.on("l", ["cmd", "control", "shift"], () => {
  moveWindow({ x: 0.5, y: 0, width: 0.5, heigh: 1.0 });
});

Key.on("c", ["cmd", "control", "shift"], () => {
  moveWindow({ x: 0.25, y: 0, width: 0.5, heigh: 1.0 });
});

// Thirds
Key.on("d", ["cmd", "control", "shift"], () => {
  moveWindow({ x: 0, y: 0, width: 1 / 3, heigh: 1.0 });
});

Key.on("f", ["cmd", "control", "shift"], () => {
  moveWindow({ x: 1 / 3, y: 0, width: 1 / 3, heigh: 1.0 });
});

Key.on("g", ["cmd", "control", "shift"], () => {
  moveWindow({ x: 2 / 3, y: 0, width: 1 / 3, heigh: 1.0 });
});

// Two Thirds
Key.on("e", ["cmd", "control", "shift"], () => {
  moveWindow({ x: 0, y: 0, width: 2 / 3, heigh: 1.0 });
});

Key.on("t", ["cmd", "control", "shift"], () => {
  moveWindow({ x: 1 / 3, y: 0, width: 2 / 3, heigh: 1.0 });
});

Key.on("r", ["cmd", "control", "shift"], () => {
  moveWindow({ x: 1 / 6, y: 0, width: 2 / 3, heigh: 1.0 });
});
