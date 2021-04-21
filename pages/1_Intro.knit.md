---
title: "Bioinformatic tools for Genome annotation"
subtitle: "Course: Microbiomes (2021)"
author: "Sandra Godinho Silva"
institute: "Instituto Superior Técnico"
date: "14/04/2021"
output:
  xaringan::moon_reader:
    seal: false
    lib_dir: libs
    css: 
        - css/my-theme.css
        - xaringan-themer.css
    nature:
      slideNumberFormat: |
        <div class="progress-bar-container">
          <div class="progress-bar" style="width: calc(%current% / %total% * 100%);">
          </div>
        </div>
      highlightStyle: github
      highlightLines: true
      ratio: 16:9
      countIncrementalSlides: false
---






class: title-slide,center,middle, top
background-image: url(img/jeremy-bishop-G9i_plbfDgk-unsplash.jpg)
background-position:  75% 75%
background-size: cover


# Bioinformatic tools for Genome annotation
<br>

#### Course: Microbiomes (2021)
<br>
**Sandra Godinho Silva**  
Instituto Superior Técnico  
14/04/2021  

.center[
.small[
.footnote[
<br><br>
.blue[Graphic by Jeremy Bishop] [@ Unsplash](https://unsplash.com/photos/G9i_plbfDgk)
]
]
]
---
name: about-me
class: center, middle

## About me: Sandra Godinho Silva

<img style="border-radius: 50%;" src="https://sandragodinhosilva.netlify.app/authors/admin/avatar_hu27f7dc34c9db8fd2b063f3fba6be9864_589773_270x270_fill_q75_lanczos_center.jpg"/>

### PhD Student @ Institute for Bioengineering and Biosciences

.fade[Instituto Superior Técnico<br>Lisbon, Portugal]

[<svg viewBox="0 0 512 512" style="height:1em;fill:currentColor;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M294.75 188.19h-45.92V342h47.47c67.62 0 83.12-51.34 83.12-76.91 0-41.64-26.54-76.9-84.67-76.9zM256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm-80.79 360.76h-29.84v-207.5h29.84zm-14.92-231.14a19.57 19.57 0 1 1 19.57-19.57 19.64 19.64 0 0 1-19.57 19.57zM300 369h-81V161.26h80.6c76.73 0 110.44 54.83 110.44 103.85C410 318.39 368.38 369 300 369z"></path></svg> Orcid](https://orcid.org/0000-0002-4763-0662)
[<svg viewBox="0 0 496 512" style="fill:currentColor;position:relative;display:inline-block;top:.1em;height:1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3.3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5.3-6.2 2.3zm44.2-1.7c-2.9.7-4.9 2.6-4.6 4.9.3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3.7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3.3 2.9 2.3 3.9 1.6 1 3.6.7 4.3-.7.7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3.7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3.7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z"></path></svg> @sandragodinhosilva](https://github.com/sandragodinhosilva)

???
[<svg viewBox="0 0 512 512" style="height:1em;fill:currentColor;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M326.612 185.391c59.747 59.809 58.927 155.698.36 214.59-.11.12-.24.25-.36.37l-67.2 67.2c-59.27 59.27-155.699 59.262-214.96 0-59.27-59.26-59.27-155.7 0-214.96l37.106-37.106c9.84-9.84 26.786-3.3 27.294 10.606.648 17.722 3.826 35.527 9.69 52.721 1.986 5.822.567 12.262-3.783 16.612l-13.087 13.087c-28.026 28.026-28.905 73.66-1.155 101.96 28.024 28.579 74.086 28.749 102.325.51l67.2-67.19c28.191-28.191 28.073-73.757 0-101.83-3.701-3.694-7.429-6.564-10.341-8.569a16.037 16.037 0 0 1-6.947-12.606c-.396-10.567 3.348-21.456 11.698-29.806l21.054-21.055c5.521-5.521 14.182-6.199 20.584-1.731a152.482 152.482 0 0 1 20.522 17.197zM467.547 44.449c-59.261-59.262-155.69-59.27-214.96 0l-67.2 67.2c-.12.12-.25.25-.36.37-58.566 58.892-59.387 154.781.36 214.59a152.454 152.454 0 0 0 20.521 17.196c6.402 4.468 15.064 3.789 20.584-1.731l21.054-21.055c8.35-8.35 12.094-19.239 11.698-29.806a16.037 16.037 0 0 0-6.947-12.606c-2.912-2.005-6.64-4.875-10.341-8.569-28.073-28.073-28.191-73.639 0-101.83l67.2-67.19c28.239-28.239 74.3-28.069 102.325.51 27.75 28.3 26.872 73.934-1.155 101.96l-13.087 13.087c-4.35 4.35-5.769 10.79-3.783 16.612 5.864 17.194 9.042 34.999 9.69 52.721.509 13.906 17.454 20.446 27.294 10.606l37.106-37.106c59.271-59.259 59.271-155.699.001-214.959z"></path></svg> sandragodinhosilva.netlify.com](https://sandragodinhosilva.netlify.com)
[<svg viewBox="0 0 512 512" style="height:1em;fill:currentColor;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z"></path></svg> @SandraGodSilva](https://twitter.com/SandraGodSilva)
---
background-image: url("img/jeremy-bishop-G9i_plbfDgk-unsplash.jpg")
background-position: 0% 75%
background-size: 25% 100%


class: middle
.right-column[
# Table of contents
* **Part 1:** [Bioinformatics: what are the tools available?](#part1)

* **Part2:** [Bioinformatic tools for Genome Annotation](#part2)

* **Hands-on 1:** [Annotate genomes with the COG database](#handson1)

> * **1.1:** [Rast-WebMGA workflow](#handson1)

> * **1.2:** [Join COG annotation with a R script](#handson2)
>> * **1.2.1:** [R Setup](https://sandragodinhosilva.github.io/microbiomes2021/pages/R_setup.html)
>> * **1.2.2:** [Get started with R and RStudio](https://sandragodinhosilva.github.io/microbiomes2021/pages/R_basics.html)
]
---

background-image: url("img/jeremy-bishop-G9i_plbfDgk-unsplash.jpg")
background-position: 0% 75%
background-size: 25% 100%

name: part1

class:  middle
.right-column[
# Part 1
### .blue[Bioinformatics: what are the tools available?]
]
---
class:  center, middle

# Bioinformatics
<br>
Bioinformatics is the science that conjugates  
**biology** + **statistics** + **computer sciences**  
to study biological issues through the analysis of data.

---
class: middle

**Bioinformatics is a constantly changing and updating field.**

Fast developments in:
> - software
- computing hardware 
- high throughput technologies 

--

are creating a significant bottleneck:  
**How to thoroughly analyze this massive amount of data?**

---
.center[**How to thoroughly analyze this massive amount of data?**]

<img src="img/bigdata_lifesciences.png" width="70%" style="display: block; margin: auto;" />
.center[
.small[
[Stephens et a. PLoS Biology, 2015](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.1002195)
]]

---
## Integrative OMICS
<img src="img/integrative_omics.png" width="80%" style="display: block; margin: auto;" />
.center[
.small[[Yugi et al., Trends Biotechnol. 2016 Apr; 34(4):276–290](https://doi.org/10.1016/j.tibtech.2015.12.013)]
]

---
## Choose the most appropriate route for you

Nowadays, bioinformaticians and researchers working in life scientists can choose from an overwhelming collection of exciting technologies and programming languages.  

--

Several options:
> - [Web-based platforms](#Web-based)

--

> - [Scripting/programming](#scripting)

---
name: Web-based
## Web-based platforms

Allow **accessible**, **reproducible** and **transparent computational research.**

.panelset[

.panel[.panel-name[KBase]

.left-column[
<img src="img/KBase-logo.png" width="100%" />
]
.right-column[The U.S. Department of Energy Systems Biology Knowledgebase [KBase](https://www.kbase.us/)  is an open-source software and data platform designed to meet the grand challenge of systems biology — predicting and designing biological function from the biomolecular (small scale) to the ecological (large scale).  
[Kbase: https://www.kbase.us/](https://www.kbase.us/)
]]


.panel[.panel-name[Galaxy]
.left-column[
<img src="img/galaxy.png" width="100%" />
]
.right-column[Galaxy provides a system that enables researchers without informatics expertise to perform computational analyses through the web. A user interacts with Galaxy through the web by uploading and analyzing the data. Galaxy interacts with underlying computational infrastructure (servers that run the analyses and disks that store the data) without exposing it to the user. 
[Galaxy project - Europe: https://usegalaxy.eu/](https://usegalaxy.eu/)
]]
]


---
name: scripting
# Scripting & programming

.panelset[

.panel[.panel-name[Bash]
.left-column[
<img src="img/bash.png" width="100%" />
]
.right-column[
* Default login shell for most Linux distributions;
* Simple bash scripts are really useful for data manipulation.

<br><br>
<img src="img/bash_ex.png" width="80%" />
]
]

.panel[.panel-name[Python (1/2)]
.left-column[
<img src="img/python.png" width="80%" />
]
.right-column[
## Python
* Clear and powerful object-oriented programming language;
* Portable – runs just about anywhere;
* Clear syntax – relatively easy to learn.
Source: [https://www.python.org/](https://www.python.org)]
]

.panel[.panel-name[Python (2/2)]

.left-column[
<img src="img/Biopython_logo.svg" width="100%" />
]
.right-column[
## Biopython
* Collection of .blue[Python] modules that provide functions to deal with DNA, RNA & protein sequence operations;
* It has sibling projects like BioPerl, BioJava and BioRuby.  
Source: [https://biopython.org/](https://biopython.org)
]
]

.panel[.panel-name[R (1/3)]
.left-column[
<img src="img/Rlogo.png" width="100%" />
]
.right-column[
## R
* .purple[R] is a powerful, popular open-source scripting language
* More than 20 years old - fairly mature - and growing in popularity. 
]
]

.panel[.panel-name[R (2/3)]
### Why is R so popular?
- **Statistical Language**: R is widely used in biology, genetics as well as in statistics. 

- **Vast array of packages**: With over 10,000 packages in the CRAN repository, the number is constantly growing. These packages appeal to all the areas of industry.

- **Quality Plotting and Graphing**: The popular libraries like ggplot2 and plotly advocate for aesthetic and visually appealing graphs that set R apart from other programming languages.
]
.panel[.panel-name[R (3/4)]


.left-column[**Dynamic graph:** 
ggplot2 + gganimate
<br><br>
Source: [link]()
]
.right-column[
<img src="gif/gganimate.gif" width="50%" style="display: block; margin: auto;" />
]
]
.panel[.panel-name[R (4/4)]
.pull-left[
<img src="img/rstudio.png" width="100%" />
]
.pull-right[
## R Studio
* Integrated Development Environment (IDE). 
* Provides a graphical interface to R, making it more user-friendly, and providing dozens of useful features.
.midi[Source: [https://www.rstudio.com/](https://www.rstudio.com/)
]
]

]
]

---
# And much more!

<img src="img/programming_languages.jpeg" width="60%" style="display: block; margin: auto;" />

---
background-image: url("img/jeremy-bishop-G9i_plbfDgk-unsplash.jpg")
background-position: 0% 75%
background-size: 25% 100%

name: part2

class:  middle
.right-column[
# Part 2
### .blue[Bioinformatic tools for Genome Annotation]
]
---
# Genome Annotation

The process of attaching biological information to sequences.  

<br>
**Consists of two main steps:** 
- .blue[structural annotation]: identifying genomic elements;

- .blue[functional annotation]: attaching biological information to these elements. 

<br>
<img src="img/bioinformatics_03_annotation_yourgenome.png" width="70%" style="display: block; margin: auto;" />
.center[.small[
Source: [link](https://zhiganglu.com/post/annotation-pipeline-tools/)]
]
???
Gene annotation is the plotting of genes onto genome assemblies, and indexing their genomic coordinates.
DNA annotation or genome annotation is the process of identifying the locations of genes and all of the coding regions in a genome and determining what those genes do.

* Once a genome is sequenced, all of the sequences must be analyzed to understand what their meaning.

* Critical to annotation is the identification of the genes in a genome, the structure of the genes, and the proteins they encode.

* Once a genome is annotated, further work is done to understand how all the annotated regions interact with each other.


---
<img src="img/elixir.png" width="100%" style="display: block; margin: auto;" />
 
---
<div class="figure" style="text-align: center">
<img src="img/genome-annotation.jpg" alt="Source: https://www.ssbs.edu.in/genome-annotation.htm" width="70%" />
<p class="caption">Source: https://www.ssbs.edu.in/genome-annotation.htm</p>
</div>

???
Genome Annotation is the process to identify, analyze and interpret the relevant information related to the raw DNA sequences. Genome Annotation helps to extract structural location and biological functions of genes. Haemophilus influenza was the first free-living bacterium to be decoded in 1995 by Dr. Owen White. The assembling of the quality reads with a reference genome or de novo assembly in order to obtain the complete genome is a primary requirement for Genome Annotation.

---
# Structural Annotation
The process of identifying genomic elements such as: 
> * open reading frames (ORFs) and their localization;
* gene structure;
* coding regions;
* regulatory motifs.


<img src="img/prokaryote_gene.png" width="50%" style="display: block; margin: auto;" />
.center[
.small[Prokaryotic and Eukaryotic gene structure. 
Source: [link](https://www.researchgate.net/publication/266155655_Accurate_RNA-seq_based_de_novo_annotation_using_mGenengs)
]
]


???
identifying the positions of structural
genomic elements, like genes, exons, introns, repeated regions, promoters, etc
---
## Structural Annotation: Methods
.pull-left[
* **Similarity**  
Similarity between sequences 
<br><br>
<img src="img/scorelink.png" width="70%" style="display: block; margin: auto;" />
]
.pull-right[* ***ab-initio* prediction**  
Genes are predicted based on gene content and signal detection (e.g. start/stop codon; Ribosome Biding Site (RBS), etc.).
<img src="img/abinitio.png" width="60%" style="display: block; margin: auto;" />
]
???
In another words, they predict genes by analyzing statistical features of genes first, then separate the coding sequences and non-coding sequences apart.

What? Prediction of complete or truncated genes from metagenomic / genomic  contigs / reads
How? Many algorithms available – most commonly used: glimmer and prodigal Goal: find most likely start and stop codons across sequences
Typically quick to run
Metagenomic contigs add complexity (spurious contigs, variable  codon usage, etc.)


---
### Examples of *ab-initio* tools: 
* Glimmer
* GenemarkHMM 
<br>
--
<br>
* .huge[**PRODIGAL**]  
**PROkaryotic DYnamic programming Gene-finding ALgorithm**

> - Predicts protein-coding genes 
- Handles gaps and partial genes
- Identifies translation initiation sites
- Handles finished genomes, draft genomes and metagenomes.
- Runs quickly
- Runs unsupervised: is an **unsupervised machine learning algorithm**.  
Automatically learns the properties of the genome from the sequence itself, including RBS motif usage, start codon usage, and coding statistics.  
- Source: [https://github.com/hyattpd/Prodigal](https://github.com/hyattpd/Prodigal)
---
# Functional Annotation

The process of **attaching biological information to genomic elements** by describing the biochemical and biological function of proteins. 

Possible analysis:
> - similarity searches;
- gene cluster prediction for secondary metabolites;
- identification of transmembrane domains in protein sequences;
- finding gene ontology terms;
- pathway information.

Functional roles are assigned to coding sequences (CDSs).




???
What? Queries databases with genes predicted previously
Many tools available. Most commonly used:
HMMer - Search sequence databases with Hidden Markov Models
BLAST - Basic Local Alignment Search Tool


Huge in number - some more generic, some more specialized
Most popular: COGs, Pfams, InterPro (more recent), KEGG
Package of databases used will delineate the workload in metagenome/genome processing
Some current annotation pipelines work as “wrappers” which will join information from several databases (e.g. Prokka)


---
## Functional Assignment Databases
**NCBI Nucleotide and Proteins databases**  
NCBI hosts constantly updated databases of proteins and DNA from several sources that include most of the newly sequenced organisms.

Queries to this database can be performed through the BLAST web server, also hosted by the NCBI.

.citation[BLAST can be considered the basic level of annotation for finding similarities.
]
---
**BLAST (Basic Local Alignment Search Tool)**  

BLAST finds regions of similarity between biological sequences. The program compares nucleotide or protein sequences to sequence databases and calculates the statistical significance.

<img src="img/blast.png" width="55%" style="display: block; margin: auto;" />

???
Widely used sequence similarity search tool

Find high scoring local alignments between two sequences

Includes a model of score distributions for random local alignments

Provides statistical significance for alignments

Mostly used for 

I have a Dna or protein sequences
1. What is it related to? What does it do? (Homology, Conseerved Domains)
2. Is is already in the database? (Identification)
3. Where is it located or how is it organized? (Annotation, Assembly)

---
## Databases
**Specialist databases**  
Some databases offer extra information and search criteria for specific fields of study, while usually including the sequences already in public databases such as NCBI.

???
Some databases use genome context information, similarity scores, experimental data, and integrations of other resources to provide genome annotations through their Subsystems approach. Other databases rely on both curated data sources as well as a range of different software tools in their automated genome annotation pipeline.
---
## Databases
**Specialist databases**  
.panelset[
.panel[.panel-name[PFAM]
.left-column[
.center[
<img src="img/pfam.gif" width="100%" style="display: block; margin: auto;" />
]
]
.right-column[
Pfam is a large collection of protein families, represented by multiple sequence alignments and hidden Markov models (HMMs).  
Source: [http://pfam.xfam.org/](http://pfam.xfam.org/)
]
]

.panel[.panel-name[COG]
.left-column[
# COG
]
.right-column[
**Clusters of Orthologous Groups (COGs)**  
Database of proteins generated by comparing the protein sequences of complete genomes.  
Each COG consists of individual orthologous proteins or orthologous sets of paralogs from at
least 3 lineages.  
Orthologs typically have the same function, allowing transfer of functional information from one member to an entire COG.  
Source: [https://www.ncbi.nlm.nih.gov/research/cog-project/](https://www.ncbi.nlm.nih.gov/research/cog-project/)
]
]

.panel[.panel-name[Kegg]
.left-column[
<img src="img/KEGG_database_logo.gif" width="100%" />
]
.right-column[
**Kyoto Encyclopedia of Genes and Genomes**  
Database resource for understanding high-level functions and utilities of biological systems, such as the cell, the organism and the ecosystem, from molecular-level information.  
Source: [https://www.genome.jp/kegg/](https://www.genome.jp/kegg/)
]
]

.panel[.panel-name[CAZymes]
.left-column[
<img src="img/cazymes.png" width="150%" />
]
.right-column[
**Carbohydrate-Active enZymes**  
Enzymes involved in the synthesis, metabolism, and transport of carbohydrates.  
CAZymes are organized in families in the continuously updated database [CAZy](www.cazy.org).  

Includes: glycoside hydrolases (GHs), glycosyltransferases (GTs), polysaccharide lyases (PLs), carbohydrate esterases (CEs) and carbohydrate binding modules (CBMs).  
Source: [http://www.cazy.org/](http://www.cazy.org/) 
]
]

]
---
<img src="img/performance.png" width="150%" />

.center[
.small[Prakash, Tulika & Taylor, Todd. (2012). Functional assignment of metagenomic data: Challenges and applications.
<br>
Briefings in bioinformatics. 10.1093/bib/bbs033. 
[(link)](https://academic.oup.com/bib/article/13/6/711/193165)
]
]

---
## Functional assignment workflows

* **Prokaryotic Genomes Automatic Annotation Pipeline** (via NCBI) 

* **InterPro**

* **Prokka**  
Coomand-line tool.Also integrated into K-Base.



* **RAST**  
A web server for annotating bacterial and archaeal genomes that provides annotation results in under a day 
<br>

---



.pull-left[
<img src="img/interpro.png" width="70%" style="display: block; margin: auto;" />
]
.pull-right[
## InterPro
Initial quality control

Identification of rRNA reads 

Binning of 16S rRNA gene reads

QIIME-based taxonomic assignment

Non-RNA reads: ORF prediction

Functional annotation with  
**InterPro (IPR) Scan**
***
Integrates several other databases  
**Updated every 8 weeks**


]



---
<img src="img/prokka.png" width="10%" align="right"/>
## PROKKA
**The approach:**  
Prokka uses a **variety of databases** to **assign function to predicted CDS features**.  
It takes a hierarchical approach to make it fast.  
<br>
--
**Proteins coding genes are annotated in two stages:**  
>**1)** **Prodigal** identifies the coordinates of candidate genes, but does not describe the putative gene product.


>**2.1)** A small, core set of well characterized proteins are first searched using **BLAST+**. This combination of small database and fast search typically completes about 70% of the workload. 

>**2.2)** A series of slower but more sensitive HMM databases are searched using **HMMER3**.

<br>
.small[
[Tutorial: https://training.galaxyproject.org/training-material/topics/genome-annotation/tutorials/annotation-with-prokka/tutorial.html](https://training.galaxyproject.org/training-material/topics/genome-annotation/tutorials/annotation-with-prokka/tutorial.html)
]
???
Feature prediction tools used by Prokka
# | Tool (reference)| Features predicted|
# |------------:|-----------:|
# | Prodigal| 	Coding sequence (CDS)|
# | RNAmmer| Ribosomal RNA genes (rRNA)|
# | Aragorn| Transfer RNA genes|
# | SignalP|	Signal leader peptides|
# | Infernal| Non-coding RNA|

Automatic annotation tools try to perform all of this by computer analysis, as opposed to manual annotation (a.k.a. curation) which involves human expertise. Ideally, these approaches co-exist and complement each other in the same annotation pipeline (process). 
The basic level of annotation is using BLAST for finding similarities, and then annotating genomes based on that. However, nowadays more and more additional information is added to the annotation platform. The additional information allows manual annotators to deconvolute discrepancies between genes that are given the same annotation. 



https://bio.libretexts.org/Bookshelves/Microbiology/Book%3A_Microbiology_(Boundless)/7%3A_Microbial_Genetics/7.13%3A_Bioinformatics/7.13B%3A_Annotating_Genomes


Many of these features can be automatically predicted by sophisticated software packages based on sequence or structure comparisons.

Beyond this point, it is the goal and the job of a community annotation to generate accurate lists of the most crucial and interesting genes from a new genome, with raw data in the form of gene predictions with numbers attached, gaps in the draft genome sequence, and transcriptome alignments. In short, the goal at this point, is to convert the raw, machine generated data into a useable and useful data resource that will advance research in new, powerful and exciting directions.

---

.pull-left[
<img src="img/rasttk.png" width="50%" style="display: block; margin: auto;" />
]
.pull-right[
## Rast
The new RAST-tk annotation pipeline

Very unique “Package” which works with its own database (SEED)
 and anotation scheme (“subsystems technology”).
]

---
## Take-home messages: .blue[Genome Annotation]
<br> 
### What?  
Attributes functions to genes predicted from genomes or metagenomes
### Why?  
To answer the “What do they do?” question
### How? 
Through the pipeline ORF/Gene calling – Database search – functional analytics

---
## Take-home messages: .blue[Genome Annotation]
<br> 
**Ideally:** Annotation of **all available/acquirable genes** to provide functional overview and hints on possible novel genes

<br>

**The annotation accuracy is only as good as the available supporting data!**

As new data becomes available, gene predictions and functional assignments will change.  
Ex: Characterization of hypotetical proteins
---
## Introduction to File Formats
.panelset[

.panel[.panel-name[FASTA]

DNA and protein sequences can be written in FASTA format.
First line:">" followed by the description. 
In the second line the sequence starts.

<img src="img/fasta.png" width="50%" style="display: block; margin: auto;" />

]

.panel[.panel-name[GFF3]

General feature format (gene-finding format, generic feature format, GFF) is a file format used for describing genes and other features of DNA, RNA and protein sequences.

<img src="img/gff3_format.png" width="70%" style="display: block; margin: auto;" />
]


.panel[.panel-name[GENBANK]

The genbank sequence format is a rich format for storing sequences and associated annotations.

<img src="img/gb_full.png" width="50%" style="display: block; margin: auto;" />

]
]
???
Source: https://training.galaxyproject.org/training-material/topics/genome-annotation/tutorials/genome-annotation/tutorial.html

---
background-image: url("img/jeremy-bishop-G9i_plbfDgk-unsplash.jpg")
background-position: 0% 75%
background-size: 25% 100%

name: handson1

class:  middle
.right-column[
# Hands-on 1
<br>
### .blue[Genome annotation with the]   
### .blue[Clusters of Orthologous Genes (COG) Database]
]

---
# Worflow

**Genome annotation with Clusters of Orthologous Genes (COG) Databa**

**K-Base**  
1) Download bins from K-Base in fasta format

**Rast**  
2) Upload bins in Rast  
3) Perform gene annotation  
4) Download fasta aminoacid files  

**WebMGA**  
5) Upload downloaded bins in WebMGA   
6) Perform COG annotation  
7) Download COG annotation from WebMGA  

**R**  
8) Join COG annotation into single table - R script

---
class: middle
<img src="img/KBase-logo.png" width="30%" align="right"/>
# K-Base
<br>

1) Download bins from K-Base in fasta format;  
<br>
[Link](hhttps://narrative.kbase.us/narratives)

---
class: middle
<img src="img/rast.png" width="40%" align="right"/>
# Rast  

2) Upload bins (fasta files) in Rast;  
<br>
--
3) Perform genome annotation;   
<br>
--
4) Download fasta aminoacid files;  
<br>

[Link](https://rast.nmpdr.org/rast.cgi)

---
class: middle
<img src="img/webmga_pfam.png" width="50%" align="right"/>
## WebMGA  

5) Upload genomes (fasta aminoacid files) in WebMGA;    
<br>
--
6) Perform COG annotation;   
<br>
--
7) Download COG annotation from WebMGA.   
<br>

[Link](http://weizhong-lab.ucsd.edu/webMGA/server/)



---
background-image: url("img/jeremy-bishop-G9i_plbfDgk-unsplash.jpg")
background-position: 0% 75%
background-size: 25% 100%

name: handson1.2

class:  middle
.right-column[
# Hands-on 1.2
### .blue[Install R and RStudio]  
**Link:** [R setup](https://sandragodinhosilva.github.io/microbiomes2021/pages/R_setup.html)



### .blue[Introduction to R and RStudio]
**Link:** [Getting started with R](https://sandragodinhosilva.github.io/microbiomes2021/pages/R_basics.html)
]


---
## Workflow to join COG annotation in a single file
For each bin:  
>1) Download COG annotation from WebMGA (will be a zipped file)  
2) Unzip file;  
3) Look for the .txt file named "cog";  
4) Rename this file with the bin's name (Ex: cog_SAMPLEX_bin1)

For all bins:
>5) Move all cog annotation files to the same folder;  
6)  Download R script and move it to this folder;  
7) Run R script.

<br>
**Final output:** COG table with annotations for all bins


**Download script:** 
[Script_Merge_COGs.R](https://raw.githubusercontent.com/sandragodinhosilva/microbiomes2021/main/pages/data/2_Merge_annotations/Script_Merge_COGs.R)  
Note R extension!
---
class: center, middle

## That is all for today!
**Any questions?**

---
background-image: url("img/jeremy-bishop-G9i_plbfDgk-unsplash.jpg")
background-position: 0% 75%
background-size: 25% 100%

name: part1

class:  middle
.right-column[

<img style="border-radius: 50%;" src="https://sandragodinhosilva.netlify.app/authors/admin/avatar_hu27f7dc34c9db8fd2b063f3fba6be9864_589773_270x270_fill_q75_lanczos_center.jpg"/>
# Thank you!

### Here's where you can find me...

.left[
[<svg viewBox="0 0 512 512" style="height:1em;fill:currentColor;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M326.612 185.391c59.747 59.809 58.927 155.698.36 214.59-.11.12-.24.25-.36.37l-67.2 67.2c-59.27 59.27-155.699 59.262-214.96 0-59.27-59.26-59.27-155.7 0-214.96l37.106-37.106c9.84-9.84 26.786-3.3 27.294 10.606.648 17.722 3.826 35.527 9.69 52.721 1.986 5.822.567 12.262-3.783 16.612l-13.087 13.087c-28.026 28.026-28.905 73.66-1.155 101.96 28.024 28.579 74.086 28.749 102.325.51l67.2-67.19c28.191-28.191 28.073-73.757 0-101.83-3.701-3.694-7.429-6.564-10.341-8.569a16.037 16.037 0 0 1-6.947-12.606c-.396-10.567 3.348-21.456 11.698-29.806l21.054-21.055c5.521-5.521 14.182-6.199 20.584-1.731a152.482 152.482 0 0 1 20.522 17.197zM467.547 44.449c-59.261-59.262-155.69-59.27-214.96 0l-67.2 67.2c-.12.12-.25.25-.36.37-58.566 58.892-59.387 154.781.36 214.59a152.454 152.454 0 0 0 20.521 17.196c6.402 4.468 15.064 3.789 20.584-1.731l21.054-21.055c8.35-8.35 12.094-19.239 11.698-29.806a16.037 16.037 0 0 0-6.947-12.606c-2.912-2.005-6.64-4.875-10.341-8.569-28.073-28.073-28.191-73.639 0-101.83l67.2-67.19c28.239-28.239 74.3-28.069 102.325.51 27.75 28.3 26.872 73.934-1.155 101.96l-13.087 13.087c-4.35 4.35-5.769 10.79-3.783 16.612 5.864 17.194 9.042 34.999 9.69 52.721.509 13.906 17.454 20.446 27.294 10.606l37.106-37.106c59.271-59.259 59.271-155.699.001-214.959z"></path></svg> sandragodinhosilva.netlify.com](https://sandragodinhosilva.netlify.com) <br>
[<svg viewBox="0 0 512 512" style="height:1em;fill:currentColor;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z"></path></svg> @SandraGodSilva](https://twitter.com/SandraGodSilva)

.left[Slides created via the R package [**xaringan**](https://github.com/yihui/xaringan)]
]]


???
Unused
Some considerations about Homologs, Orthologs, and Paralogs

* **Homologous gene** (homolog): **a gene inherited in two species by a common ancestor**.  

<br>

<img src="img/zinc-finger-seq-alignment2.png" width="70%" style="display: block; margin: auto;" />

<br>
Homologous DNA: sequence alignment of a homologous protein from two different species.  The “*” represents a conserved amino acid in the two proteins. Figure: [link](https://s3-us-west-2.amazonaws.com/courses-images/wp-content/uploads/sites/1950/2017/05/31184035/zinc-finger-seq-alignment2.png)


class: middle
<img src="img/Homology.png" width="50%" style="display: block; margin: auto;" />
.small[
.center[
Photo courtesy of:  Popo H. Liao, via Wikimedia Commons. Source: [link](https://bitesizebio.com/26762/homology-terminology-never-say-wrong-word/)
]
]

class: middle
While homologous genes can be similar in sequence, similar sequences are not necessarily homologous.
* **Orthologous** are homologous genes where a gene diverges after a speciation event, but the gene and its main function are conserved.

* If a gene is duplicated in a species, the resulting duplicated genes are **paralogs** of each other, even though over time they might become different in sequence composition and function.


???
Homology forms the basis of organization for comparative biology.
A homologous trait is often called a homolog (also spelled homologue). In genetics, the term “homolog” is used both to refer to a homologous protein and to the gene ( DNA sequence) encoding it. 

As with anatomical structures, homology between protein or DNA sequences is defined in terms of shared ancestry. 

Two segments of DNA can have shared ancestry because of either:
* a speciation event (orthologs) 
* duplication event (paralogs). 

Homology among proteins or DNA is often incorrectly concluded on the basis of sequence similarity. The terms “percent homology” and “sequence similarity” are often used interchangeably. As with anatomical structures, high sequence similarity might occur because of convergent evolution, or, as with shorter sequences, because of chance. Such sequences are similar, but not homologous. Sequence regions that are homologous are also called conserved. This is not to be confused with conservation in amino acid sequences in which the amino acid at a specific position has been substituted with a different one with functionally equivalent physicochemical properties. One can, however, refer to partial homology where a fraction of the sequences compared (are presumed to) share descent, while the rest does not. For example, partial homology may result from a gene fusion event.
