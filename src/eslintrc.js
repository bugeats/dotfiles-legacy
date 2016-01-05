module.exports = {
    // If you don't use these rules in your JS project, you're an asshole.
    'rules': {
        'brace-style': [2, '1tbs'],
        'camelcase': 1,
        'comma-dangle': [2, 'never'],
        'comma-spacing': [2, { 'before': false, 'after': true }],
        'comma-style': [2, 'last'],
        'eqeqeq': 2,
        'indent': [2, 4],
        'linebreak-style': [2, 'unix'],
        'no-underscore-dangle': 0,
        'no-unused-vars': 0,
        'object-curly-spacing': [2, 'always'],
        'quotes': [2, 'single'],
        'semi': [2, 'always'],
        'semi-spacing': [2, { 'before': false, 'after': true }],
        'space-before-blocks': [2, 'always'],
        'space-before-function-paren': [2, { 'anonymous': 'always', 'named': 'never' }],
        'space-in-parens': [2, 'never'],
        'strict': 0
    },
    'env': {
        'node': true
    },
    'extends': 'eslint:recommended'
};