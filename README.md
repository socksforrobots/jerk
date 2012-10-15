# Jerk

Jerk is insensitive, particularly about URL casing. It is middleware that prevents any uppercase
URLs from making it through in the path of a URL. The default mode is to issue 301 redirects to
a lowercase-normalized version of the requested URL. Query strings are left alone.

## Installation & Usage

    # Gemfile
    gem 'jerk'

    # Shell
    $ bundle

On Rails? You're done. Not on Rails? Just add the middleware wherever you like:

    use Jerk::Redirect
    # or Jerk::Ignore if you don't want redirects

## Contributing

1. [Pork it](http://hotdogscoldbeer.com/austin/eats/)
2. Create your feature branch (`git checkout -b say-do-you-want-to-catch-a-moooovie`)
3. Commit your changes (`git commit -am 'Mah spoon is too big'`)
4. Push to the branch (`git push origin i-am-a-banana`)
5. Create new Pull-My-Finger Request
