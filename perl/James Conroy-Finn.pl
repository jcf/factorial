# Author: James Conroy-Finn
sub factorial {
  my $arg = shift;
  return $arg == 1 ? 1 : $arg * factorial($arg - 1);
}

