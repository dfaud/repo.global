#!/usr/bin/perl
use XML::SAX::ParserFactory;
use XML::Validator::Schema;

my $FichierXSD = 'ExempleXSD.xsd';
my $document   = 'ExempleXML.xml';

my $validator = XML::Validator::Schema->new( file => $FichierXSD );
my $parser = XML::SAX::ParserFactory->parser( Handler => $validator );

eval { $parser->parse_uri($document); };
die $@ if $@;

print "Le fichier $document est valide\n";
