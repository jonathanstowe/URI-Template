#!perl6

use v6;

use Test;

use JSON::Fast;
use URI::Template;



my IO::Path $data-dir = $*PROGRAM.parent.add('data');

my IO::Path $spec-examples = $data-dir.add('uritemplate-test/spec-examples.json');

my $data-json = $spec-examples.open(:r).slurp-rest;

my $data = from-json($data-json);


for $data.keys.sort -> $label {
    my $level-data = $data{$label};
    my $variables = $level-data<variables>.hash;
    my $tests = $level-data<testcases>;
    subtest {
        for $tests.list -> $test {
            my $ut = URI::Template.new(template => $test[0]);

            my $processed;
            lives-ok { $processed = $ut.process(|$variables); }, "process";
            is $processed, any($test[1].list), "'{ $test[0] }' expands to '{ $test[1].list.join(" or ") }'";
        }

    }, $label;
}



done-testing;
# vim: expandtab shiftwidth=4 ft=perl6
