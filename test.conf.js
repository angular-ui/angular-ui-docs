basePath = '../..';

files = [
  JASMINE,
  JASMINE_ADAPTER,
  'components/jquery/jquery.js',
  'components/angular/angular.js',
  'components/*/*.js',
  '*.js',
  'test/*.js'
];

// Avoid including minified version of angular and other libs again
exclude = [
  'components/*/*.min.js',
  'components/angular-module/*'
];

singleRun = true;
