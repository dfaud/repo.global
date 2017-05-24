#! /usr/bin/perl
use strict;
use warnings;

use XML::Simple;

my $parser = XML::Simple->new( KeepRoot => 1 );

# Creation du fichier resultat
my $FichierResulat = 'resultat.txt';
open( my $FhResultat, '>', $FichierResulat )
  or die("Impossible d'ouvrir le fichier $FichierResulat\n$!");

my $doc = $parser->XMLin('ExempleXML.xml');

# Tout le fichier XML est dans $doc sous forme d'arbre
foreach my $personne ( @{ $doc->{annuaire}->{personne} } ) {
  print {$FhResultat} 'Personne : ';
  print {$FhResultat} $personne->{prenom};
  print {$FhResultat} "\t";
  print {$FhResultat} $personne->{miseajour};
  print {$FhResultat} "\nRole : ";
  print {$FhResultat} $personne->{'role'};
  print {$FhResultat} "\nEmail : ";
  print {$FhResultat} $personne->{email};
  print {$FhResultat} "\nTelephone : ";
  print {$FhResultat} str_if( $personne->{'telephone'}, '' );

  if ( $personne->{langage} ) {
    print {$FhResultat} "\nlangage preferes : ";
    langage_process( $personne->{langage} );
  }
  print {$FhResultat} "\nCommentaire : ";
  print {$FhResultat} $personne->{commentaire};
  print {$FhResultat} "\n", "=" x 10, "\n\n";
}

# Fermeture du fichier
close($FhResultat);

#==============
# Procédures
#==============
sub is_array {
  my ($var) = @_;
  return ( ref($var) eq 'ARRAY' );
}

sub str_if {
  my ( $str, $default ) = @_;
  return $default unless $str;
  return $str;
}

sub langage_process {
  my ($langage) = @_;
  print {$FhResultat} str_if( $langage->{name}, '' );
  return unless $langage->{ModulePreferes};
  if ( is_array( $langage->{ModulePreferes} ) ) {
    foreach my $module ( @{ $langage->{ModulePreferes} } ) {
      module_process($module);
    }
  }
  else {
    module_process( $langage->{ModulePreferes} );
  }
}

sub module_process {
  my ($module) = @_;
  print {$FhResultat} "\n\t- $module";
}

