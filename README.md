# umou 'ew-moo'

A simple Rails application that displays a list of items from a 3rd party API

Based on a simple Rails App https://guides.rubyonrails.org/getting_started.html but using [Rspec](https://rspec.info/) to test instead of the built-in Rails testing suite.

- Ruby version
  Using Ruby 3.0.3

- System dependencies

sqlite3 this may already be installed on Mac/Linux, but if you haven't got it, see [How to install](https://www.servermania.com/kb/articles/install-sqlite/)

## Setup

- Configuration

Create the .env file:

`cp .env.example .env`

- Database initialization

`bundle exec rails db:setup`

- Start the server

`bundle exec rails s`

- View the site

http://localhost:3000

- See the available routes in Rails

http://localhost:3007/rails/info/routes

## Testing

- How to run the test suite

`bundle exec rspec`
