# URI::Template

Implementation of https://tools.ietf.org/html/rfc6570 for Perl 6

## Synopsis

```

use URI::Template;

my $template = URI::Template.new(template => 'http://foo.com{/foo,bar}');

say $template.process(foo => 'baz', bar => 'quux'); # http://foo.com/baz/quux

```

## Description

This provides an implementation of
[RFC 6570](https://tools.ietf.org/html/rfc6570) which allows for the
definition of a URI through variable expansion.

## Installation

Assuming you have a working perl6 installation you should be able to
install this with *ufo* :

    ufo
    make test
    make install

*ufo* can be installed with *panda* for rakudo:

    panda install ufo

Or you can install directly with "panda":

    # From the source directory
   
    panda install .

    # Remote installation

    panda install URI::Template

Other install mechanisms may be become available in the future.

## Support

This should be considered experimental software until such time that
Perl 6 reaches an official release.  However suggestions/patches are
welcomed via github at

   https://github.com/jonathanstowe/URI-Template

## Licence

Please see the LICENCE file in the distribution

(C) Jonathan Stowe 2015



