import compiler from '@ampproject/rollup-plugin-closure-compiler'
import lebab from '@imbsky/rollup-plugin-lebab'
import resolve from 'rollup-plugin-node-resolve'
import { terser } from 'rollup-plugin-terser'

const lebabOption = [
  'arrow',
  'arrow-return',
  'for-of',
  'for-each',
  'arg-rest',
  'arg-spread',
  'obj-method',
  'obj-shorthand',
  'no-strict',
  'exponent',
  'multi-var',
]

export default {
  input: 'lib/es6/ocaml/sigma.js',
  output: { file: 'javascript/sigma.js', format: 'es' },
  plugins: [compiler(), lebab(lebabOption), resolve(), terser()],
}
