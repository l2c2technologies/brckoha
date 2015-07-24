#!/usr/bin/perl 
#===============================================================================
#
#           FILE: brc_update_001.pl
#
#          USAGE: ./brc_update_001.pl
#
#    DESCRIPTION: custom script to bulk update BRC's MARC21 records to copy over
#                 unique identifiers mapped at 952$p to 001 to comply with Koha
#                 documentation 
#
#        OPTIONS: ---
#   REQUIREMENTS: ---
#           BUGS: ---
#          NOTES: Based off fix_008.pl (Koha Migration Toolbox) by Chris Cormack 
#         AUTHOR: Indranil Das Gupta (indradg), indradg@l2c2.co.in
#   ORGANIZATION: L2C2 Technologies 
# ACKNOWLEDGMENT: rangi for all his help
#        VERSION: 1.0
#        CREATED: 2015-07-24 03:30:00 IST +0530 
#       REVISION: ---
#        LICENSE: GNU General Public License v3.0 
#   LICENSE_TEXT: http://www.gnu.org/licenses/gpl-3.0.txt
#===============================================================================

use Modern::Perl;

use C4::Context;
use C4::Biblio;

my $context = C4::Context->new();

my $dbh = $context->dbh();

my $query = "SELECT biblio.biblionumber,barcode FROM items,biblioitems,biblio WHERE "
          . "items.biblionumber=biblioitems.biblionumber AND items.biblionumber=biblio.biblionumber "
          . "AND items.barcode  IS NOT NULL AND items.barcode >= 1";

my $sth   = $dbh->prepare($query);

$sth->execute();

while ( my $data = $sth->fetchrow_hashref() ) {
    my $record = GetMarcBiblio( $data->{biblionumber} );
    my $barcode = $data->{barcode};
    my $field  = $record->field('001');
    if ($field) {
        $record->delete_field($field);
    }
    if ($barcode) {
        my $f001 = MARC::Field->new( '001', $barcode );
        $record->insert_fields_ordered($f001);
        ModBiblio( $record, $data->{biblionumber} );
        print "Modifying biblio number: " . $data->{biblionumber} . " with Accn No. " . $barcode . "\n";
    }
}
