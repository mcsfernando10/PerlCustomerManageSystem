package PerlCustomerManageSystem::Controller::Customer;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

__PACKAGE__->config(namespace => 'customer');

sub list :Local {
    my ($self, $c) = @_;

    # Create some customer objects
    my @customers = (
        PerlCustomerManageSystem::Model::Customer->new(name => 'Chinthaka Suren', email => 'mcsfernando10@gmail.com', phone_number => '+94717251884'),
        PerlCustomerManageSystem::Model::Customer->new(name => 'Shan Jayasinghe', email => 'shan.jayasinghe@gmail.com', phone_number => '+94717251889'),
	PerlCustomerManageSystem::Model::Customer->new(name => 'Kavisha Silva', email => 'kavisha.silva@gmail.com', phone_number => '+94717251880')
    );

    # Pass the user objects to the stash
    $c->stash(customers => \@customers);
    $c->stash(template => 'customer/list.tt2');
}

__PACKAGE__->meta->make_immutable;

1;
