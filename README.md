[![Code Climate](https://codeclimate.com/github/LasVegasRubyGroup/podium.png)](https://codeclimate.com/github/LasVegasRubyGroup/podium)

podium
======

Our hacknight project, a future replacement for soapbox.

To get started developing:

1. Make a fork of the [LasVegasRubyGroup/podium](https://github.com/LasVegasRubyGroup/podium) repository on your github account.
2. Clone the github repository to your computer.
3. Install Ruby 2.1.1.  This version is specified in our Gemfile.
4. Follow the [Nokogiri installation instructions](http://nokogiri.org/tutorials/installing_nokogiri.html) to make sure you install all the prerequisites for Nokogiri.  You don't have to actually install Nokogiri yet; bundler will do that for us. 
5. Run `gem install bundler`.
6. Run `bundle`
7. Install node.js and phantomjs.  These are external packages that our test suite uses and cannot be installed with bundler.
8. Install PostgreSQL and create databses named `podium_test` and `podium_development`.
9. Run `rake` and make sure all the examples succeed.
