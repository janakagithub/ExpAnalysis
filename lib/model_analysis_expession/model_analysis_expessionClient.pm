package model_analysis_expession::model_analysis_expessionClient;

use JSON::RPC::Client;
use POSIX;
use strict;
use Data::Dumper;
use URI;
use Bio::KBase::Exceptions;
my $get_time = sub { time, 0 };
eval {
    require Time::HiRes;
    $get_time = sub { Time::HiRes::gettimeofday() };
};

use Bio::KBase::AuthToken;

# Client version should match Impl version
# This is a Semantic Version number,
# http://semver.org
our $VERSION = "0.1.0";

=head1 NAME

model_analysis_expession::model_analysis_expessionClient

=head1 DESCRIPTION


A KBase module: model_analysis_expession
This module evaluate the reconciliation of expression data against FBA


=cut

sub new
{
    my($class, $url, @args) = @_;
    

    my $self = {
	client => model_analysis_expession::model_analysis_expessionClient::RpcClient->new,
	url => $url,
	headers => [],
    };

    chomp($self->{hostname} = `hostname`);
    $self->{hostname} ||= 'unknown-host';

    #
    # Set up for propagating KBRPC_TAG and KBRPC_METADATA environment variables through
    # to invoked services. If these values are not set, we create a new tag
    # and a metadata field with basic information about the invoking script.
    #
    if ($ENV{KBRPC_TAG})
    {
	$self->{kbrpc_tag} = $ENV{KBRPC_TAG};
    }
    else
    {
	my ($t, $us) = &$get_time();
	$us = sprintf("%06d", $us);
	my $ts = strftime("%Y-%m-%dT%H:%M:%S.${us}Z", gmtime $t);
	$self->{kbrpc_tag} = "C:$0:$self->{hostname}:$$:$ts";
    }
    push(@{$self->{headers}}, 'Kbrpc-Tag', $self->{kbrpc_tag});

    if ($ENV{KBRPC_METADATA})
    {
	$self->{kbrpc_metadata} = $ENV{KBRPC_METADATA};
	push(@{$self->{headers}}, 'Kbrpc-Metadata', $self->{kbrpc_metadata});
    }

    if ($ENV{KBRPC_ERROR_DEST})
    {
	$self->{kbrpc_error_dest} = $ENV{KBRPC_ERROR_DEST};
	push(@{$self->{headers}}, 'Kbrpc-Errordest', $self->{kbrpc_error_dest});
    }

    #
    # This module requires authentication.
    #
    # We create an auth token, passing through the arguments that we were (hopefully) given.

    {
	my $token = Bio::KBase::AuthToken->new(@args);
	
	if (!$token->error_message)
	{
	    $self->{token} = $token->token;
	    $self->{client}->{token} = $token->token;
	}
        else
        {
	    #
	    # All methods in this module require authentication. In this case, if we
	    # don't have a token, we can't continue.
	    #
	    die "Authentication failed: " . $token->error_message;
	}
    }

    my $ua = $self->{client}->ua;	 
    my $timeout = $ENV{CDMI_TIMEOUT} || (30 * 60);	 
    $ua->timeout($timeout);
    bless $self, $class;
    #    $self->_validate_version();
    return $self;
}




=head2 exp_analysis

  $return = $obj->exp_analysis($workspace_name, $fba_id, $expression_series_ref, $expression_condition, $expression_cutoff)

=over 4

=item Parameter and return types

=begin html

<pre>
$workspace_name is a model_analysis_expession.workspace_name
$fba_id is a model_analysis_expession.fba_id
$expression_series_ref is a model_analysis_expession.expression_series_ref
$expression_condition is a model_analysis_expession.expression_condition
$expression_cutoff is a model_analysis_expession.expression_cutoff
$return is a model_analysis_expession.FBAPathwayAnalysis
workspace_name is a string
fba_id is a string
expression_series_ref is a string
expression_condition is a float
expression_cutoff is a float
FBAPathwayAnalysis is a reference to a hash where the following keys are defined:
	pathwayType has a value which is a string
	expression_matrix_ref has a value which is a model_analysis_expession.expression_matrix_ref
	expression_condition has a value which is a string
	fbamodel_ref has a value which is a model_analysis_expession.fbamodel_ref
	fba_ref has a value which is a model_analysis_expession.fba_ref
	pathways has a value which is a reference to a list where each element is a model_analysis_expession.FBAPathwayAnalysisPathway
expression_matrix_ref is a string
fbamodel_ref is a string
fba_ref is a string
FBAPathwayAnalysisPathway is a reference to a hash where the following keys are defined:
	pathwayName has a value which is a string
	pathwayId has a value which is an int
	totalModelReactions has a value which is an int
	totalKEGGRxns has a value which is an int
	totalRxnFlux has a value which is an int
	gsrFluxPExpP has a value which is an int
	gsrFluxPExpN has a value which is an int
	gsrFluxMExpP has a value which is an int
	gsrFluxMExpM has a value which is an int
	gpRxnsFluxP has a value which is an int
	reaction_list has a value which is a reference to a list where each element is a model_analysis_expession.FBAPathwayAnalysisReaction
FBAPathwayAnalysisReaction is a reference to a hash where the following keys are defined:
	id has a value which is a string
	name has a value which is a string
	flux has a value which is a float
	gapfill has a value which is an int
	expressed has a value which is an int
	pegs has a value which is a reference to a list where each element is a model_analysis_expession.FBAPathwayAnalysisFeature
FBAPathwayAnalysisFeature is a reference to a hash where the following keys are defined:
	pegId has a value which is a string
	expression has a value which is a float

</pre>

=end html

=begin text

$workspace_name is a model_analysis_expession.workspace_name
$fba_id is a model_analysis_expession.fba_id
$expression_series_ref is a model_analysis_expession.expression_series_ref
$expression_condition is a model_analysis_expession.expression_condition
$expression_cutoff is a model_analysis_expession.expression_cutoff
$return is a model_analysis_expession.FBAPathwayAnalysis
workspace_name is a string
fba_id is a string
expression_series_ref is a string
expression_condition is a float
expression_cutoff is a float
FBAPathwayAnalysis is a reference to a hash where the following keys are defined:
	pathwayType has a value which is a string
	expression_matrix_ref has a value which is a model_analysis_expession.expression_matrix_ref
	expression_condition has a value which is a string
	fbamodel_ref has a value which is a model_analysis_expession.fbamodel_ref
	fba_ref has a value which is a model_analysis_expession.fba_ref
	pathways has a value which is a reference to a list where each element is a model_analysis_expession.FBAPathwayAnalysisPathway
expression_matrix_ref is a string
fbamodel_ref is a string
fba_ref is a string
FBAPathwayAnalysisPathway is a reference to a hash where the following keys are defined:
	pathwayName has a value which is a string
	pathwayId has a value which is an int
	totalModelReactions has a value which is an int
	totalKEGGRxns has a value which is an int
	totalRxnFlux has a value which is an int
	gsrFluxPExpP has a value which is an int
	gsrFluxPExpN has a value which is an int
	gsrFluxMExpP has a value which is an int
	gsrFluxMExpM has a value which is an int
	gpRxnsFluxP has a value which is an int
	reaction_list has a value which is a reference to a list where each element is a model_analysis_expession.FBAPathwayAnalysisReaction
FBAPathwayAnalysisReaction is a reference to a hash where the following keys are defined:
	id has a value which is a string
	name has a value which is a string
	flux has a value which is a float
	gapfill has a value which is an int
	expressed has a value which is an int
	pegs has a value which is a reference to a list where each element is a model_analysis_expession.FBAPathwayAnalysisFeature
FBAPathwayAnalysisFeature is a reference to a hash where the following keys are defined:
	pegId has a value which is a string
	expression has a value which is a float


=end text

=item Description



=back

=cut

 sub exp_analysis
{
    my($self, @args) = @_;

# Authentication: required

    if ((my $n = @args) != 5)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function exp_analysis (received $n, expecting 5)");
    }
    {
	my($workspace_name, $fba_id, $expression_series_ref, $expression_condition, $expression_cutoff) = @args;

	my @_bad_arguments;
        (!ref($workspace_name)) or push(@_bad_arguments, "Invalid type for argument 1 \"workspace_name\" (value was \"$workspace_name\")");
        (!ref($fba_id)) or push(@_bad_arguments, "Invalid type for argument 2 \"fba_id\" (value was \"$fba_id\")");
        (!ref($expression_series_ref)) or push(@_bad_arguments, "Invalid type for argument 3 \"expression_series_ref\" (value was \"$expression_series_ref\")");
        (!ref($expression_condition)) or push(@_bad_arguments, "Invalid type for argument 4 \"expression_condition\" (value was \"$expression_condition\")");
        (!ref($expression_cutoff)) or push(@_bad_arguments, "Invalid type for argument 5 \"expression_cutoff\" (value was \"$expression_cutoff\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to exp_analysis:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'exp_analysis');
	}
    }

    my $result = $self->{client}->call($self->{url}, $self->{headers}, {
	method => "model_analysis_expession.exp_analysis",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{error}->{code},
					       method_name => 'exp_analysis',
					       data => $result->content->{error}->{error} # JSON::RPC::ReturnObject only supports JSONRPC 1.1 or 1.O
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method exp_analysis",
					    status_line => $self->{client}->status_line,
					    method_name => 'exp_analysis',
				       );
    }
}
 
  

sub version {
    my ($self) = @_;
    my $result = $self->{client}->call($self->{url}, $self->{headers}, {
        method => "model_analysis_expession.version",
        params => [],
    });
    if ($result) {
        if ($result->is_error) {
            Bio::KBase::Exceptions::JSONRPC->throw(
                error => $result->error_message,
                code => $result->content->{code},
                method_name => 'exp_analysis',
            );
        } else {
            return wantarray ? @{$result->result} : $result->result->[0];
        }
    } else {
        Bio::KBase::Exceptions::HTTP->throw(
            error => "Error invoking method exp_analysis",
            status_line => $self->{client}->status_line,
            method_name => 'exp_analysis',
        );
    }
}

sub _validate_version {
    my ($self) = @_;
    my $svr_version = $self->version();
    my $client_version = $VERSION;
    my ($cMajor, $cMinor) = split(/\./, $client_version);
    my ($sMajor, $sMinor) = split(/\./, $svr_version);
    if ($sMajor != $cMajor) {
        Bio::KBase::Exceptions::ClientServerIncompatible->throw(
            error => "Major version numbers differ.",
            server_version => $svr_version,
            client_version => $client_version
        );
    }
    if ($sMinor < $cMinor) {
        Bio::KBase::Exceptions::ClientServerIncompatible->throw(
            error => "Client minor version greater than Server minor version.",
            server_version => $svr_version,
            client_version => $client_version
        );
    }
    if ($sMinor > $cMinor) {
        warn "New client version available for model_analysis_expession::model_analysis_expessionClient\n";
    }
    if ($sMajor == 0) {
        warn "model_analysis_expession::model_analysis_expessionClient version is $svr_version. API subject to change.\n";
    }
}

=head1 TYPES



=head2 fba_id

=over 4



=item Description

A string representing a fba_id.


=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 expression_series_ref

=over 4



=item Description

A string representing a expression matrix.


=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 expression_cutoff

=over 4



=item Description

A string representing a expression threshold.


=item Definition

=begin html

<pre>
a float
</pre>

=end html

=begin text

a float

=end text

=back



=head2 expression_condition

=over 4



=item Description

A string representing a expression condition.


=item Definition

=begin html

<pre>
a float
</pre>

=end html

=begin text

a float

=end text

=back



=head2 workspace_name

=over 4



=item Description

A string representing a workspace name.


=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 expression_matrix_ref

=over 4



=item Description

Reference to expression data
@id ws KBaseFeatureValues.ExpressionMatrix


=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 fbamodel_ref

=over 4



=item Description

Reference to metabolic model
@id ws KBaseFBA.FBAModel


=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 fba_ref

=over 4



=item Description

Reference to a FBA object
@id ws KBaseFBA.FBA


=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 FBAPathwayAnalysisFeature

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
pegId has a value which is a string
expression has a value which is a float

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
pegId has a value which is a string
expression has a value which is a float


=end text

=back



=head2 FBAPathwayAnalysisReaction

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
id has a value which is a string
name has a value which is a string
flux has a value which is a float
gapfill has a value which is an int
expressed has a value which is an int
pegs has a value which is a reference to a list where each element is a model_analysis_expession.FBAPathwayAnalysisFeature

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
id has a value which is a string
name has a value which is a string
flux has a value which is a float
gapfill has a value which is an int
expressed has a value which is an int
pegs has a value which is a reference to a list where each element is a model_analysis_expession.FBAPathwayAnalysisFeature


=end text

=back



=head2 FBAPathwayAnalysisPathway

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
pathwayName has a value which is a string
pathwayId has a value which is an int
totalModelReactions has a value which is an int
totalKEGGRxns has a value which is an int
totalRxnFlux has a value which is an int
gsrFluxPExpP has a value which is an int
gsrFluxPExpN has a value which is an int
gsrFluxMExpP has a value which is an int
gsrFluxMExpM has a value which is an int
gpRxnsFluxP has a value which is an int
reaction_list has a value which is a reference to a list where each element is a model_analysis_expession.FBAPathwayAnalysisReaction

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
pathwayName has a value which is a string
pathwayId has a value which is an int
totalModelReactions has a value which is an int
totalKEGGRxns has a value which is an int
totalRxnFlux has a value which is an int
gsrFluxPExpP has a value which is an int
gsrFluxPExpN has a value which is an int
gsrFluxMExpP has a value which is an int
gsrFluxMExpM has a value which is an int
gpRxnsFluxP has a value which is an int
reaction_list has a value which is a reference to a list where each element is a model_analysis_expession.FBAPathwayAnalysisReaction


=end text

=back



=head2 FBAPathwayAnalysis

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
pathwayType has a value which is a string
expression_matrix_ref has a value which is a model_analysis_expession.expression_matrix_ref
expression_condition has a value which is a string
fbamodel_ref has a value which is a model_analysis_expession.fbamodel_ref
fba_ref has a value which is a model_analysis_expession.fba_ref
pathways has a value which is a reference to a list where each element is a model_analysis_expession.FBAPathwayAnalysisPathway

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
pathwayType has a value which is a string
expression_matrix_ref has a value which is a model_analysis_expession.expression_matrix_ref
expression_condition has a value which is a string
fbamodel_ref has a value which is a model_analysis_expession.fbamodel_ref
fba_ref has a value which is a model_analysis_expession.fba_ref
pathways has a value which is a reference to a list where each element is a model_analysis_expession.FBAPathwayAnalysisPathway


=end text

=back



=cut

package model_analysis_expession::model_analysis_expessionClient::RpcClient;
use base 'JSON::RPC::Client';
use POSIX;
use strict;

#
# Override JSON::RPC::Client::call because it doesn't handle error returns properly.
#

sub call {
    my ($self, $uri, $headers, $obj) = @_;
    my $result;


    {
	if ($uri =~ /\?/) {
	    $result = $self->_get($uri);
	}
	else {
	    Carp::croak "not hashref." unless (ref $obj eq 'HASH');
	    $result = $self->_post($uri, $headers, $obj);
	}

    }

    my $service = $obj->{method} =~ /^system\./ if ( $obj );

    $self->status_line($result->status_line);

    if ($result->is_success) {

        return unless($result->content); # notification?

        if ($service) {
            return JSON::RPC::ServiceObject->new($result, $self->json);
        }

        return JSON::RPC::ReturnObject->new($result, $self->json);
    }
    elsif ($result->content_type eq 'application/json')
    {
        return JSON::RPC::ReturnObject->new($result, $self->json);
    }
    else {
        return;
    }
}


sub _post {
    my ($self, $uri, $headers, $obj) = @_;
    my $json = $self->json;

    $obj->{version} ||= $self->{version} || '1.1';

    if ($obj->{version} eq '1.0') {
        delete $obj->{version};
        if (exists $obj->{id}) {
            $self->id($obj->{id}) if ($obj->{id}); # if undef, it is notification.
        }
        else {
            $obj->{id} = $self->id || ($self->id('JSON::RPC::Client'));
        }
    }
    else {
        # $obj->{id} = $self->id if (defined $self->id);
	# Assign a random number to the id if one hasn't been set
	$obj->{id} = (defined $self->id) ? $self->id : substr(rand(),2);
    }

    my $content = $json->encode($obj);

    $self->ua->post(
        $uri,
        Content_Type   => $self->{content_type},
        Content        => $content,
        Accept         => 'application/json',
	@$headers,
	($self->{token} ? (Authorization => $self->{token}) : ()),
    );
}



1;
