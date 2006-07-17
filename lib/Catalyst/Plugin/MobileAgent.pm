package Catalyst::Plugin::MobileAgent;

use warnings;
use strict;
use NEXT;
use Catalyst::Request;
use HTTP::MobileAgent;

our $VERSION = '0.02';

{
    package Catalyst::Request;
    __PACKAGE__->mk_accessors('mobile_agent');
}

sub prepare_headers {
    my $c = shift;
    $c->NEXT::prepare_headers(@_);
    $c->req->mobile_agent(HTTP::MobileAgent->new($c->req->user_agent));
}

=head1 NAME

Catalyst::Plugin::MobileAgent - HTTP mobile user agent string parser plugin for Catalyst

=head1 SYNOPSIS

    use Catalyst 'MobileAgent';

    if ($c->request->mobile_agent->is_docomo) {
        # do something
    }

=head1 DESCRIPTION

This Plugin is HTTP mobile user agent string parser for Catalyst.

=head1 EXTENDED METHODS

=head2 prepare_headers

We set mobile_agent using L<HTTP::MobileAgent>.

=head1 METHODS

=head2 mobile_agent

Returns an instance of HTTP::MobileAgent.

=head1 SEE ALSO

L<HTTP::MobileAgent>, L<Catalyst::Request>

=head1 AUTHOR

Yoshiki Kurihara, C<< <kurihara@cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2006 Yoshiki Kurihara, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Catalyst::Plugin::MobileAgent
