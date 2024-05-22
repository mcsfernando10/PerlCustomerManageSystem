package PerlCustomerManageSystem::Controller::Customer;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

__PACKAGE__->config(namespace => 'customer');

sub list :Local {
    my ($self, $c) = @_;

    # Fetch all customer results from DB
    my @customers = $c->model('DB::Customer')->all;
    # Pass the customer objects to the stash
    $c->stash(customers => \@customers);
    $c->stash(template => 'customer/list.tt2');
}

__PACKAGE__->meta->make_immutable;

1;
