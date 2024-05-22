package PerlCustomerManageSystem::Model::Customer;
use Moose;
use namespace::autoclean;

extends 'Catalyst::Model';

has 'name' => (
    is  => 'rw',
    isa => 'Str',
);

has 'email' => (
    is  => 'rw',
    isa => 'Str',
);

has 'phone_number' => (
    is  => 'rw',
    isa => 'Str',
);

__PACKAGE__->meta->make_immutable;

1;
