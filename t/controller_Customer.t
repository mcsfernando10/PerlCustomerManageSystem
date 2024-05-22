use strict;
use warnings;
use Test::More;


use Catalyst::Test 'PerlCustomerManageSystem';
use PerlCustomerManageSystem::Controller::Customer;

ok( request('/customer')->is_success, 'Request should succeed' );
done_testing();
