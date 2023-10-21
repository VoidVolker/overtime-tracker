const { environment } = require('@rails/webpacker')

// Disable coffee loader due bug "this.getOptions is not a function"
// const coffee =  require('./loaders/coffee')
// environment.loaders.prepend('coffee', coffee)
module.exports = environment
