#!/bin/perl

package Property;

sub new{
  my $class = shift;
  my $file = shift;
 
  bless \$file, $class;
}

sub getProperty{
  my $self = shift;
  my $key = shift;
  my $file = $$self;

  if(open(cache,"<$file")){
    while($line = <cache>){
      chomp($line);
      my @temp = split(/=/,$line);
      if(@temp[0] eq $key){
        close(cache);
        return @temp[1];
      }
    }
    close(cache);    
  }
  undef;
}
1;
