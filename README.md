1. #### Introduction:

   Sample based on Ruby On Rails 7, TailwindCSS, Stimulus.
2. #### Prerequisites:


   * Ruby 3.1.1
   * Nodejs 20.9.0
   * Yarn
   * Docker & Compose
3. #### Installation & Configuration:

   3.1. Clone repo:

   `git@github.com:thinhbui311/RentalBuilding.git` (ssh)

   3.2. Installation without Docker:


   * Gem bundle: `bundle install`
   * Install FE depedenies: `yarn install`
   * Create, migrate and seed db: `bundle exec rake db:create db:migrate db:seed`
   * Run project: `bin/dev` then access application at `localhost:3000`

   3.3. Installation with Docker:

   * Set the value for `.development.env`
   * Build image: `docker build ./ -t rental_building:development`
   * Start project: `docker compose up`
   * Create, migrate and seed db: `docker compose  run rails_app rake db:create db:migrate db:seed`
   * Access application at `localhost:8000`
4. #### Troubleshooting:

* if problems arise, please contact the creator directly via email (thinhducbui94@gmail.com)
