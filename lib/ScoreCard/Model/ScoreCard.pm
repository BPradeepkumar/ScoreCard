package ScoreCard::Model::ScoreCard;

use strict;
use warnings;
use base 'Catalyst::Model::DBI';

__PACKAGE__->config(
  dsn           => 'DBI:Pg:dbname=scorecard-db;host=localhost',
  user          => 'pavan',
  password      => 'pavan123',
  options       => {},
);

=head1 NAME

ScoreCard::Model::ScoreCard - DBI Model Class

=head1 SYNOPSIS

See L<ScoreCard>

=head1 DESCRIPTION

DBI Model Class.

=head1 AUTHOR

PAVAN PADAKI

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
