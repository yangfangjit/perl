#!/bin/perl
package Person;

sub new{
  $class = shift;
  my ($id, $name, $age, $address) = @_;
  $self = {
    _id => $id,
    _name => $name,
    _age => $age,
    _address => $address,
  };
  bless $self, $class;
  return $self;
}

sub id{
  my ( $self ) = @_;
  return $self->{_id};
}

sub get_id{
  my ( $self, $id ) = @_;
  my $self->{_id} = $id if defined($id);
  return $self->{_id};
}

sub name{
  my ( $self ) = @_;
  return $self->{_name};
}

sub get_name{
  my ( $self, $name ) = @_;
  $self->{_name} = $name if defined($name);
  return $self->{_name};
}

sub age{
  my ( $self ) = @_;
  return $self->{_age};
}

sub get_age{
  my ( $self, $age) = @_;
  $self->{_age} = $age if defined($age);
  return $self->{_age};
}

sub address{
  my ( $self, $address) = @_;
  $self->{_address} = $address if defined($address);
  return $self->{_address};
}

sub to_hash{
  my ( $self ) = @_;
  my $hash_str = {
    id => $self->{_id},
    name => $self->{_name},
    age => $self->{_age},
    address => $self->{_address},
  };
  return $hash_str;
}
1;

