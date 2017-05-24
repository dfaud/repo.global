#!/usr/bin/perl
use XML::Writer;
use IO::File;

my $output = new IO::File(">output.xml");

my $writer = new XML::Writer(
  OUTPUT      => $output,
  DATA_INDENT => 3,         # indentation, 3 espace
  DATA_MODE   => 1,         # changement ligne.
  ENCODING    => 'utf-8',
);

$writer->xmlDecl("UTF-8");
$writer->startTag("data");
$writer->startTag( "greeting", "class" => "simple" );
$writer->characters("Hello, world!");
$writer->endTag("greeting");

$writer->startTag( "toto", "name" => "att1" );
$writer->characters("data1");
$writer->endTag("toto");
$writer->comment("Un commentaire");
$writer->emptyTag( 'toto', 'name' => 'att2.jpg' );

$writer->endTag("data");
$writer->end();
$output->close();

