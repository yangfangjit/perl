#!/bin/perl

use Log::Log4perl;

use Property;

my $property = Property->new("test.conf");
my $name = $property->getProperty("name");
my $age = $property->getProperty("age");
my $gender = $property->getProperty("gender");
my $adderss = $property->getProperty("address");

print "name: $name, age: $age, gender: $gerder, address: $adderss\n";

my $conf = q(
  log4perl.category.Foo.Bar          = INFO, Logfile, Screen
  log4perl.appender.Logfile          = Log::Log4perl::Appender::File
  log4perl.appender.Logfile.filename = test.log
  log4perl.appender.Logfile.layout   = Log::Log4perl::Layout::PatternLayout
  log4perl.appender.Logfile.layout.ConversionPattern =%p-[%d]-[pid:%P]-%F:%M %L %m%n
  log4perl.appender.Screen           = Log::Log4perl::Appender::Screen
  log4perl.appender.Screen.stderr    = 0
  log4perl.appender.Screen.layout    = Log::Log4perl::Layout::SimpleLayout
);

Log::Log4perl::init(\$conf);

my $log = Log::Log4perl::get_logger("Foo::Bar");

$log->info("Hello perl log!");
$log->error("Hello perl log!");
$log->debug("Hello perl log!");
=pod
log layout 
%c Category of the logging event.
%C Fully qualified package (or class) name of the caller
%d Current date in yyyy/MM/dd hh:mm:ss format
%F File where the logging event occurred
%H Hostname (if Sys::Hostname is available)
%l Fully qualified name of the calling method followed by the
   callers source the file name and line number between 
   parentheses.
%L Line number within the file where the log statement was issued
%m The message to be logged
%m{chomp} The message to be logged, stripped off a trailing newline
%M Method or function where the logging request was issued
%n Newline (OS-independent)
%p Priority of the logging event
%P pid of the current process
%r Number of milliseconds elapsed from program start to logging 
   event
%R Number of milliseconds elapsed from last logging event to
   current logging event 
%T A stack trace of functions called
%x The topmost NDC (see below)
%X{key} The entry 'key' of the MDC (see below)
%% A literal percent (%) sign
=cut
