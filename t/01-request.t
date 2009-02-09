package TestApp;

use Catalyst qw( MobileAgent );
use Test::More 'no_plan';

sub foo : Global {
    my ( $self, $c ) = @_;
    my $class = $c->req->params->{ class };
    isa_ok $c->req->mobile_agent, $class, "$class check.";
}

__PACKAGE__->setup();

package main;

use Catalyst::Test 'TestApp';
use HTTP::Headers;
use HTTP::Request::Common;

my @Tests = (
    {
        class => 'HTTP::MobileAgent::DoCoMo',
        user_agent => 'DoCoMo/2.0 N2001(c10;ser0123456789abcde;icc01234567890123456789)',
    },
    {
        class => 'HTTP::MobileAgent::EZweb',
        user_agent => 'KDDI-TS21 UP.Browser/6.0.2.276 (GUI) MMP/1.1',
    },
    {
        class => 'HTTP::MobileAgent::JPhone',
        user_agent => 'SoftBank/1.0/910T/TJ001 Browser/NetFront/3.3 Profile/MIDP-2.0 Configuration/CLDC-1.1',
    },
);

for my $Test ( @Tests ) {
    my $request = GET(
        '/foo?class=' . $Test->{ class },
        'User-Agent' => $Test->{ user_agent },
    );
    request( $request );
}
