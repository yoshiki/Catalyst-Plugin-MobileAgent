use strict;
use warnings;
use inc::Module::Install;

name                'Catalyst-Plugin-MobileAgent';
author              'Yoshiki Kurihara <kurihara@cpan.org>';
version_from        'lib/Catalyst/Plugin/MobileAgent.pm';

requires 'Test::More' => 0;
requires 'HTTP::MobileAgent' => 0.22;
requires 'Catalyst' => 5.30;

auto_install;
WriteAll;
