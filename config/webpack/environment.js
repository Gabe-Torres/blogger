const { environment } = require('@rails/webpacker')

environment.entry.set('application', './app/javascript/application.js')


// const webpack = require('webpack')
// environment.plugins.append('Provide', new webpack.ProvidePlugin({
//   $: 'jquery',
//   jQuery: 'jquery',
//   Popper: ['popper.js', 'default']
// }))


module.exports = environment
