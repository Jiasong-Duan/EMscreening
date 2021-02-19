\name{EMscreening}
\alias{EMscreening}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A two-step function to select informative mediators
%%  ~~function to do ... ~~
}
\description{
A two-step function to select informative mediators for the outcome of interest from a DNA methylation pool. The first step is a preliminary screening process that tests all engaged DNA methylation sites by using linear regression model or logistic regression model for continuous outcome and binary outcome, respectively. This step filters out the DNA methylation sites without significant effect on the response. Based on the selected sites from the first step, the second step identifies the informative mediators by performing testings for the divided traning samples and testing samples.  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
EMscreening(Phenotype,DNAm,Continuous=TRUE,Cutoff.Joint=0.1,Iterations=100,Train.Pvalue=0.05,Test.Pvalue=0.05,Percentage=0.5)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Phenotype}{
Data matrix of phenotype data with dimension of n by 2. The rows are n subjects. The first column represents the data for the exposure variable, and the second column represents the data for the outcome variable.
%%     ~~Describe \code{x} here~~
}
\item{DNAm}{
Data matrix of DNA methylation data with dimension of m by n, where m is the number of DNA methylation sites and n is the number of subjects. Each row represents DNA methylation measures of one CpG sites for all the subjects. Row names are the CpG names.
}
\item{Continuous}{
Logical, TRUE if the outcome variable is continuous, and FALSE if the outcome is binary.
}
\item{Cutoff.Joint}{
The significance level to select DNA methylation sites when testing their effects on the response in step 1. The default is 0.01, and user can choose from 0 to 1.
}
\item{Iterations}{
Total iterations needed in testing the training data and testing data in step 2. The default is 100.
}
\item{Train.Pvalue}{
The significance level to select DNA methylation sites when testing the training data in step 2. The default is 0.05.
}
\item{Test.Pvalue}{
The significance level to select DNA methylation sites when testing the testing data in step 2. The default is 0.05.
}
\item{Percentage}{
The cutoff of the selected times of a mediator in step 2 over the defined iterations. The default is 50\%.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
The whole screening process consists of two dependent steps. \cr
In the first step, every potential mediator is screened and selected based on its indirect joint effect with a exposure on the outcome. \cr
In the second step, samples for each DNA methylation sites selected from step 1 are split to traning part and testing part. For one site, its effect on the outcome is evaluated again by using the two seperate data. If the tested effects pass the significance levels in both traning data and testing data, the tested site is selected. This process is called one iteration. Every DNA methylation site needs to be tested for a number of iterations. Once the percentage of being selected of the measured site pass the set cutoff, it is eventually screened out as a mediator for the interested outcome.}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
\item{Final_results}{The data matrix containing statistics for the selected mediators. If no mediators selected, "No mediators identified from the joint screening method" will be shown. If there are mediators selected, in the output, the column 1 represents the mediators' names; The column 2 shows the relative frequency of pass the screening; The column 3-6 are the estimated parameters, standard errors, z-values, and p-values for the indirect effect of the tested DNA methylation site and exposure on outcome; The column 7-10 are the estimated parameters, standard errors, z-values, and p-values for the effect of the tested exposure on the tested DNA methylation site;. The column 11-14 are the estimated parameters, standard errors, z-values, and p-values for the direct effect of the tested DNA methylation site on outcome; The column 15-18 are the estimated parameters, standard errors, z-values, and p-values for the total effect (indirect+ direct) of the tested DNA methylation site and exposure on outcome.}
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
library(EMscreening)
##Simulate data
##Assign parameters to generate data
n=200 # sample size
p <- 500 # the number of mediators
# the regression coefficients alpha (exposure --> mediators)
alpha <- rep(0, p)
# the regression coefficients beta (mediators --> outcome)
beta1 <- rep(0, p)
# for continuous outcome
beta2 <- rep(0, p)

# for binary outcome
# the first four markers are true mediators
alpha[1:4] <- c(0.45,0.5,0.6,0.7)
beta1[1:4] <- c(0.55,0.6,0.65,0.7)
beta2[1:4] <- c(1.45,1.5,1.55,1.6)
# these are not true mediators
alpha[7:8] <- 0.5
beta1[5:6] <- 0.8
beta2[5:6] <- 1.7

##Continuous outcome
##Phenotype data
set.seed(1000)
ck <- runif(p, 0, 2)
X <- rnorm(n, mean = 0, sd = 1.5)
  e <- rnorm(n, 0, 1.2)
  M<- ck[i] + X * alpha[i] + e
  E <- rnorm(n, 0, 1)
  Y <- 0.5 + 0.5*X+ beta1[i]*M + E
  PHENOTYPEdata=cbind(X,Y)
  colnames(PHENOTYPEdata)=c(Exposure,Response)
PHENOTYPEdata
##DNAm data
DNAmdata=matrix(nrow=p,ncol=n)
for (j in 1:p){
set.seed(1000*j)
ck <- runif(p, 0, 2)
X <- rnorm(n, mean = 0, sd = 1.5)
  e <- rnorm(n, 0, 1.2)
  M<- ck[i] + X * alpha[i] + e
  DNAmdata[j,]=M
}
rownames(DNAmdata)=paste("M",seq(1,p),sep="")
dim(PHENOTYPEdata)
dim(DNAmdata)
##Run the screening
TryContinuous=EMscreening(PHENOTYPEdata,DNAmdata)
##Ease the criteria
TryContinuous2=EMscreening(PHENOTYPEdata,DNAmdata,Continuous=TRUE,Cutoff.Joint=0.1,Iterations=100,Train.Pvalue=0.8,Test.Pvalue=0.8,Percentage=0.01)


##Binary outcome
##Phenotype data
set.seed(1000)
ck <- runif(p, 0, 2)
X <- rnorm(n, mean = 0, sd = 1.5)
e <- rnorm(n, 0, 1.2)
M<- ck[i] + X * alpha[i] + e
E <- rnorm(n, 0, 1)
Y <- 0.5 + 0.5*X+ beta1[i]*M + E
Y <- ifelse (Y>quantile(Y,0.15),0, 1)
PHENOTYPEdata=cbind(X,Y)
colnames(PHENOTYPEdata)=c(Exposure,Response)
PHENOTYPEdata
##DNAm data
DNAmdata=matrix(nrow=p,ncol=n)
for (j in 1:p){
  set.seed(1000*j)
  ck <- runif(p, 0, 2)
  X <- rnorm(n, mean = 0, sd = 1.5)
  e <- rnorm(n, 0, 1.2)
  M<- ck[i] + X * alpha[i] + e
  DNAmdata[j,]=M
}
rownames(DNAmdata)=paste("M",seq(1,p),sep="")
dim(PHENOTYPEdata)
dim(DNAmdata)
##Run the screening
TryBinary=EMscreening(PHENOTYPEdata,DNAmdata)
##Ease the criteria
TryBinary2=EMscreening(PHENOTYPEdata,DNAmdata,Continuous=TRUE,Cutoff.Joint=0.1,Iterations=100,Train.Pvalue=0.8,Test.Pvalue=0.8,Percentage=0.01)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
