package PerlCustomerManageSystem::Schema::Result::Customer;

## Customer Table Result handler

use strict;
use warnings;
use base 'DBIx::Class::Core';

__PACKAGE__->table('customer');

__PACKAGE__->add_columns(
    'id' => {
        data_type => 'integer',
        is_auto_increment => 1,
    },
    'name' => {
        data_type => 'text',
    },
    'email' => {
        data_type => 'text',
    },
    'phone_number' => {
        data_type => 'text',
    },
);

__PACKAGE__->set_primary_key('id');

1;
