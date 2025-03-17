// cf. https://commitlint.js.org/#/reference-configuration

import config from '@commitlint/config-conventional';

/** @type {import('@commitlint/types').UserConfig} */
export default {
  // cf. https://github.com/conventional-changelog/commitlint/tree/master/@commitlint/config-conventional
  extends: ['@commitlint/config-conventional'],
  // cf. https://commitlint.js.org/#/reference-rules
  rules: {
    'type-enum': [2, 'always', [...config.rules['type-enum'][2], 'WIP']],
    'type-case': [2, 'always', ['lowercase', 'uppercase']],
    'subject-case': [2, 'always', 'sentence-case'],
    'body-case': [2, 'always', 'sentence-case'],
    'header-max-length': [2, 'always', 72],
  },
};

// Run `pnpm commitlint --print-config` to see how it's configured.
