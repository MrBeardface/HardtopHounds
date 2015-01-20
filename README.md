## Hardtop Hounds

Social Network for classic car enthusiasts that want to rave, rant, and re-engineer their car projects.

## Getting started with Hardtop Hounds

Hardtop Hounds is ran on the Thin web server using environment variables. You'll need to complete the following steps to get it running.

**Create _.env_ file, with the following information:**

    PORT=5400 (your port number could be any four-digits)
    RACK_ENV=development
    DB_DATABASE=HardtopHounds_development
    DB_USERNAME=localdev
    DB_PASSWORD=password

**Create file _Procfile.dev_, with the following information:**

    web: bundle exec rails server thin -p $PORT -e $RACK_ENV

**In the command line, run:**

    bundle

**Make sure you have the foreman gem instaled:**

    foreman

If the Terminal tells you that it can't find it, you'll have to get it. Go to https://github.com/ddollar/foreman and follow the instructions.


**Get your development and test databases ready:**

    foreman run rake db:setup
    foreman run rake db:migrate RAILS_ENV=test

**Start the application:**

    foreman start -f Procfile.dev

**Go to:**

    localhost:5400/ (use the port number you specified in the .env file)
