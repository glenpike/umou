# umou 'ew-moo'

## Introduction

A simple [Ruby on Rails](https://rubyonrails.org/) ('Rails') application that displays a list of items from a 3rd party remote JSON file which is treated as a simple GET-able API.

Based on a simple Rails App https://guides.rubyonrails.org/getting_started.html but using [Rspec](https://rspec.info/) to test instead of the built-in Rails testing suite and an [SQLite](https://www.sqlite.org/) database.

## Dependencies

- Using Ruby 3.0.3 [How to install](https://www.ruby-lang.org/en/documentation/installation/)

- sqlite3 this may already be installed on Mac/Linux, but if you haven't got it, see [How to install](https://www.servermania.com/kb/articles/install-sqlite/)

- [Bundler](https://bundler.io/) for managing Ruby gems. This maybe installed already, but you can use `gem install bundler` if not

## Setup

- Install the required Gems for the app

`bundle install`

- Configuration

Create the .env file:

`cp .env.example .env`

Edit the ARTICLE_API_URL in the .env file to match the URL of the remote JSON file. For example, if your file is https://my-storage/data/articles.json set as follows:

```
ARTICLE_API_URL=https://my-storage/data/articles.json
```

- Database initialization

`bundle exec rails db:setup`

- Start the server

`bundle exec rails s`

- View the site

http://localhost:3000

You should see a page of items with images, titles and like buttons if everything is running

- See the available routes in Rails

http://localhost:3000/rails/info/routes

## Data

The application uses the [ActiveResource (ARes)](https://github.com/rails/activeresource) gem to access a remote JSON file and treat it as a collection of Articles. It is possible to 'like' each Article and a Like is stored in the local database. The Like model has a [belongs_to](https://guides.rubyonrails.org/v3.2/association_basics.html#the-belongs_to-association) association with an Article, but an Article should really have an optional [has_one](https://guides.rubyonrails.org/v3.2/association_basics.html#the-has_one-association) association with a Like. This is not possible with ActiveResource (any associations mean on the ARes server side, not locally). This means there are some helper methods to handle the link between Like and it's Article.

## Testing

- How to run the test suite

`bundle exec rspec`

Alternatively, run `bundle exec guard` and when files are edited and saved, the affected spec's should run.

## Linting

For linting, [Rubocop](https://docs.rubocop.org/rubocop/) is used. This is configured to lint for Rails and RSpec too. It uses the Ruby on Rails own Yaml configuration for Rubocop with a couple of tweaks.

Run the linter with `bundle exec rubocop` and it will give you a list of correctable problems.

You can also ask it to fix problems safely: `bundle exec rubocop -a` or with slightly more risk `bundle exec rubocop -A`
