# bazaar

* This will be the XC Marketplace service where we will learn rails and best practices

# Running the app
We use a postgres db container for development. You'll need to run some database commands
once the db container is running:
  
* `docker-compose up db`
* `docker-compose build web`
* `docker-compose run --rm web rake db:create`
* `docker-compose run --rm web rake db:migrate`

finally you can run the application as:
`docker-compose up web`
### Using docker:
`docker-compose up` should start both the db and the app on your localhost

# Testing the app
* `docker-compose exec web bundle exec rspec <file name>` will test a specific file 
* `docker-compose exec web bundle exec rspec` will test all files


# Deploying to Production
* precompile the assets with `docker-compose exec web rails assets:precompile`
* use `heroku login` to login with heroku
* use `heroku container:push web -a young-thicket-52723` to push image to heroku container repository 
* use `heroku container:release web -a young-thicket-52723` to create a new release using the image 
