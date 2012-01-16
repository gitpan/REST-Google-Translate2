package REST::Google::Translate2;

use strict;
use warnings;

use version; our $VERSION = '1.0.8';

require Exporter;
require REST::Google;
use base qw/Exporter REST::Google/;

__PACKAGE__->service(
    'https://www.googleapis.com/language/translate/v2');

sub responseData {
    my $self = shift;
    my $rd = $self->{responseData} // $self->{data}{translations}[0];
    return bless $rd, 'REST::Google::Translate2::Data';
}

package #hide from CPAN
    REST::Google::Translate2::Data;

require Class::Accessor;
use base qw/Class::Accessor/;
__PACKAGE__->mk_ro_accessors( qw/translatedText/ );

1;


=head1 NAME

REST::Google::Translate2 - OO interface to Google Translate API v2

=head1 VERSION

Version 1.08

=head1 SYNOPSIS

    use REST::Google::Translate2;

    REST::Google->http_referer('http://example.com/');

    my $res = REST::Google::Translate2->new(
        q => 'hello world',
        source => 'en',
        target => 'it',
        key => $Your_Google_API_Key
    );
    die "response status failire" if $res->responseStatus != 200;

    my $translated = $res->responseData->translatedText;
    printf "Italian translation: %s\n", $translated;

=head1 DESCRIPTION

C<REST::Google::Translate2> is an update to Eugen Sobchenko's
L<REST::Google::Translate> module that works with the Google
Translate API v2. Version 1 of this API has been unavailable
since late 2011.

=head1 SEE ALSO

L<REST::Google> - the base class for this module

L<REST::Google::Translate> - earlier version of this module.

=head1 AUTHOR

Marty O'Brien, C<< <mob at cpan.org> >>

Eugen Sobchenko C<< <ejs at cpan.org> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2012, Marty O'Brien.
Copyright 2008, Eugen Sobchenko.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of REST::Google::Translate2
