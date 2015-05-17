CuckooForSpecta [![Build Status](https://travis-ci.org/rbaumbach/CuckooForSpecta.svg)](https://travis-ci.org/rbaumbach/CuckooForSpecta)
===============

Cuckoo For Cocoa Dev using Specta, Expecta and OCMock.  This will be used for Cuckoo for Cocoa Dev blog posts on BDD.

## Setup

This project uses [Ruby](https://github.com/sstephenson/rbenv), [Ruby Gems](http://rubygems.org), [Bundler](http://bundler.io), and [Cocoapods](http://cocoapods.org).  Get these installed on your machine and then run the setup.sh script to get [Cocoapods](http://cocoapods.org) and [xcpretty](https://github.com/supermarin/xcpretty) and [Rake](http://rake.rubyforge.org):

```bash
$ ./setup.sh
```

Cocoapods is used to install the Specta/Expecta/OCMock testing frameworks.  Once this has been setup, use the workspace to run the specs (CuckooForSpecta.xcworkspace).

The Specs can be run using the default rake task:

```bash
$ bundle exec rake
```

## Cuckoo For Cocoa Dev
