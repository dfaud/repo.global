    use strict;
    use warnings;
     
    my $filename = 'data.txt';
    open(my $fh, '<:encoding(UTF-8)', $filename)
      or die "Could not open file '$filename' $!";
     
    while (my $row = <$fh>) {
      chomp $row;
      print "$row\n";
    }