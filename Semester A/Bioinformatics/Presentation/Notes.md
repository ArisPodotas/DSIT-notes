# My notes for my paper

## Abstract 

This paper is about third generation sequencing long reads. Its a review

We changed alignment methods when we got ngs due to the number of seeds in it
> Note
> We went from seed and extend to seed and chain

long read mapping algorithms now do alternative seed constructing or choin formulation.

What is a seed?

 In the context of the provided text, a seed refers to a small, exact sequence match or substring used as an anchor point for aligning sequencing reads to a reference genome. Seeds are used as part of the mapping process to identify potential regions of similarity between a long-read sequencing read and the reference genome.

Keep in mind that the data produced is noisy.

The computation complexity for millsion of base pairs was getting too large os optimization and heuristic algorithms were used.

## Introduction 

The seed and extend paradign doesn ot work when you do long read mapping is is designed ofr short reads. This makes sense since long reads have indels between them, the aurthors note that the extend method is a quadratic time complexity algorithm that starts from a single nucluotide when we want multiple mapped nucleotides to start with.

the original seed and chain algorithm is BLAST. This is considered an older seeding thecnique and is not time competitive. This is also a search tool. It searched the database. Because it wasnt competitive time wise with the short read mappers tecniques from genomics began to be implemented.

### The Genomics ideas.

> Sketching
> Subsampling

## Subproblems

The problem of gapped alignment
The problem of the partial alignment
The problem of repeats
The problem of splice mapping

These are unique algorithm solutions as in we need something new to come in and solve this in the seed and chain paradigm that works worse than the extend paradigm for a indel portion since its made to skip parts like that and quit the read there, moving to the next one.

## In this paper

We tackle the ideas surrounding reads (sequences shorter or equal to the genome) being mapped to the reference genome we have. This is done for samples we assume are closely related so we expect a high hit rate.

Each alignment has a space of ways to align the sequences. This number is huge so we look for alignments within here that do a sort of cost function optimization.

We define a distance function that is a set of scores for different pairings. Off of this we define the distance function.

In this paradigm a loss function is the score funtion and the cost function is the distance function.
We refer to these as the score and the distance.

This has already split this into sub problems. To split this more we do this for each read so subsections of the total sequencing we have to the genome.

The first to really do this for rna seq infomation was blasr
