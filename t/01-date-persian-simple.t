#!/usr/bin/perl

use 5.006;
use Test::More tests => 20;
use strict; use warnings;
use Date::Persian::Simple;

is(Date::Persian::Simple->new({year => 1394, month => 1, day => 1})->as_string, '1, Farvardin 1394');
is(Date::Persian::Simple->new({year => 1394, month => 1, day => 1})->to_julian, 2457102.5);
is(Date::Persian::Simple->new({year => 1394, month => 1, day => 1})->day_of_week, 6);
is(sprintf("%04d-%02d-%02d", Date::Persian::Simple->new({year => 1394, month => 1, day => 1})->to_gregorian), '2015-03-21');

ok(Date::Persian::Simple->new->validate_year(1394));
eval { Date::Persian::Simple->new->validate_year(-1394); };
like($@, qr/ERROR: Invalid year \[\-1394\]./);

ok(Date::Persian::Simple->new->validate_month(11));
eval { Date::Persian::Simple->new->validate_month(13); };
like($@, qr/ERROR: Invalid month \[13\]./);

ok(Date::Persian::Simple->new->validate_day(30));
eval { Date::Persian::Simple->new->validate_day(32); };
like($@, qr/ERROR: Invalid day \[32\]./);

is(Date::Persian::Simple->new({ year => 1394, month => 1, day => 1 })->to_julian, 2457102.5);
my $j_date = Date::Persian::Simple->new->from_julian(2455538.5);
is($j_date->year, 1389);
is($j_date->month, 9);
is($j_date->day, 17);

is(sprintf("%04d-%02d-%02d", Date::Persian::Simple->new({ year => 1394, month => 1, day => 1 })->to_gregorian), '2015-03-21');
my $g_date = Date::Persian::Simple->new->from_gregorian(2010, 12, 8);
is($g_date->year, 1389);
is($g_date->month, 9);
is($g_date->day, 17);

is(Date::Persian::Simple->new->days_in_persian_month_year(1, 1394), 31);
ok(!!Date::Persian::Simple->new->is_persian_leap_year(1394) == 0);
