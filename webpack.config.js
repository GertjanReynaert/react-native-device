var path = require('path');

module.exports = {
  watch: true,
  entry: path.join(__dirname, '/src/Device.es6'),
  output: {
    path: path.join(__dirname, '/ouput/'),
    filename: 'Device.js',
  },
  module: {
    loaders: [
      { test: /\.(js|es6)$/, exclude: /node_modules/, loader: "babel-loader"}
    ]
  },
  externals: [require('./ignore-modules')]
};
