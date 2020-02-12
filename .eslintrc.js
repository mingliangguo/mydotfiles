module.exports = {
  extends: 'eslint:recommended',
  parserOptions: {
    ecmaVersion: 2017,
  },

  env: {
    es6: true,
    amd: true,
    node: true
  },
  rules: {
    // enable additional rules
    indent: ['error', 2],
    'linebreak-style': ['error', 'unix'],
    quotes: ['error', 'single'],
    semi: ['error', 'always'],

    // override default options for rules from base configurations
    'comma-dangle': ['error', 'always-multiline'],
    'no-cond-assign': ['error', 'always'],

    // disable rules from base configurations
    'no-console': 'off',
  },
};
