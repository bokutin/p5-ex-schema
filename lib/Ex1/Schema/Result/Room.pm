use utf8;
package Ex1::Schema::Result::Room;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table("room");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2014-05-15 09:09:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1lWqwJ4uT9OgD9e3ai2uvw

__PACKAGE__->has_many( desks  => 'Ex1::Schema::Result::Desk',  'room_id' );
__PACKAGE__->has_many( chairs => 'Ex1::Schema::Result::Chair', 'room_id' );

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
