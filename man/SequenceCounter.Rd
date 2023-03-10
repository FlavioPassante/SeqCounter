% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SeqCounter.R
\name{SequenceCounter}
\alias{SequenceCounter}
\alias{SeqCounter}
\title{Sequence Counter For Each Sequence Within a Genomic Region}
\usage{
SequenceCounter(Genome, GenRegion, SeqSet)
}
\arguments{
\item{Genome}{A reference Genome (a BSgenome object)}

\item{GenRegion}{A category of Genomic Regions (a GRanges object)}

\item{SeqSet}{A set of short sequences to be searched (GRanges object)}
}
\value{
The number of occurencies for each sequence
}
\description{
Given as input a Genome, a set of Genomic Regions (i.e CDS, Exons,
Introns...) and a set of Short Sequences identified within the interesting
genomic regions, this function returns the number of occurrencies
for each sequence inside the regions.
}
\examples{

Hsapiens <- BSgenome.Hsapiens.UCSC.hg38::BSgenome.Hsapiens.UCSC.hg38
txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene::TxDb.Hsapiens.UCSC.hg38.knownGene
fiveprimeutr <- GenomicFeatures::fiveUTRsByTranscript(txdb)
exons <- GenomicRanges::GRanges(c("chr1:65419-65432:+",
"chr1:925731-925800:+","chr1:923928-924431:+"))
SequenceCounter(Hsapiens, fiveprimeutr, exons)

}
\seealso{
\code{\link[BSgenome.Hsapiens.UCSC.hg38]{BSgenome.Hsapiens.UCSC.hg38}}\cr
\code{\link[TxDb.Hsapiens.UCSC.hg38.knownGene]{TxDb.Hsapiens.UCSC.hg38.knownGene}}\cr
\code{\link[GenomicRanges]{countOverlaps}}\cr
\code{\link[GenomicRanges]{GRanges}}\cr
}
\author{
Flavio Passante \cr Politecnico di Milano
}
