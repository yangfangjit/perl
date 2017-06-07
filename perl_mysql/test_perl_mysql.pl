#!/bin/perl

use DBI;
use strict;
use Property;

my $property = Property->new("db.conf");
my $database = $property->getProperty("db_schema");
my $hostname = $property->getProperty("db_host");
my $port = $property->getProperty("db_port");
my $user = $property->getProperty("db_user");
my $password = $property->getProperty("db_password");

print "$database $hostname $port $user $password\n";
my $dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";
my $dbh = DBI->connect($dsn, $user, $password);

my $sth = $dbh->prepare("SELECT id FROM student WHERE name = 'yangfang'") or die "prepare statement failed: $dbh->errstr()";
$sth->execute() or die "execution failed: $dbh->errstr()";
print $sth->rows . " rows found.\n";
while (my $ref = $sth->fetchrow_hashref()) {
    print "Found a row: id = $ref->{'id'}\n";
}

my $name;
$sth = $dbh->prepare("call find_name_by_id(1,?)");
$sth->bind_param_inout(1,\$name,45);
$sth->execute();
print "name is $name\n";
