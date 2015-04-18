#!perl

use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 1;

BEGIN { use_ok('Date::Persian') || print "Bail out!"; }

diag( "Testing Date::Persian $Date::Persian::VERSION, Perl $], $^X" );
