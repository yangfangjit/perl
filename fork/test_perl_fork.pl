#!/bin/perl
use strict;
use IPC::Semaphore;
use IPC::SysV qw(IPC_PRIVATE S_IRUSR S_IWUSR IPC_CREAT IPC_NOWAIT SEM_UNDO);

our $sem = IPC::Semaphore->new(IPC_PRIVATE, 1, S_IRUSR | S_IWUSR | IPC_CREAT);
$sem->setval(0,1);
# fork returns the child pid to parent, 0 to child or undef if failed to fork.
my $pid = fork();
die "fork failed" unless defined $pid;
if($pid > 0){
  $sem->op(0,-1,SEM_UNDO);
  my $i = 1000;
  while($i > 0){
    print "parent process i = $i\n";
    $i--;
  }
}elsif($pid == 0){
  $sem->op(0,-1,SEM_UNDO);
  my $i = 1000;
  while($i > 0){
    print "child process i = $i\n";
    $i--;
  }
}
$sem->remove() if defined $sem;

# ipcrm -S semkey  移除用semkey创建的信号
# ipcrm -s semid  移除用semid标识的信号
