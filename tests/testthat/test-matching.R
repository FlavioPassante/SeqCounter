test_that("Exact matching between Sequence to be searched and Genomic Region", {
    txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene::TxDb.Hsapiens.UCSC.hg38.knownGene
    genreg <- GenomicFeatures::fiveUTRsByTranscript(txdb)
    seqset <- GenomicRanges::GRanges(c("chr1:65419-65432:+",
                                       "chr1:92573-92580:+",
                                       "chr1:923928-924431:+"))
    expect_false(VerifyMatch(genreg, seqset))
})

test_that("Partial overlap between sequence to be searched
          and Genomic Region", {
    txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene::TxDb.Hsapiens.UCSC.hg38.knownGene
    genreg <- GenomicFeatures::fiveUTRsByTranscript(txdb)
    seqset <- GenomicRanges::GRanges(c("chr1:65419-65432:+",
                                       "chr1:923927-924431:+",
                                       "chr1:925922-925941:+"))
    expect_true(PartialOverlap(genreg, seqset))
})

