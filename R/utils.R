getBSGenome <- function (genome) {
    return(metadata(genome)$genome)
}
getGRGenome <- function(GRangesobj) {
    return(unique(seqinfo(GRangesobj)@genome))
}

VerifyMatch <- function (GenRegion, SeqSet) {
    all((countOverlaps(SeqSet, GenRegion, minoverlap = 1) >= 1))
}

PartialOverlap <- function(GenRegion, SeqSet) {
    !all(countOverlaps(SeqSet, GenRegion, type = "within"))
}

