# URL Shortener

This is a small-but-functional URL Shortener.  Your job is to make it _more_ functional!

This project is meant to be an introduction to Rails "best practices" as well as an overview of the major moving parts of Rails.  Take the time to look at all the various components, especially

- The routing file at `routes.rb`
- The `Link` model at `app/models/link.rb`
- The migrations in the `db/migrate` directory
- The `Gemfile`
- The RSpec tests in the `spec` directory

## Getting Started

1. Fork this repository into your own GitHub account

2. Clone your copy of the repository onto your local machine

3. Install the necessary Ruby gems by running

   ```console
   bundle install --without production
   ```

   **Note**: We use `--without production` because the production environment (Heroku) requires the Ruby PostgreSQL gem (`pg`). This gem can't be installed unless you're running your own local instance of PostgreSQL.

4. Create a `database.yml` file by copying the example SQLite3 configuration file

   ```console
   cp config/database.sqlite3.yml config/database.yml
   ```

   **Note**: We've added `database.yml` to the `.gitignore` file, which is standard practice.  This is so that two developers with different local environments can have different `database.yml` files without interfering with each other.

5. Create an empty database by running

   ```console
   bundle exec rake db:migrate
   ```

6. Create a `.env` file by copying the example file

   ```console
   cp .env.example .env
   ```

   **Note**: We've added `.env` to the `.gitignore` file, which is standard practice.  The `.env` file is meant to contain environment-specific information, e.g., an API key belonging to a particular developer. In production, you'll use `heroku set` and `heroku config` to configure environment variables.

7. Run the Rails application with

   ```console
   bundle exec rails server
   ```

8. Visit [http://localhost:30000](http://localhost:3000) in your browser.
