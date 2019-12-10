## pbwtmaster

Utilities for working with the PBWT format

The `pbwtmaster` software leverages the `libpbwt` library to perfrom five main functions:

1. `coancestry`: produce a pairwise match sharing similarity matrix between all diploid individuals in the PBWT
2. `convert`: convert a data set from either PLINK or VCF to the PBWT format
4. `match`: run matching on a PBWT data set by marking a haplotype as the query
3. `summary`: report on basic statistics of a PBWT file
5. `view`: view the contents of a PBWT file

### coancestry function

```
Usage: pbwtmaster coancestry [OPTION]... [PBWT FILE]

Produce coancestry matrix for all samples in PBWT


Options:
  --minlen   FLOAT   Minimum match size (cM) [ Default: 0.5 cM ]
  --version          Print version number and exit
  --help             Display this help message and exit
```

### convert function

```
Usage: pbwtmaster convert [OPTION]... [INPUT STUB]

Convert PLINK or VCF to PBWT or vice versa


Options:
  --phased            Input data are phased
  --vcf               Input file is VCF format
  --map     <FILE>    Popmap file (for VCF input)
  --reg               Input PLINK stub includes a REG file
  --out      <STR>    Output stub (.pbwt extension will be added)
  --query    <STR>    Use only this region/population (requires -r switch)
  --version           Print version number and exit
  --help              Display this help message and exit
```

### match function
```
Usage: pbwtmaster match [OPTION]... [PBWT FILE]

Retrieve set-maximal matches in PBWT using query


Options:
  --minlen   FLOAT   Minimum match size (cM) [ Default: 0.5 cM ]
  --query    STR     String identifier of haplotypes to mark as query
  --all              Print a list of all matches with query
  --version          Print version number and exit
  --help             Display this help message and exit
```

### summary function
```
Usage: pbwtmaster summary [OPTION]... [INPUT STUB]

Print report describing pbwt file


Options:
  --regcount          Print region sizes
  --version           Print version number and exit
  --help              Display this help message and exit
```

### view function

```
Usage: pbwtmaster view [OPTION]... [PBWT FILE]

Print contents of .pbwt file to stdout


Options:
  --nohaps            Omit haplotype states-- only print sample metadata
  --version           Print version number and exit
  --help              Display this help message and exit
  ```
  