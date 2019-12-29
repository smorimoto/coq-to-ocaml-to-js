import compiler from "@ampproject/rollup-plugin-closure-compiler";
import { terser } from "rollup-plugin-terser";

export default {
  input: "lib/es6/_build/default/theories/sigma.js",
  output: { file: "dist/sigma.js", format: "es" },
  plugins: [compiler(), terser()]
};
