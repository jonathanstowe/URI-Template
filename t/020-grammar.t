#!perl6

use v6;
use lib 'lib';

use Test;

use Grammar::Tracer;
use URI::Template;

my $tem;

$tem = URI::Template.new(template => "");

my @templates = <
                    http://example.com/~{username}/
                    http://example.com/dictionary/{term:1}/{term}
                    http://example.com/search{?q,lang}
                    http://www.example.com/foo{?query,number}
                    http://www.example.com/foo{?query,number}
                 >;

for @templates -> $template {
    ok URI::Template::Grammar.parse($template), "matched '$template'";
}

done-testing;
# vim: expandtab shiftwidth=4 ft=perl6
