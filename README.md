# Pretty-pictures

This is a pretty simple app to view the top 100 pretty pictures on 500px.

## Prerequisites

You will need the following things properly installed on your computer.

* [Git](http://git-scm.com/)
* [Ruby](https://www.ruby-lang.org/en/)
* [Bundler](http://bundler.io/)
* [Poltergeist](https://github.com/teampoltergeist/poltergeist) (Only if you want to run the integratin test suite)

note: I haven't tested installing this anywhere but my mac, so far. This may not be strictly true.

## Installation

* `git clone <repository-url>` this repository
* `make install`

## Running / Development

* `make server`
* Visit your app at [http://localhost:3000](http://localhost:3000).

## How to use it

This will be a short description of how to use the app.

First, visit the url of the app in your web browser.  If you are just running it locally with `make server`,
the url will be [localhost:3000](http://localhost:3000).

You'll be dropped on the home page, where you'll see thumbnails of the 100 most popular photos on 500px.
You can then click on any thumbnail to be taken to that photo's page in the app.
You'll see a larger version of the image, as well as it's description, and how many people have voted for it.

You can also register and log in to the app to vote for, or Like photos yourself!
You can click on the 'Sign Up' link at the top of the page at any time to be taken to the signup form.
You only need to enter a username and password to sign up, but feel free to enter a short bio as well!
After signing up, you'll be taken to the 'connect' page, where you can enter your 500px username and password to
connect your Pretty Pictures account to your 500px account.
The app does not store your 500px credentials - it only uses them to acquire a secure 'access token',
and then discards them.

Once you're connected, you can go back to any Photo page and click on 'I like this!' to vote for it.

## Runing Tests

* Unit tests:                 `make unit`
* Integration tests:
** Main set:                  `make integration`
** Smoke tests:               `make smoke`
** Meta tests                 `make meta-test`
** All, including meta tests  `make integration-all`
* All tests:                  `make test-all`
