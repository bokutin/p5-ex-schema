#!/usr/bin/env perl

use rlib;
use Modern::Perl;

use DBIx::Class::Schema::Loader qw(make_schema_at);

make_schema_at(
    'Ex1::Schema',
    {
        dump_directory => './lib',
        generate_pod => 0,
    },
    [ 
        "dbi:SQLite:dbname=ex.sqlite","",""
    ],
);
