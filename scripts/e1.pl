#!/bin/perl -w

#use Bio::DB::GenBank;
#$db_obj = Bio::DB::GenBank->new;
#$seq_obj = $db_obj->get_Seq_by_id(61743917); #CYP11B1
#print $seq_obj->seq,"\n";

use Bio::SeqIO;
use Bio::Seq;
use Bio::SeqUtils;

#my $fastaId = "gi|61743917|ref|NM_000497.3|";
#my $fastaDesc = "Homo sapiens cytochrome P450 family 11 subfamily B member 1 ".
#				"(CYP11B1), transcript variant 1, mRNA";
my $inFile = "data/input/CYP11B1_mRNA.gb";
my $formatIN = "genbank";
my $outFile = ">data/output/CYP11B1_mRNA_traducido.fasta";
my $formatOUT = 'fasta';
#my $alphabet = "dna";
#my $fastaSeq;

# Archivo de entrada formato GenBank
$input = Bio::SeqIO->new(-file => $inFile, 
                             -format => $formatIN );

# Imprimo por pantalla
#while ( $seq_obj = $input->next_seq ) {
    # print the sequence
#    print $seq_obj->seq,"\n";
#}

# Concatenación la secuencia input
#while ( $seq = $input->next_seq ) {     
#    $fastaSeq .= $seq->seq();
#}

# Nuevo objeto Fasta
#$seq_obj_fasta = Bio::Seq->new(-seq=>$fastaSeq,
#                         -display_id => $fastaId,
#                         -desc => $fastaDesc,
#                         -alphabet => $alphabet );

my $output = Bio::SeqIO->new(-file => ">$outFile", 
                             -format => "fasta" );

while (my $seq = $input->next_seq()){
	my @traduccion = Bio::SeqUtils->translate_3frames($seq);
	$output->write_seq(@traduccion);
}
# Creación objeto output file
#$output_fasta = Bio::SeqIO->new(-file => $pathOUT_tmp, 
#                          -format => $formatOUT );

#$output_fasta->write_seq($seq_obj_fasta);
print "Archivo CYP11B1_mRNA.fasta creado!\n\n";
#print "frame 1: in Bioperl frames 1,2,3 = 0,1,2\n";
#print Bio::Seq->new(-seq => $fastaSeq)->translate(-frame => 2)->seq, "\n\n";
#print "frame -3: reverse complement, then frame -3 = Bioperl frame 2\n";
#print Bio::Seq->new(-seq => $fastaSeq)->revcom->translate(-frame => 2)->seq, "\n\n";
print "FIN!!!\n\n"