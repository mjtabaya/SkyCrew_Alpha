# README

* Ruby version: 2.3.3p222

* Heroku version: heroku-cli/5.11.0-0c9c92b (windows-amd64) go1.7.5

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```
