## Official versions
- Ruby: 2.3.1
- Ruby on Rails: 5.1.0.rc1
- PostgreSQL (available on compose.io): 9.5

## Deployment and running locally
This web application is using the remote multi-server automation tool Capistrano.

#### Running locally on a new workstation

Clone the bitbucket repo
```
git clone https://JavaScriptTeddy@bitbucket.org/JavaScriptTeddy/videogamesrate.git
```

Install bundle dependencies
```
bundle install
```

Create local development and production databases and run migrations
```
bundle exec rake db:setup
```

Run application
```
rails server
```

#### Deploying to production server
Once a change has been made, commit the change to git, push to online repository and deploy to production server with the following command
```
cap production deploy
```
