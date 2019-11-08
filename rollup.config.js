import compiler from '@ampproject/rollup-plugin-closure-compiler'
import resolve from 'rollup-plugin-node-resolve'
import { terser } from 'rollup-plugin-terser'

export default {
  input: 'lib/es6/ocaml/sigma.js',
  output: { file: 'javascript/sigma.js', format: 'es' },
  plugins: [resolve(), compiler(), terser()],
}
