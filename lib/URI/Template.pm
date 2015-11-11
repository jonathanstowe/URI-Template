use v6;

=begin pod

=head1 NAME

URI::Template - implementation of RFC 6570

=head1 SYNOPSIS

=begin code

use URI::Template;

my $template = URI::Template.new(template => 'http://foo.com{/foo,bar}');

say $template.process(foo => 'baz', bar => 'quux'); # http://foo.com/baz/quux

=end code

=head1 DESCRIPTION

This provides an implementation of
L<RFC6570|https://tools.ietf.org/html/rfc6570> which allows for the
definition of a URI through variable expansion.

=end pod

class URI::Template:ver<v0.0.1>:auth<github:jonathanstowe> {

}
# vim: expandtab shiftwidth=4 ft=perl6
