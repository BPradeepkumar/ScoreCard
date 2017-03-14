# ========================================================================== #
# lib/ScoreCard/Controller/Login.pm  - Desc											
# Copyright (C) 2017 Exceleron Software, LLC           			             
# ========================================================================== #

package ScoreCard::Controller::Login;

use Moose;
BEGIN { extends 'Catalyst::Controller::ActionRole'; }

# ========================================================================== #

=head1 NAME

ScoreCard::Controller::Login - <<<description of module>>>

=head1 SYNOPSIS

  use Login;
  my $xxx = Login->new;

=head1 DESCRIPTION

The Login module allows you ...
<<<your description here>>>

=head2 methods

=over 4

=cut

# ========================================================================== #

=item C<test>

Params : <<<Input Parameters>>>

Returns: <<<Returns>>>

Desc   : <<<Subroutine Desc>>>

=cut

sub index  : Path METHOD(GET) Args(0) 
{
	my ($self,$c) = @_;

	my $stash = $c->stash;
	$c->stash->{template} = 'login/index.tt';
	$c->forward( $c->view('Web') );

}

__PACKAGE__->meta->make_immutable;

1;

__END__

=back
   
=head1 LICENSE

Copyright (C) 2017 Exceleron Software, LLC

=head1 AUTHORS

Pavan Padaki, <pavan@exceleron.com>

=head1 SEE ALSO

=cut

# vim: ts=4
# vim600: fdm=marker fdl=0 fdc=3

