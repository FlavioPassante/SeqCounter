# SeqCounter
Counts sequences within a genomic region
This package provide a function for overall count of sequences 
    inside a genomic regions.Given as input a reference genome,
    a set of specific genomic regions (e.g all 5'UTR of coding genes)
    and a set of short sequences, the function compute for each 
    sequence the number of occurrencies inside the genomic regions. 
    To allow this computation, the sequences to be searched have to 
    match perfectly within the genomic regions, 
    otherwise the function throws an error.
