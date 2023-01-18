test_that("Correctness of input Genome", {
    human_genome <- BSgenome.Hsapiens.UCSC.hg38::BSgenome.Hsapiens.UCSC.hg38
    expect_equal(getBSGenome(human_genome), metadata(human_genome)$genome)
})

test_that("Correctness of input Genomic Region", {
    txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene::TxDb.Hsapiens.UCSC.hg38.knownGene
    genreg <- GenomicFeatures::fiveUTRsByTranscript(txdb)
    expect_equal(getGRGenome(genreg), unique(seqinfo(genreg)@genome))
})

