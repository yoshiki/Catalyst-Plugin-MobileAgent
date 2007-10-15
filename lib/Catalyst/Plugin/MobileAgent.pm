package Catalyst::Plugin::MobileAgent;

use strict;
use warnings;
use NEXT;
use Catalyst::Request;
use HTTP::MobileAgent;

our $VERSION = '0.03';

{
    package Catalyst::Request;
    __PACKAGE__->mk_accessors('mobile_agent');
}

sub prepare_headers {
    my $c = shift;
    $c->NEXT::prepare_headers(@_);
    $c->req->mobile_agent( HTTP::MobileAgent->new( $c->req->headers ) );
}

=head1 NAME

Catalyst::Plugin::MobileAgent - HTTP mobile user agent string parser plugin for Catalyst

=head1 SYNOPSIS

    use Catalyst 'MobileAgent';

    if ($c->request->mobile_agent->is_docomo) {
        # do something
    }

=head1 DESCRIPTION

Catalyst plugin parsed user agent string for mobile in Japan.

=head1 EXTENDED METHODS

=head2 prepare_headers

Sets mobile_agent using L<HTTP::MobileAgent>.

=head1 METHODS

=head2 mobile_agent

Returns an instance of HTTP::MobileAgent.

=head1 SEE ALSO

L<HTTP::MobileAgent>, L<Catalyst::Request>

=head1 AUTHOR

Yoshiki Kurihara, C<< <kurihara at cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2007 Yoshiki Kurihara, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Catalyst::Plugin::MobileAgent
