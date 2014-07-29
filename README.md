# URL Shortener

This is a small-but-functional URL Shortener.  Your job is to make it _more_ functional!

## Project Objectives

See the [project wiki](http://github.com/codeunion/url-shortener/wiki) for details about what you should work on.

This project is meant to be an introduction to Rails "best practices" as well as an overview of the major moving parts of Rails.  Take the time to look at all the various components, especially

- The routing file at `routes.rb`
- The `Link` model at `app/models/link.rb`
- The migrations in the `db/migrate` directory
- The `Gemfile`
- The RSpec tests in the `spec` directory

## Getting Started

**Note**: In the commands below, `$` represents your shell prompt, _not_ part of the command to be executed.

1. Fork this repository into your own GitHub account

2. Clone your copy of the repository onto your local machine

3. Install the necessary Ruby gems by running

   ```shell-session
   $ bundle install --without production
   ```

   **Note**: We use `--without production` because the production environment (Heroku) requires the Ruby PostgreSQL gem (`pg`). This gem can't be installed unless you're running your own local instance of PostgreSQL.

4. Create a `database.yml` file by copying the example SQLite3 configuration file

   ```shell-session
   $ cp config/database.sqlite3.yml config/database.yml
   ```

   **Note**: We've added `database.yml` to the `.gitignore` file, which is standard practice.  This is so that two developers with different local environments can have different `database.yml` files without interfering with each other.

5. Create an empty database by running

   ```shell-session
   $ bundle exec rake db:setup
   ```

6. Create a `.env` file by copying the example file

   ```shell-session
   $ cp .env.example .env
   ```

   **Note**: We've added `.env` to the `.gitignore` file, which is standard practice.  The `.env` file is meant to contain environment-specific information, e.g., an API key belonging to a particular developer. In production, you'll use `heroku set` and `heroku config` to configure environment variables.

7. Create the `config/secrets.yml` file, which contains the secret token used to cryptographically sign your application's sessions.  Run:

   ```shell-session
   $ rake secret:create_file
   ```

8. Run the Rails application with

   ```shell-session
   $ bundle exec rails server
   ```

9. Visit [http://localhost:3000](http://localhost:3000) in your browser.
