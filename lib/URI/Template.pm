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

=head1 METHODS

=head2 method new

=head2 method process

=end pod

class URI::Template:ver<v0.0.1>:auth<github:jonathanstowe> {
    has Str $.template;

    our grammar Grammar {
        rule TOP {
            <expression>*
        }

        rule expression {
            '{' <operator>? <variable>+ % ',' '}'

        }

        regex operator {
            <reserved>          || 
            <fragment>          || 
            <label-dot>         || 
            <path-slash>        ||
            <path-semicolon>    ||
            <form-ampersand>    ||
            <form-continuation>


        }

        token reserved {
            '+'
        }
        token fragment {
            '#'
        }

        token label-dot {
            '.'
        }

        token path-slash {
            '/'
        }

        token path-semicolon {
            ';'
        }

        token form-ampersand {
            '?'
        }

        token form-continuation {
            '&'
        }

        rule variable {
            <variable-name><var-modifier>?
        }
        token variable-name {
            <.ident>
        }

        rule var-modifier {
            <explode> || <prefix>
        }

        token explode {
            '*'
        }
        token prefix {
            ':' <max-length>
        }
        token max-length {
            \d+
        }
    }

    my class Actions {

    }

    method process(*%vars) returns Str {

    }

}
# vim: expandtab shiftwidth=4 ft=perl6
