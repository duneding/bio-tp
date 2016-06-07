#!/bin/perl -w
use Bio::SeqIO;
use Bio::Seq;
use Bio::SeqUtils;

my $inFile = "data/input/CYP11B1_mRNA.gb";
my $formatIN = "genbank";
my $outFile = ">data/output/CYP11B1_mRNA_traducido.fasta";
my $formatOUT = 'fasta';

# Archivo de entrada formato GenBank
$input = Bio::SeqIO->new(-file => $inFile, 
                             -format => $formatIN );

my $output = Bio::SeqIO->new(-file => ">$outFile", 
                             -format => "fasta" );

while (my $seq = $input->next_seq()){
	my @traduccion = Bio::SeqUtils->translate_3frames($seq);
	$output->write_seq(@traduccion);
}
print "Archivo CYP11B1_mRNA.fasta creado!\n\n";
print "FIN!!!\n\n"