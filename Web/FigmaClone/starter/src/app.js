import "./style.css";

import { setupCanvas } from "./canvas.js";

document.querySelector("#app").innerHTML = `
  <div class="logo">
    <a href="https://vitejs.dev" target="_blank">
      <img src="/vite.svg" class="logo" alt="Vite logo" />
    </a>
    Figma Clone
  </div>
  <main>
    <canvas id="canvas" width="800" height="560"></canvas>
  </main>
`;

setupCanvas("canvas");
