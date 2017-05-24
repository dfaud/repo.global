use strict;
use warnings;
use 5.010;
 
use Cpanel::JSON::XS qw(encode_json decode_json);

# data structure in Perl
# a reference of a HASH with :
#	internal array
#	internal hash
#	one of the keys, 'gender', without a value 
    
    my $student = {
        name => 'Foo Bar',
        email => 'foo@bar.com',
        gender => undef,
        classes => [
            'Chemistry',
            'Math',
            'Literature',
        ],
        address => {
            city => 'Fooville',
            planet => 'Earth',
        },
    };