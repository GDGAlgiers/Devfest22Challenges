import { fabric } from "fabric";

export function setupCanvas(canvasEl) {
  const canvas = new fabric.Canvas(canvasEl);
  canvas.setBackgroundColor("#ffffff");
  canvas.setWidth(window.innerWidth);
  canvas.setHeight(window.innerHeight - 40);

  const rect = new fabric.Rect({
    top: 200,
    left: window.innerWidth / 2 - 100,
    width: 100,
    height: 100,
    fill: "#ea4334",
  });

  const circle = new fabric.Circle({
    radius: 50,
    fill: "#ea4334",
    left: window.innerWidth / 2 - 50,
    top: 200,
  });

  const circle2 = new fabric.Circle({
    radius: 50,
    fill: "#ea4334",
    left: window.innerWidth / 2 - 100,
    top: 150,
  });

  const heart = new fabric.Group([rect, circle, circle2], {
    angle: -45,
  });

  canvas.add(heart);
}
