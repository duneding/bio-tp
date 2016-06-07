#!/bin/perl -w

#use Bio::DB::GenBank;
#$db_obj = Bio::DB::GenBank->new;
#$seq_obj = $db_obj->get_Seq_by_id(61743917); #CYP11B1
#print $seq_obj->seq,"\n";

use Bio::SeqIO;
use Bio::Seq;
use Data::Dumper;
use Bio::Tools::CodonTable;

my $fastaId = "gi|61743917|ref|NM_000497.3|";
my $fastaDesc = "Homo sapiens cytochrome P450 family 11 subfamily B member 1 ".
				"(CYP11B1), transcript variant 1, mRNA";
my $pathIN = "data/input/CYP11B1_mRNA.gb";
my $formatIN = "genbank";
my $pathOUT = ">data/output/CYP11B1_mRNA.fasta";
my $formatOUT = 'fasta';
my $alphabet = "dna";


$seqio_obj = Bio::SeqIO->new(-file => $pathIN, 
                             -format => $formatIN );

#Imprimo por pantalla
#while ( $seq_obj = $seqio_obj->next_seq ) {
    # print the sequence
#    print $seq_obj->seq,"\n";
#}
my $fastaSeq;
while ( $seq_obj = $seqio_obj->next_seq ) {     
    $fastaSeq .= $seq_obj->seq();
}

$seq_obj_fasta = Bio::Seq->new(-seq=>$fastaSeq,
                         -display_id => $fastaId,
                         -desc => $fastaDesc,
                         -alphabet => $alphabet );

$seqio_obj_fasta = Bio::SeqIO->new(-file => $pathOUT, 
                             -format => $formatOUT );

$seqio_obj_fasta->write_seq($seq_obj_fasta);
print "Archivo CYP11B1_mRNA.fasta creado!\n";

print "FIN!!!\n"