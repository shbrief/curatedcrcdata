\name{ GSE24549.GPL5175_eset }
\alias{ GSE24549.GPL5175_eset }
\docType{data}
\title{ Transcriptome instability in colorectal cancer identified by exon microarray analyses: Associations with splicing factor expression levels and patient survival. }
\description{ Colorectal cancer (CRC) is a heterogeneous disease that, on the molecular level, can be characterized by inherent genomic instabilities; chromosome instability and microsatellite instability. In the present study we analyze genome-wide disruption of pre-mRNA splicing, and propose transcriptome instability as a characteristic that is analogous to genomic instability on the transcriptome level.Exon microarray profiles from two independent series including a total of 160 CRCs were investigated for their relative amounts of exon usage differences. Each exon in each sample was assigned an alternative splicing score calculated by the FIRMA algorithm. Amounts of deviating exon usage per sample were derived from exons with extreme splicing scores.There was great heterogeneity within both series in terms of sample-wise amounts of deviating exon usage. This was strongly associated with the expression levels of approximately half of 280 splicing factors (54\% and 48\% of splicing factors were significantly correlated to deviating exon usage amounts in the two series). Samples with high or low amounts of deviating exon usage, associated with overall transcriptome instability, were almost completely separated into their respective groups by hierarchical clustering analysis of splicing factor expression levels in both sample series. Samples showing a preferential tendency towards deviating exon skipping or inclusion were associated with skewed transcriptome instability. There were significant associations between transcriptome instability and reduced patient survival in both sample series. In the test series, patients with skewed transcriptome instability showed the strongest prognostic association (P = 0.001), while a combination of the two characteristics showed the strongest association with poor survival in the validation series (P = 0.03).We have described transcriptome instability as a characteristic of CRC. This transcriptome instability has associations with splicing factor expression levels and poor patient survival. }
\usage{data( GSE24549.GPL5175_eset )}
\format{
\preformatted{
experimentData(eset):
Experiment data
  Experimenter name: Sveen A,????esen TH,??Rognum TO,??Lothe RA,??Skotheim RI. Transcriptome instability in colorectal cancer identified by exon microarray analyses: Associations with splicing factor expression levels and patient survival. Genome Med 2011 May 27 
  Laboratory: Sveen A,????esen TH,??Rognum TO,??Lothe RA,??Skotheim RI 2011 
  Contact information:  
  Title: Transcriptome instability in colorectal cancer identified by exon microarray analyses: Associations with splicing factor expression levels and patient survival. 
  URL:  
  PMIDs: 21619627 

  Abstract: A 282 word abstract is available. Use 'abstract' method.
  Information is available on: preprocessing 
  notes:
   platform_title:     
      [HuEx-1_0-st] Affymetrix Human Exon 1.0 ST Array [transcript (gene) versio
n]
   platform_shorttitle:     
      Affymetrix HuEx-1_0-st
   platform_summary:     
      huex.1.0.st.v2
   platform_manufacturer:     
      Affymetrix
   platform_distribution:     
      commercial
   platform_accession:     
      GPL5175
   platform_technology:     
      in situ oligonucleotide
   warnings:     
      No warnings yet

Preprocessing: default
featureData(eset):
An object of class 'AnnotatedDataFrame'
  featureNames: A1CF A2ML1 ... ZYX (10015 total)
  varLabels: probeset gene
  varMetadata: labelDescription

}}
\details{
\preformatted{
assayData: 10015 features, 83 samples
Platform type: huex.1.0.st.v2
--------------------------- 
Available sample meta-data: 
--------------------------- 

alt_sample_name: 
   Length     Class      Mode 
       83 character character 

sample_type: 
tumor 
   83 

summarystage: 
late NA's 
  37   46 

M: 
 0 
83 

Dstage: 
 B  C 
46 37 

msi: 
 MSI  MSS NA's 
   7   75    1 

stageall: 
 2  3 
46 37 

dfs_status: 
deceased_or_recurrence    living_norecurrence 
                    43                     40 

days_to_recurrence_or_death: 
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  120.4   441.6  2394.0  2113.0  3650.0  3650.0 

batch: 
   Length     Class      Mode 
       83 character character 

drug_treatment: 
 n 
83 

preop_drug_treatment: 
 n 
83 

chemotherapy: 
 n  y 
46 37 

uncurated_author_metadata: 
   Length     Class      Mode 
       83 character character 

}}
\keyword{datasets}
