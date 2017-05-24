#http://www.thegeekstuff.com/2011/09/perl-complex-data-structures/comment-page-1/
#http://www.perlmonks.org/?node_id=1975
#https://perlmaven.com/perl-arrays 

use strict; 
use warnings;

# Perl Array of Arrays
# The following example defines a sample perl array of arrays.
my @tgs =	(
				['article series', 'sed & awk', 'troubleshooting', 'vim', 'bash'],
	    		['ebooks', 'linux 101', 'vim 101', 'nagios core', 'bash 101']
			);
# To access a single element
print "$tgs[0][1]\n";
# Access all the elements one by one as shown below.
print @$_, "\n" foreach ( @tgs );
print "##########\n";

# Assign to our array, an array of array references
my @AoA =	(
           		[ "fred", "barney" ],
           		[ "george", "jane", "elroy" ],
           		[ "homer", "marge", "bart" ],
    		);

print "$AoA[2][2]\n";

# Assign a reference to array of array references
my $ref_to_AoA =	[
        				[ "fred", "barney", "pebbles", "bambam", "dino", ],
        				[ "homer", "bart", "marge", "maggie", ],
        				[ "george", "jane", "elroy", "judy", ],
    				];

print $ref_to_AoA->[2][2];