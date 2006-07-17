use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Catalyst::Plugin::MobileAgent',
    AUTHOR              => 'Yoshiki Kurihara <kurihara@cpan.org>',
    VERSION_FROM        => 'lib/Catalyst/Plugin/MobileAgent.pm',
    ABSTRACT_FROM       => 'lib/Catalyst/Plugin/MobileAgent.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'HTTP::MobileAgent' => 0.22,
        'Catalyst' => 5.30,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Catalyst-Plugin-MobileAgent-*' },
);
