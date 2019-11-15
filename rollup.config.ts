import compiler from "@ampproject/rollup-plugin-closure-compiler";
import { terser } from "rollup-plugin-terser";

export default {
  input: "lib/es6/ocaml/sigma.js",
  output: { file: "javascript/sigma.js", format: "es" },
  plugins: [compiler(), terser()]
};
