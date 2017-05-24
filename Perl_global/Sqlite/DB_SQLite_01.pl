    #!/usr/bin/perl
    use strict;
    use warnings;
     
    use DBI;
     
    my $dbfile = "DB01.sqlite";
     
    my $dsn      = "dbi:SQLite:dbname=$dbfile";
    my $user     = "";
    my $password = "";
    my $dbh = DBI->connect($dsn, $user, $password, {
       PrintError       => 0,
       RaiseError       => 1,
       AutoCommit       => 1,
       FetchHashKeyName => 'NAME_lc',
    });
     
    my $sql = <<'END_SQL';
    CREATE TABLE people (
      id       INTEGER PRIMARY KEY,
      fname    VARCHAR(100),
      lname    VARCHAR(100),
      email    VARCHAR(100) UNIQUE NOT NULL,
      password VARCHAR(20)
    )
    END_SQL
     
    $dbh->do($sql);
     
    $dbh->disconnect;