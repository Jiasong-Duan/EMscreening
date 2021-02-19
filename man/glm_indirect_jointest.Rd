\name{glm_indirect_jointest}
\alias{glm_indirect_jointest}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Function to test indirect effects of exposure and potential mediator on the binary outcome
%%  ~~function to do ... ~~
}
\description{
The effect of exposure on the potential mediator is tested by linear regression model. And the joint effect of the exposure and mediator on the outcome is tested by logistic regression model.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
glm_indirect_jointest(data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
The tested data matrix with dimension of n by 3. The rows represent n subjects. The column 1, 2, 3 represent the data for the exposure variable, outome variable, and potential mediator, respectively.
%%     ~~Describe \code{x} here~~
}
}
\details{
See https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html \cr
    https://stat.ethz.ch/R-manual/R-devel/library/stats/html/glm.html
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{pvalue}{A vector consisting of p-values of the two tests.}
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Original lm: Chambers, J. M. (1992) Linear models. Chapter 4 of Statistical Models in S eds J. M. Chambers and T. J. Hastie, Wadsworth & Brooks/Cole. \cr
Wilkinson, G. N. and Rogers, C. E. (1973). Symbolic descriptions of factorial models for analysis of variance. Applied Statistics, 22, 392–399. doi: 10.2307/2346786. \cr
%% ~put references to the literature/web site here ~
\cr
Original glm: Dobson, A. J. (1990) An Introduction to Generalized Linear Models. London: Chapman and Hall. \cr
Hastie, T. J. and Pregibon, D. (1992) Generalized linear models. Chapter 6 of Statistical Models in S eds J. M. Chambers and T. J. Hastie, Wadsworth & Brooks/Cole. \cr
McCullagh P. and Nelder, J. A. (1989) Generalized Linear Models. London: Chapman and Hall. \cr
Venables, W. N. and Ripley, B. D. (2002) Modern Applied Statistics with S. New York: Springer. \cr
}
\author{
Original lm: R Core Team and contributors worldwide \cr
Original glm: R Core Team and contributors worldwide
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
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
