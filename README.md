README for agsemisc
###################

agsemisc is a set of utility functions for the R statistics software.
It includes the lattice plot type functions panel.bwstrip and panel.xy,
the plotting management function plotf and a number of minor helpers.

How to use
==========

In an R session:
  install.packages("agsemisc")   # once
  library("agsemisc")            # once per R session


History
=======

1997-10
  First beginnings, first with S-Plus, then also with R 0.64

2005-xx
  Version 1.0-1 released for R 2.1

2006-05-29
  Version 1.1-3 released for R 2.3
  - FIRST PUBLIC VERSION

2010-11-03
  Version 1.2-1 released for R 2.11
  - Renamed a.showextremes to a.printextremes
  - Removed a.rankval (use rank(x, na.last="keep") instead)
  - Added documentation for statshelpers.R: 
    a.iqr, a.qr, a.findcorrelations, a.printextremes

2014-07-30
  Version 1.2-2 to be released for R 3.1
  - corrections for compatibility with R 3.1


How to make a new release
=========================

For release XX, on a command prompt in agsemisc/.. :
  R CMD build agsemisc   # create tar
  R CMD check --as-cran agsemisc_XX.tar.gz   # perform conformance tests

Submit to CRAN via
  http://cran.r-project.org/submit.html


