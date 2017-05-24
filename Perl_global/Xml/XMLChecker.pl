#!/usr/bin/perl
use XML::Checker::Parser;

$XML::Checker::FAIL = \&my_fail;
my $FichierXML = 'ExempleXML.xml';
my $xp         = new XML::Checker::Parser();

$xp->parsefile($FichierXML);

sub my_fail {
    my $code = shift;
    die("[WARNING] Le fichier $FichierXML est non valide\n\t@_\n");
}
