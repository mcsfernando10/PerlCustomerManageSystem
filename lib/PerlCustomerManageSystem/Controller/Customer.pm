package PerlCustomerManageSystem::Controller::Customer;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

__PACKAGE__->config(namespace => 'customer');


sub create :Local :FormConfig {
    my ($self, $c) = @_;

    # Display the form to create new customer
    $c->stash(template => 'customer/create.tt2');
}

sub createnew :Local {
    my ($self, $c) = @_;
    my $params = $c->request->params;

    if ($c->request->method eq 'POST') {
        my $name  = $params->{name};
        my $email = $params->{email};
        my $phoneNo = $params->{phone};

        my $customer = $c->model('DB::Customer')->create({
            name  => $name,
            email => $email,
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

__PACKAGE__->meta->make_immutable;

1;
