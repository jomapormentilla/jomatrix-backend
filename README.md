# Jomazon Prime
Phase Five Project for Flatiron School's Software Engineering Bootcamp Program. Jomatrix is a photo sharing application built with a React [frontend](https://github.com/jomapormentilla/jomatrix-frontend) and a Rails API backend . This application allows users to:
- create & manage a personal account
- upload images (AWS S3)
- comment on posts
- like & unlike posts

## Requirements
[Ruby](https://www.ruby-lang.org/en/)

## Installation
Clone this repository into your developer environment, then install the required Ruby Gems using the following command:
```ruby
bundle install
```
In order to populate the database with information, you'll need to first run the migration files, then seed the database using the following commands:
```ruby
rails db:migrate
rails db:seed
```

## Usage
This application uses a React frontend which connects to a Rails API backend. Type the following in your terminal to run the local server:
```ruby
rails s
```

Please see the [frontend](https://github.com/jomapormentilla/jomatrix-frontend) repo for additional instructions. Sign up for an account on the Sign Up page, and you're all set to explore Hogwarts Social Network.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Check out my blog post
You can read about my experience developing this application on my [blog post](https://jomapormentilla.medium.com/jomatrix-react-redux-rails-api-3c6f75dc14c8).

## Video Walkthrough
Click [here](https://youtu.be/hZo0frzrq3g) for a video walkthrough of this application.

## License
This project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
