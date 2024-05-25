package PerlCustomerManageSystem::Controller::Customer;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

__PACKAGE__->config(namespace => 'customer');


sub create :Local {
    my ($self, $c) = @_;

    # Display the form to create new customer
    $c->stash(template => 'customer/create_or_update.tt2');
}

sub create_new :Local {
    my ($self, $c) = @_;
    my $params = $c->request->params;

    if ($c->request->method eq 'POST') {
        my $name    = $params->{name};
        my $email   = $params->{email};
        my $phoneNo = $params->{phone};

	## Create new customer
        my $customer = $c->model('DB::Customer')->create({
            name         => $name,
            email        => $email,
            phone_number => $phoneNo
        });

        # Redirect to a confirmation page or display a success message
        $c->response->redirect($c->uri_for('/customer/success'));
    }
}

sub success :Local {
    my ($self, $c) = @_;
    $c->stash(template => 'customer/success.tt2');
}

sub list :Local {
    my ($self, $c) = @_;

    # Fetch all customer results from DB
    my @customers = $c->model('DB::Customer')->all;
    # Pass the customer objects to the stash
    $c->stash(customers => \@customers);
    $c->stash(template => 'customer/list.tt2');
}

sub update :Local {
    my ($self, $c) = @_;
    my $params = $c->request->params;
    my $id = $params->{id};
    ## Get customer data which is related to passed customer ID
    my $customer = $c->model('DB::Customer')->find($id);
    $c->stash(customer => $customer);
    $c->stash(template => 'customer/create_or_update.tt2');
}

sub update_data :Local {
    my ($self, $c) = @_;
    my $params = $c->request->params;

    ## Fetch the customer by ID
    my $customer = $c->model('DB::Customer')->find($params->{id});

    if ($c->request->method eq 'POST') {
        my $name    = $params->{name};
        my $email   = $params->{email};
        my $phoneNo = $params->{phone};

        ## Update customer record
        $customer->update({
            name         => $name,
            email        => $email,
            phone_number => $phoneNo
        });

        # Redirect to customer list view
        $c->response->redirect($c->uri_for('/customer/list'));
    }
}

__PACKAGE__->meta->make_immutable;

1;
