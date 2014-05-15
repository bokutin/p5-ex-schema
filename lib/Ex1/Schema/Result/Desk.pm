use utf8;
package Ex1::Schema::Result::Desk;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table("desk");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "room_id",
  { data_type => "integer", is_nullable => 1 },
  "name",
  { data_type => "", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2014-05-15 09:09:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cXcW+/+NAVRxS6dqeuYX5g

__PACKAGE__->belongs_to( room => 'Ex1::Schema::Result::Room', 'room_id' );

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
