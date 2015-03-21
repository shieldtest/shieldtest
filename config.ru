require './config'
map('/search') { run SearchController }
map('/') { run ApplicationController }
