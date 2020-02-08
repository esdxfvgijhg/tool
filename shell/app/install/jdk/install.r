#!/usr/bin/Rscript

packs <- installed.packages() # Get the currently installed packages
exc <- names(packs[,'Package'])  # Get the names in a vector
av <- names(available.packages()[,1]) #Get names of available packages in Cran
ins <- av[!av %in% exc] #Make a list of all packages that you havent installed
install.packages(ins) # Install the desired packages
