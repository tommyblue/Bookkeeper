# Bookkeeper [![Build Status](https://secure.travis-ci.org/guard/guard.png?branch=master)](http://travis-ci.org/guard/guard) [![Dependency Status](https://gemnasium.com/tommyblue/Bookkeeper.png)](https://gemnasium.com/tommyblue/Bookkeeper) [![Code Climate](https://codeclimate.com/github/tommyblue/Bookkeeper.png)](https://codeclimate.com/github/tommyblue/Bookkeeper)

Bookkeeper is a Rails engine with the aim of allowing a Rails application (at least 3.1) to handle the purchases you made and their receipt.

## Configure

Add to your Gemfile

    gem 'bookkeeper'

then launch `bundle install`.

Mount the engine wherever you prefer. To do so, add to `config/routes.rb`:

    mount Bookkeeper::Engine => "/bookkeeper"

or, if you prefer:

    mount Bookkeeper::Engine => "/"
    root to: 'bookkeeper::purchases#index'

Bookkeeper uses Twitter Bootstrap markup, if your app doesn't use Bootstrap or you want to overwrite Bookkeeper views, just create the view into `app/views/bookkeeper/`. Use gem's views as template.
