# Twitter API

The Twitter API is an application that sends a twitter to your registered account with information about the climate of the city you choose. Don't let your followers go out on the street without an umbrella.


The application uses https://openweathermap.org/ as a weather consultation service. So you need to get the key to use that service.

### Installation

PostgreSQL is required

* ruby 2.7
* rails 6.3

After cloning the repository

```ruby

bundle install

rails db:create db:migrate #for start database and run migrations 
rails docs:generate #for run documentation
bundle exec rspec #for run coverage

```

### API Documentation

To view the documentation, start the server (`rails s`) and access the `/api/docs`
(for example: `https://localhost/api/docs`) directory

### Coverage

To check coverage, access the file `/coverage/index.html`

### Quality

Run `rubycritic` to access report quality.