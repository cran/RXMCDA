pkgname <- "RXMCDA"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('RXMCDA')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("checkXSD")
### * checkXSD

flush(stderr()); flush(stdout())

### Name: checkXSD
### Title: XMCDA tree validation.
### Aliases: checkXSD
### Keywords: methods

### ** Examples

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

root<-getNodeSet(tree, "/xmcda:XMCDA")

criteria<-newXMLNode("criteria", parent=root[[1]], namespace=c())

criterion<-newXMLNode("criterion",attrs = c(id="g1"), parent=criteria, namespace=c())

y<-checkXSD(tree)



cleanEx()
nameEx("getAlternativesComparisons")
### * getAlternativesComparisons

flush(stderr()); flush(stdout())

### Name: getAlternativesComparisons
### Title: Get comparisons of alternatives
### Aliases: getAlternativesComparisons
### Keywords: methods

### ** Examples

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

root<-getNodeSet(tree, "/xmcda:XMCDA")

aC<-newXMLNode("alternativesComparisons", parent=root[[1]] , namespace=c())

pairs<-newXMLNode("pairs", parent=aC, namespace=c())
pair<-newXMLNode("pair", parent=pairs, namespace=c())

initial<-newXMLNode("initial", parent=pair)
newXMLNode("alternativeID", "a01", parent=initial, namespace=c())

terminal<-newXMLNode("terminal", parent=pair, namespace=c())
newXMLNode("alternativeID", "a02", parent=terminal, namespace=c())

value<-newXMLNode("value", parent=pair, namespace=c())
newXMLNode("real", "0.5", parent=value, namespace=c())

alternativesIDs <- c("a01","a02")
criteriaIDs <- c("g1","g2")

performance.table<-matrix(nrow=length(alternativesIDs),
                          ncol=length(criteriaIDs),
                          dimnames = list(alternativesIDs,criteriaIDs))

for (i in 1:length(alternativesIDs)){
  for (j in 1:length(criteriaIDs)){
    performance.table[i,j] = runif(1)
  }
}

y<-getNodeSet(tree,"//alternativesComparisons")

x<-getAlternativesComparisons(y[[1]], performance.table)



cleanEx()
nameEx("getAlternativesComparisonsLabels")
### * getAlternativesComparisonsLabels

flush(stderr()); flush(stdout())

### Name: getAlternativesComparisonsLabels
### Title: Get comparisons of alternatives
### Aliases: getAlternativesComparisonsLabels
### Keywords: methods

### ** Examples

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

root<-getNodeSet(tree, "/xmcda:XMCDA")

aC<-newXMLNode("alternativesComparisons", parent=root[[1]], namespace=c())

pairs<-newXMLNode("pairs", parent=aC, namespace=c())
pair<-newXMLNode("pair", parent=pairs, namespace=c())

initial<-newXMLNode("initial", parent=pair, namespace=c())
newXMLNode("alternativeID", "a01", parent=initial, namespace=c())

terminal<-newXMLNode("terminal", parent=pair, namespace=c())
newXMLNode("alternativeID", "a02", parent=terminal, namespace=c())

value<-newXMLNode("value", parent=pair, namespace=c())
newXMLNode("real", "0.5", parent=value, namespace=c())

alternativesIDs <- c("a01","a02")

y<-getNodeSet(tree,"//alternativesComparisons")

x<-getAlternativesComparisonsLabels(y[[1]], alternativesIDs)



cleanEx()
nameEx("getAlternativesIDs")
### * getAlternativesIDs

flush(stderr()); flush(stdout())

### Name: getAlternativesIDs
### Title: Get IDs of alternatives
### Aliases: getAlternativesIDs
### Keywords: methods

### ** Examples

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.0.0"), 
           parent=tree)

root<-getNodeSet(tree, "/xmcda:XMCDA")

alternatives<-newXMLNode("alternatives", attrs=c(mcdaConcept="actions"), 
                         parent=root[[1]], 
                         namespace=c())

alternative<-newXMLNode("alternative",attrs = c(id="x1"), 
                        parent=alternatives, namespace=c())
alternative<-newXMLNode("alternative",attrs = c(id="x2"), 
                        parent=alternatives, namespace=c())
alternative<-newXMLNode("alternative",attrs = c(id="x3"), 
                        parent=alternatives, namespace=c())

y<-getNodeSet(tree,"//alternatives")

x<-getAlternativesIDs(y[[1]])



cleanEx()
nameEx("getAlternativesIntervalValues")
### * getAlternativesIntervalValues

flush(stderr()); flush(stdout())

### Name: getAlternativesIntervalValues
### Title: Get interval values related to alternatives
### Aliases: getAlternativesIntervalValues
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

altIDs <- getAlternativesIDs(tree)

altVals <- getAlternativesIntervalValues(tree, altIDs[[1]], 
                                         mcdaConcept="alternativesIntervalValues")



cleanEx()
nameEx("getAlternativesValues")
### * getAlternativesValues

flush(stderr()); flush(stdout())

### Name: getAlternativesValues
### Title: Get values related to alternatives
### Aliases: getAlternativesValues
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"),
                     useInternalNodes=TRUE)

altIDs <- getAlternativesIDs(tree)

altVals <- getAlternativesValues(tree, altIDs[[1]])



cleanEx()
nameEx("getCriteriaComparisons")
### * getCriteriaComparisons

flush(stderr()); flush(stdout())

### Name: getCriteriaComparisons
### Title: Get comparisons of criteria
### Aliases: getCriteriaComparisons
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

comps <- getCriteriaComparisons(tree, critIDs[[1]])



cleanEx()
nameEx("getCriteriaComparisonsLabels")
### * getCriteriaComparisonsLabels

flush(stderr()); flush(stdout())

### Name: getCriteriaComparisonsLabels
### Title: Get comparisons of alternatives
### Aliases: getCriteriaComparisonsLabels
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"),
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

comps <- getCriteriaComparisonsLabels(tree, critIDs[[1]])



cleanEx()
nameEx("getCriteriaIDs")
### * getCriteriaIDs

flush(stderr()); flush(stdout())

### Name: getCriteriaIDs
### Title: Get IDs of criteria
### Aliases: getCriteriaIDs
### Keywords: methods

### ** Examples

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.0.0"), 
           parent=tree)

root<-getNodeSet(tree, "/xmcda:XMCDA")

criteria<-newXMLNode("criteria", parent=root[[1]], namespace=c())

newXMLNode("criterion",attrs = c(id="g1"), parent=criteria, namespace=c())

newXMLNode("criterion",attrs = c(id="g2"), parent=criteria, namespace=c())

y<-getNodeSet(tree,"//criteria")

x<-getCriteriaIDs(y[[1]])



cleanEx()
nameEx("getCriteriaIntervalValues")
### * getCriteriaIntervalValues

flush(stderr()); flush(stdout())

### Name: getCriteriaIntervalValues
### Title: Get interval values related to criteria
### Aliases: getCriteriaIntervalValues
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

intVals <- getCriteriaIntervalValues(tree, critIDs[[1]])




cleanEx()
nameEx("getCriteriaPairsComparisons")
### * getCriteriaPairsComparisons

flush(stderr()); flush(stdout())

### Name: getCriteriaPairsComparisons
### Title: Get comparisons of pairs of criteria
### Aliases: getCriteriaPairsComparisons
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

comps <- getCriteriaPairsComparisons(tree, critIDs[[1]])



cleanEx()
nameEx("getCriteriaPairsIntervalValues")
### * getCriteriaPairsIntervalValues

flush(stderr()); flush(stdout())

### Name: getCriteriaPairsIntervalValues
### Title: Get interval values related to pairs of criteria
### Aliases: getCriteriaPairsIntervalValues
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

pairsVals <- getCriteriaPairsIntervalValues(tree, critIDs[[1]],
                                            mcdaConcept="interactionIntervals")



cleanEx()
nameEx("getCriteriaPairsValues")
### * getCriteriaPairsValues

flush(stderr()); flush(stdout())

### Name: getCriteriaPairsValues
### Title: Get values related to pairs of criteria
### Aliases: getCriteriaPairsValues
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

pairsVals <- getCriteriaPairsValues(tree, critIDs[[1]],
                                          mcdaConcept="interactionValues")



cleanEx()
nameEx("getCriteriaValues")
### * getCriteriaValues

flush(stderr()); flush(stdout())

### Name: getCriteriaValues
### Title: Get values related to criteria
### Aliases: getCriteriaValues
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

critVals <- getCriteriaValues(tree, critIDs[[1]])



cleanEx()
nameEx("getMobiusCapacities")
### * getMobiusCapacities

flush(stderr()); flush(stdout())

### Name: getMobiusCapacities
### Title: Get Mobius capacities
### Aliases: getMobiusCapacities
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"),
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

capa <- getMobiusCapacities(tree, critIDs[[1]], 5, 5,
                            mcdaConcept="mobiusCapacity")



cleanEx()
nameEx("getNumberOfAlternatives")
### * getNumberOfAlternatives

flush(stderr()); flush(stdout())

### Name: getNumberOfAlternatives
### Title: Get number of alternatives
### Aliases: getNumberOfAlternatives
### Keywords: methods

### ** Examples

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.0.0"), 
           parent=tree)

root<-getNodeSet(tree, "/xmcda:XMCDA")

alternatives<-newXMLNode("alternatives", parent=root[[1]], namespace=c())

newXMLNode("alternative",attrs = c(id="x1"), parent=alternatives, namespace=c())

newXMLNode("alternative",attrs = c(id="x2"), parent=alternatives, namespace=c())

y<-getNodeSet(tree,"//alternatives")

x<-getNumberOfAlternatives(y[[1]])



cleanEx()
nameEx("getNumberOfCriteria")
### * getNumberOfCriteria

flush(stderr()); flush(stdout())

### Name: getNumberOfCriteria
### Title: Get number of criteria
### Aliases: getNumberOfCriteria
### Keywords: methods

### ** Examples

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.0.0"), 
           parent=tree)

root<-getNodeSet(tree, "/xmcda:XMCDA")

criteria<-newXMLNode("criteria", parent=root[[1]], namespace=c())

criterion<-newXMLNode("criterion",attrs = c(id="g1"),
                      parent=criteria, namespace=c())

y<-getNodeSet(tree,"//criteria")

x<-getNumberOfCriteria(y[[1]])



cleanEx()
nameEx("getNumericValue")
### * getNumericValue

flush(stderr()); flush(stdout())

### Name: getNumericValue
### Title: Get a numeric value
### Aliases: getNumericValue
### Keywords: methods

### ** Examples

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.0.0"), 
           parent=tree)

root<-getNodeSet(tree, "/xmcda:XMCDA")

val<-newXMLNode("value", parent=root[[1]], namespace=c())

newXMLNode("real",3.14,parent=val, namespace=c())

y<-getNodeSet(tree,"//value")

x<-getNumericValue(y)



cleanEx()
nameEx("getParameters")
### * getParameters

flush(stderr()); flush(stdout())

### Name: getParameters
### Title: Get parameters
### Aliases: getParameters
### Keywords: methods

### ** Examples

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.0.0"), 
           parent=tree)

root<-getNodeSet(tree, "/xmcda:XMCDA")

parameters<-newXMLNode("methodParameters", parent=root[[1]], namespace=c())

parameter <- newXMLNode("parameter",attrs = c(name="numIt"), 
                        parent=parameters, namespace=c())

value <- newXMLNode("value", parent=parameter, namespace=c())

newXMLNode("integer", value=3, parent=value, namespace=c())

y<-getNodeSet(tree,"//methodParameters")

x<-getParameters(y[[1]])



cleanEx()
nameEx("getPerformanceTables")
### * getPerformanceTables

flush(stderr()); flush(stdout())

### Name: getPerformanceTables
### Title: Get performance tables
### Aliases: getPerformanceTables
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata","testFile.xml",package="RXMCDA"), 
                     useInternalNodes=TRUE)

tables <- getPerformanceTables(tree)



cleanEx()
nameEx("putAlternativeValue")
### * putAlternativeValue

flush(stderr()); flush(stdout())

### Name: putAlternativeValue
### Title: Put a value related to an alternative
### Aliases: putAlternativeValue
### Keywords: methods

### ** Examples

altID <- c("x")

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

putAlternativeValue(tree,0.8,alternativesIDs = altID)



cleanEx()
nameEx("putAlternativesComparisonsLabels")
### * putAlternativesComparisonsLabels

flush(stderr()); flush(stdout())

### Name: putAlternativesComparisonsLabels
### Title: Put comparisons of alternatives
### Aliases: putAlternativesComparisonsLabels
### Keywords: methods

### ** Examples

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

comps <- rbind(c("x", "y", "0.07"), c("y", "z", "0.01"))

altIDs <- c("x","y","z")

putAlternativesComparisonsLabels(tree,comps, mcdaConcept="newComparisons")



cleanEx()
nameEx("putAlternativesValues")
### * putAlternativesValues

flush(stderr()); flush(stdout())

### Name: putAlternativesValues
### Title: Put values related to alternatives
### Aliases: putAlternativesValues
### Keywords: methods

### ** Examples

altIDs <- c("x","y","z")

altVals <- rbind(c(1,1),c(2,0.5),c(3,0.2))

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

putAlternativesValues(tree,altVals,altIDs)

altVals2 <- getAlternativesValues(tree, altIDs)



cleanEx()
nameEx("putCapacity")
### * putCapacity

flush(stderr()); flush(stdout())

### Name: putCapacity
### Title: Put a capacity
### Aliases: putCapacity
### Keywords: methods

### ** Examples

library(kappalab)

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

mu<-capacity(0:15)

a <- Mobius(mu)

critIDs <- c("g1","g2","g3","g4")

putCapacity(tree, a, critIDs, mcdaConcept="capacity")



cleanEx()
nameEx("putCriteriaPairsValues")
### * putCriteriaPairsValues

flush(stderr()); flush(stdout())

### Name: putCriteriaPairsValues
### Title: Put values related to pairs of criteria
### Aliases: putCriteriaPairsValues
### Keywords: methods

### ** Examples

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

critIDs <- c("g1","g2","g3","g4")

pairsVals <- rbind(c(1,2,0.17),c(2,3,0.5), c(3,4,0.16))

putCriteriaPairsValues(tree,pairsVals,critIDs)



cleanEx()
nameEx("putCriteriaValues")
### * putCriteriaValues

flush(stderr()); flush(stdout())

### Name: putCriteriaValues
### Title: Put values related to criteria
### Aliases: putCriteriaValues
### Keywords: methods

### ** Examples

critIDs <- c("x","y","z")

critVals <- rbind(c(1,1),c(2,0.5),c(3,0.2))

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

putCriteriaValues(tree,critVals,critIDs)



cleanEx()
nameEx("putCriterionValue")
### * putCriterionValue

flush(stderr()); flush(stdout())

### Name: putCriterionValue
### Title: Put a value related to a criterion
### Aliases: putCriterionValue
### Keywords: methods

### ** Examples

critID <- c("x")

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

putCriterionValue(tree,0.8,criteriaIDs = critID)



cleanEx()
nameEx("putPerformanceTable")
### * putPerformanceTable

flush(stderr()); flush(stdout())

### Name: putPerformanceTable
### Title: Put a performance table in the XMCDA tree
### Aliases: putPerformanceTable
### Keywords: methods

### ** Examples

performanceTable <- rbind(c(1,2,3),c(4,5,6))

rownames(performanceTable) <- c("x","y")

colnames(performanceTable) <- c("g1","g2","g3")

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

putPerformanceTable(tree,performanceTable)



cleanEx()
nameEx("putPointsCriterionFunction")
### * putPointsCriterionFunction

flush(stderr()); flush(stdout())

### Name: putPointsCriterionFunction
### Title: Put value functions defined by sets of points
### Aliases: putPointsCriterionFunction
### Keywords: methods

### ** Examples

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

x<-list()
x<-c(x,list(g1=rbind(c(1,2),c(3,4))))
x<-c(x,list(g2=rbind(c(5,6),c(7,8),c(9,10))))
x<-c(x,list(g3=rbind(c(11,12))))
x<-c(x,list(g4=rbind(c(13,14),c(15,16))))

putPointsCriterionFunction(tree,x)



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
