package ScoreCard;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application.
#
# Note that ORDERING IS IMPORTANT here as plugins are initialized in order,
# therefore you almost certainly want to keep ConfigLoader at the head of the
# list if you're using it.
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory
=head
use Catalyst qw/
    -Debug
    ConfigLoader
    Static::Simple
/;

extends 'Catalyst';
=cut

use Catalyst qw/
-Debug
ConfigLoader
Cache
Static::Simple
Authentication
/;
extends 'Catalyst';
use Cache::Redis;
our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in scorecard.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name => 'ScoreCard',
	'Plugin::ConfigLoader' => {file => __PACKAGE__->path_to('scorecard.pl')},

    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header                      => 1,    # Send X-Catalyst header
	# Session configuration
	#'Plugin::Session' => {

	#	# Use a shorter session cookie name
	#	cookie_name => 'sid',

	#	# If the browser exits, so does the cookie
	#	cookie_expires => 0,

	#	# Session itself expires after 24 hours by default
	#	# when system is idle for 24 hours
	#	expires => (60 * 60 * 24),

	#	# Only send the cookie over SSL, that is, if we're using SSL
	#	secure => 2,

	#	# Redis Reconnect Settings, Try to reconnect every 5000ms up to 60 seconds until success
	#	redis_reconnect => 60,
	#	redis_every     => 5000,
	#},
	# Configure the view
	'View::HTML' => {
		TEMPLATE_EXTENSION => '.tt',
		render_die => 1,
		CATALYST_VAR => 'c',
		#Set the location for HTML files
		INCLUDE_PATH =>	__PACKAGE__->path_to('templates'),
	},

	'View::JSON' => {
		allow_callback => 0,
		expose_stash => [ qw/status/ ]
	},


);
__PACKAGE__->config(
	'View::Web' => {
		INCLUDE_PATH => [
			__PACKAGE__->path_to('templates'),
		],
	},
);

#__PACKAGE__->config->{'Plugin::Authentication'} = {
#    default => {
#        credential => {
#            class          => 'Password',
#            password_field => 'Password',
#            password_type  => 'clear'
#        },
#        store => {
#            class      => 'DBIx::Class',
#            user_class => 'Leave::Employee'
#        }
#    }
#};

# Caching using Redis

__PACKAGE__->config->{'Plugin::Cache'}{backend} = {
	class     => "Cache::Redis",
	reconnect => 60,
	every     => 5000,
};

# Start the application
__PACKAGE__->setup();

=encoding utf8

=head1 NAME

ScoreCard - Catalyst based application

=head1 SYNOPSIS

    script/scorecard_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<ScoreCard::Controller::Root>, L<Catalyst>

=head1 AUTHOR

PAVAN,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
