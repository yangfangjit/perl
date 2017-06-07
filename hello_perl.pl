#!/bin/perl
print "hello perl!\n";
my $var = "hello world";
my @term = split(/ /,$var);
foreach $word(@term) {
  print "$word\n";
}
