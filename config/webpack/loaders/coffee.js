module.exports = {
  test: /\.coffee(\.erb)?$/,
  use: [{
    loader: 'coffee-loader',
    options: {
      bare: true,
      // transpile: {
      //   presets: [
      //     '@babel/preset-env',
      //     {
      //       // forceAllTransforms: true,
      //       // useBuiltIns: 'entry',
      //       // corejs: 3,
      //       modules: false,
      //       exclude: ['transform-typeof-symbol'],
      //       // esmodules: true
      //     }
      //  ],
      // },
    }
  }]
}
