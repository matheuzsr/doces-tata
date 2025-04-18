import pluginVue from 'eslint-plugin-vue'
import vueTsEslintConfig from '@vue/eslint-config-typescript'
import pluginVitest from '@vitest/eslint-plugin'
import skipFormatting from '@vue/eslint-config-prettier/skip-formatting'

export default [
  {
    name: 'app/files-to-lint',
    files: ['**/*.{ts,mts,tsx,vue}'],
  },

  {
    name: 'app/files-to-ignore',
    ignores: ['**/dist/**', '**/dist-ssr/**', '**/coverage/**'],
  },

  ...pluginVue.configs['flat/essential'],
  ...vueTsEslintConfig(),
  {
    ...pluginVitest.configs.recommended,
    files: ['src/**/__tests__/*'],
  },
  skipFormatting,
  {
    name: 'app/disable-multi-word-rule',
    rules: { 'vue/multi-word-component-names': 'off' },
    files: ['**/*.vue'],
  },
  {
    name: 'app/enforce-line-rules',
    rules: { 'no-multiple-empty-lines': ['error', { max: 1 }] },
  },
  {
    name: 'app/enforce-line-rules',
    rules: {
      'no-multiple-empty-lines': ['error', { max: 1 }],
      semi: ['error', 'never'],
    },
  },
]
