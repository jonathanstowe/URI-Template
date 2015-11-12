#!perl6

use v6;
use lib 'lib';

use Test;

use Grammar::Tracer;
use URI::Template;



my URI::Template $tem = URI::Template.new();

my @templates = <
                    http://example.com/~{username}/
                    http://example.com/dictionary/{term:1}/{term}
                    http://example.com/zub/{things*}
                    http://example.com/search{?q,lang}
                    http://www.example.com/foo{?query,number}
                    http://www.example.com/foo{?query,number}
                 >;

for @templates -> $template {
    my $actions = URI::Template::Actions.new;
    ok my $res = URI::Template::Grammar.parse($template, :$actions), "matched '$template'";
    ok  any($res.made) ~~ URI::Template::Expression, "and we have made something with strings and expressions";
}

done-testing;
# vim: expandtab shiftwidth=4 ft=perl6
