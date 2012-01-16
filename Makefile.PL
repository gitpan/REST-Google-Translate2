use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'REST::Google::Translate2',
    AUTHOR              => q{Marty O'Brien <mob@cpan.org>},
    VERSION_FROM        => 'lib/REST/Google/Translate2.pm',
    ABSTRACT_FROM       => 'lib/REST/Google/Translate2.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
	'REST::Google' => '1.0.8',
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'REST-Google-Translate2-*' },
);

print qq[
Google Translate API v2 is no longer a free service.
It now requires a Google API key that is registered
for billing with Google. If you have an API key, run
this test with

    API_KEY=your_api_key make test

Visit the Google APIs console at

    https://code.google.com/apis/console

to obtain an API key.
];
