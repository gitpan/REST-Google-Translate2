# adapted from t/05-translate.t from REST::Google distribution

use strict;

use Test::More tests => 4;

use REST::Google::Translate2;

REST::Google->http_referer('http://www.cpan.org');

my $API_KEY = $ENV{API_KEY};
if (!$API_KEY) {
    warn qq[
Google Translate API v2 is no longer a free service.
It now requires a Google API key that is registered
for billing with Google. If you have an API key, run
this test with

    API_KEY=your_api_key make test

];
	
  SKIP: {
      skip "API key required for translate test.", 4;
    }
    exit 1;
} else {
    # API key specified. By running this test you will be billed
    # for 8 characters worth of translation services.
}

use Data::Dumper;

# The official google blog
my $en_text_ok = 'hello';
my $it_text_ok = 'ciao';

my $res = REST::Google::Translate2->new(
    'q' => $en_text_ok,
    'source' => 'en',
    'target' => 'it',
    'key' => $API_KEY,
);

is($res->responseStatus, 200, "response ok");
ok(defined $res, "result");

my $it_text = $res->responseData->translatedText;

is( $it_text,  $it_text_ok, "translate ok");

$res = REST::Google::Translate2->new(
    'q' => $it_text,
    'source' => 'it',
    'target' => 'en',
    'key' => $API_KEY,
);

my $en_text = $res->responseData->translatedText;

is( $en_text,  $en_text_ok, "translate ok");

