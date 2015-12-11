# Pretty-pictures

This is a pretty simple app to view the top 100 pretty pictures on 500px.

## Prerequisites

You will need the following things properly installed on your computer.

* [Git](http://git-scm.com/)
* [Ruby](https://www.ruby-lang.org/en/) (for integration testing)
* [Bundler](http://bundler.io/)

note: I haven't tested installing this anywhere but my mac, so far, so this may not be strictly true.

## Installation

* `git clone <repository-url>` this repository
* `make install`

## Running / Development

* `make server`
* Visit your app at [http://localhost:3000](http://localhost:3000).

### Runing Tests

* Unit tests:                 `make unit`
* Integration tests:
** Main set:                  `make integration`
** Smoke tests:               `make smoke`
** Meta tests                 `make meta-test`
** All, including meta tests  `make integration-all`
* All tests:                  `make test-all`
