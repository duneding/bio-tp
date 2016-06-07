#!/bin/perl -w

#use Bio::DB::GenBank;
#$db_obj = Bio::DB::GenBank->new;
#$seq_obj = $db_obj->get_Seq_by_id(61743917); #CYP11B1
#print $seq_obj->seq,"\n";

use Bio::SeqIO;
use Bio::Seq;
use Data::Dumper;
use Bio::Tools::CodonTable;

$seqio_obj = Bio::SeqIO->new(-file => "../data/input/CYP11B1_mRNA.gb", 
                             -format => "genbank" );

#while ( $seq_obj = $seqio_obj->next_seq ) {
    # print the sequence
#    print $seq_obj->seq,"\n";
#}
my $fastaSeq;
while ( $seq_obj = $seqio_obj->next_seq ) {
    # process each seq    
    $fastaSeq .= $seq_obj->seq();
}

my $fastaId = "gi|61743917|ref|NM_000497.3|";
my $fastaDesc = "Homo sapiens cytochrome P450 family 11 subfamily B member 1 ".
				"(CYP11B1), transcript variant 1, mRNA";

$seq_obj_fasta = Bio::Seq->new(-seq=>$fastaSeq,
                         -display_id => $fastaId,
                         -desc => $fastaDesc,
                         -alphabet => "dna" );

$seqio_obj_fasta = Bio::SeqIO->new(-file => '>../data/output/CYP11B1_mRNA.fasta', 
                             -format => 'fasta' );

$seqio_obj_fasta->write_seq($seq_obj_fasta);



my $prot_obj = $fastaSeq->translate(-complete => 1); 

print $prot_obj->seq, "\n";