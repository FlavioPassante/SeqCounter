#' Sequence Counter For Each Sequence Within a Genomic Region
#'
#' Given as input a Genome, a set of Genomic Regions (i.e CDS, Exons,
#' Introns...) and a set of Short Sequences identified within the interesting
#' genomic regions, this function returns the number of occurrencies
#' for each sequence inside the regions.
#'
#' @usage SequenceCounter(Genome, GenRegion, SeqSet)
#' @aliases SeqCounter
#' @param Genome A reference Genome (a BSgenome object)
#' @param GenRegion A category of Genomic Regions (a GRanges object)
#' @param SeqSet A set of short sequences to be searched (GRanges object)
#' @return The number of occurencies for each sequence
#' @author Flavio Passante \cr Politecnico di Milano
#' @importFrom GenomeInfoDb seqinfo
#' @importFrom BSgenome.Hsapiens.UCSC.hg38 BSgenome.Hsapiens.UCSC.hg38
#' @importFrom GenomicRanges countOverlaps
#' @importFrom S4Vectors metadata
#' @import BiocVersion
#' @importFrom TxDb.Hsapiens.UCSC.hg38.knownGene TxDb.Hsapiens.UCSC.hg38.knownGene
#' @importFrom GenomicFeatures fiveUTRsByTranscript
#' @seealso \code{\link[BSgenome.Hsapiens.UCSC.hg38]{BSgenome.Hsapiens.UCSC.hg38}}\cr
#' \code{\link[TxDb.Hsapiens.UCSC.hg38.knownGene]{TxDb.Hsapiens.UCSC.hg38.knownGene}}\cr
#' \code{\link[GenomicRanges]{countOverlaps}}\cr
#' \code{\link[GenomicRanges]{GRanges}}\cr
#'
#' @examples
#'
#' Hsapiens <- BSgenome.Hsapiens.UCSC.hg38::BSgenome.Hsapiens.UCSC.hg38
#' txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene::TxDb.Hsapiens.UCSC.hg38.knownGene
#' fiveprimeutr <- GenomicFeatures::fiveUTRsByTranscript(txdb)
#' exons <- GenomicRanges::GRanges(c("chr1:65419-65432:+",
#' "chr1:925731-925800:+","chr1:923928-924431:+"))
#' SequenceCounter(Hsapiens, fiveprimeutr, exons)
#'
#' @export
SequenceCounter <- function(Genome, GenRegion, SeqSet) {
    if (!(getBSGenome(Genome) == getGRGenome(GenRegion))) {
        stop("The genomic region is not from the inserted reference genome!")
    }
    else if (VerifyMatch(GenRegion, SeqSet) == FALSE) {
        stop("The set inserted contains non-matching sequences")
    }
    else {
        Counter <- countOverlaps(SeqSet, GenRegion, type = "within")
        if (PartialOverlap(GenRegion, SeqSet) == TRUE) {
            print("WARNING: The set inserted contains partial overlapping sequences")
        }
        for (i in seq_len(length(SeqSet))) {
            print(unique(paste0("The sequence ",i," matches ", Counter[i], " time(s).")))

        }
    }
}
