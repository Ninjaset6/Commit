use DBI
use strict;

open my fh, '<', "Block.txt" or die $!;
my @words=<fh>;
close fh or die $!;

my $request_id=$ARGV[0];

use DBI;
my $dbh = DBI->connect('dbi:Oracle:host=localhost;sid=XE;port=1521', 
               'RAUSHAN', 'raushan', { RaiseError => 1, AutoCommit => 0 });


my $sth = $dbh->prepare("SELECT Request_id, User_id,Request_Desc
                        FROM REQUEST_DETAILS where request_id=$request_id");

						$sth->execute() or die $DBI::errstr;
print "Number of rows found :" + $sth->rows;
while (my @row = $sth->fetchrow_array()) {
   my ($Request_Desc) = @row;
   print "Request_Desc = $Request_Desc\n";
}

$sth->finish();
foreach(@words)
{
$Request_Desc=~s/$_//ig;
}


my $sth = $dbh->prepare("UPDATE REQUEST_DETAILS
                        SET   Request_Desc = $Request_Desc where request_id=$request_id
                       ");
$sth->execute() or die $DBI::errstr;
print "Number of rows updated :" + $sth->rows;
$sth->finish();
$dbh->commit or die $DBI::errstr;




