#!/usr/bin/perl

use 5.006;
use Test::More tests => 4;
use strict; use warnings;
use Date::Persian::Simple;

is(Date::Persian::Simple->new({year => 1394, month => 1, day => 1})->as_string, '1, Farvardin 1394');
is(Date::Persian::Simple->new({year => 1394, month => 1, day => 1})->to_julian, 2457102.5);
is(Date::Persian::Simple->new({year => 1394, month => 1, day => 1})->day_of_week, 6);
is(Date::Persian::Simple->new({year => 1394, month => 1, day => 1})->to_gregorian, '2015-03-21');
