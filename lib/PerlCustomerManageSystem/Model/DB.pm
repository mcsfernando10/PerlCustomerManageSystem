package PerlCustomerManageSystem::Model::DB;

## Entire Model is handled by DB and Schema controls the DB with Result classes for each entity
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'PerlCustomerManageSystem::Schema',
    connect_info => [
        'dbi:SQLite:dbname=PerlCustomerDetail.db',
        '',
        '',
        { sqlite_unicode => 1 },
    ],
);

1;
