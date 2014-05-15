use Modern::Perl;
use Test::More;

use Ex1::Schema;
# CREATE TABLE room (
#     id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
#     name
# );
# 
# CREATE TABLE desk (
#     id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
#     room_id INTEGER,
#     name
# );
# CREATE INDEX idx_desk_room_id ON desk(room_id);

my $schema = do {
    my $DB_FILE = "ex.sqlite";
    system( "rm $DB_FILE && sqlite3 $DB_FILE < schema.sql" ) == 0 or die;
    Ex1::Schema->connect("dbi:SQLite:dbname=$DB_FILE");
};

{
    my $rs = $schema->resultset('Room');
    $rs->create(
        {
            name => 'room1',
            desks => [
                { name => 'desk1' },
                { name => 'desk2' },
                { name => 'desk3' },
            ],
        },
    );
    is $rs->count, 1;
}

{
    my $rs = $schema->resultset('Room')->search(
        {
            'desks.name' => [ qw(desk1 desk2) ],
        },
        {
            join => 'desks',
        }
    );
    is $rs->count, 2, "not collapsed if attrs has join";
    is 0+($rs->all), 2, "fetch == count";
}

{
    my $rs = $schema->resultset('Room')->search(
        {
            'desks.name' => [ qw(desk1 desk2) ],
        },
        {
            prefetch => 'desks',
        }
    );
    is $rs->count, 1, "not collapsed if attrs has prefetch";
    is 0+($rs->all), 1, "fetch == count";
}

{
    my $rs = $schema->resultset('Room')->search(
        {
            'desks.name' => [ qw(desk1 desk2) ],
        },
        {
            join => 'desks',
            distinct => 1,
        }
    );
    is $rs->count, 1, "collapsed if attrs has join & distinct";
    is 0+($rs->all), 1, "fetch == count";
}

{
    my $rs = $schema->resultset('Room')->search(
        {
            'desks.name' => [ qw(desk1 desk2) ],
        },
        {
            join => 'desks',
            collapse => 1,
        }
    );
    is $rs->count, 1, "collapsed if attrs has join & collapse";
    is 0+($rs->all), 2, "fetch != count! why??";
}

done_testing;
