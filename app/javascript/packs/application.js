// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require uikit

import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import '@fortawesome/fontawesome-free/css/all'

import UIkit from 'uikit/dist/js/uikit.min.js'
import 'uikit/dist/js/uikit-icons.min.js'
window.UIkit = UIkit
// window.$ = UIkit.util.$
// window.$$ = UIkit.util.$$

import jQuery from 'jquery/dist/jquery.min.js'
window.$ = jQuery
window.jQuery = jQuery
