use model_analysis_expession::model_analysis_expessionImpl;

use model_analysis_expession::model_analysis_expessionServer;
use Plack::Middleware::CrossOrigin;



my @dispatch;

{
    my $obj = model_analysis_expession::model_analysis_expessionImpl->new;
    push(@dispatch, 'model_analysis_expession' => $obj);
}


my $server = model_analysis_expession::model_analysis_expessionServer->new(instance_dispatch => { @dispatch },
				allow_get => 0,
			       );

my $handler = sub { $server->handle_input(@_) };

$handler = Plack::Middleware::CrossOrigin->wrap( $handler, origins => "*", headers => "*");
