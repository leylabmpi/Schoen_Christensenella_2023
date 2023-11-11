# PID of current job: 2038359
mSet<-InitDataObjects("mass_all", "mummichog", FALSE)
mSet<-SetPeakFormat(mSet, "rmp")
mSet<-UpdateInstrumentParameters(mSet, 5.0, "positive", "yes", 0.02);
mSet<-Read.PeakListData(mSet, "Replacing_with_your_file_path");
mSet<-SanityCheckMummichogData(mSet)
add.vec <- c("M [1+]","M+H [1+]","M+2H [2+]","M+Na [1+]","M+K [1+]","M-H2O+H [1+]","M+NH4 [1+]","2M+H [1+]")
mSet<-Setup.AdductData(mSet, add.vec);
mSet<-PerformAdductMapping(mSet, "positive")
mSet<-SetPeakEnrichMethod(mSet, "integ", "v2")
mSet<-SetMummichogPval(mSet, 0.05)
mSet<-PerformPSEA(mSet, "mmu_kegg", "current", 3 , 100)
mSet<-PlotPSEAIntegPaths(mSet, "integ_peaks_0_", "png", 72, width=NA)
mSet<-SaveTransformedData(mSet)
