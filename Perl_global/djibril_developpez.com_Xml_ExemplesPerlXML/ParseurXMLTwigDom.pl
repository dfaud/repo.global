#!/usr/bin/perl
use strict;
use warnings;
use XML::Twig;

my $FichierXML = 'ExempleXML.xml';

# Parsing façon DOM, tout en memoire
my $twig = new XML::Twig;

# Creation du fichier resultat
my $FichierResulat = 'resultat.txt';
open( my $FhResultat, '>', $FichierResulat )
  or die("Impossible d'ouvrir le fichier $FichierResulat\n$!");

# creation d'un objet twig
$twig->parsefile($FichierXML);

# racine du XML
my $root = $twig->root;

# Chaque personne
foreach my $TwigPersonne ( $root->children ) {

  # prenom et mise à jour
  print {$FhResultat} "Personne : ", $TwigPersonne->field('prenom'), ' ',
    $TwigPersonne->att('miseajour'), "\n";

  # role, email, telephone, etc
  print {$FhResultat} "Role : ",      $TwigPersonne->field('role'),      "\n";
  print {$FhResultat} "Email : ",     $TwigPersonne->field('email'),     "\n";
  if ( my $Telephone = $TwigPersonne->field('telephone') ) {
    print {$FhResultat} "Telephone : $Telephone\n";
  }

  if ( my $TwigLangage = $TwigPersonne->first_child('langage') ) {
    print {$FhResultat} "Langage prefere : ", $TwigLangage->att('name'), "\n";

    # Module preferes
    foreach my $TwigModule ( $TwigLangage->children('ModulePreferes') ) {
      print {$FhResultat} "\t- ", $TwigModule->text, "\n";
    }
  }

  # commentaire
  print {$FhResultat} "Commentaire : ",
    $TwigPersonne->field('commentaire'), "\n";

  print {$FhResultat} "\n", "=" x 10, "\n\n";
}

close($FhResultat);
