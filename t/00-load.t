#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'REST::Google::Translate2' ) || print "Bail out!\n";
}

diag( "Testing REST::Google::Translate2 $REST::Google::Translate2::VERSION, Perl $], $^X" );
