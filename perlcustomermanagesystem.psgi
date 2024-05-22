use strict;
use warnings;

use PerlCustomerManageSystem;

my $app = PerlCustomerManageSystem->apply_default_middlewares(PerlCustomerManageSystem->psgi_app);
$app;

