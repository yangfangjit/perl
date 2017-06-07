#!/bin/perl

use JSON;
# self-defining class
use Person;

my $person = Person->new('100010','francis',26,'Beijing');
my $person2 = Person->new('100020','fang',23,'Shanghai');

my @persons;

push(@persons,$person->to_hash());
push(@persons,$person2->to_hash());

$json_str = encode_json(\@persons);
print "$json_str\n";

open($fh,">","temp.json");
print $fh "$json_str";
close $fh;
