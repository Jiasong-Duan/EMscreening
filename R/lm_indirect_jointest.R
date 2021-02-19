##Function for joint effects
###Functions for the joint method continuous outcomes
lm_indirect_jointest=function(datanew){
  alpha.p<-summary(lm(datanew[,"M"]~datanew[,"X"]))$coef[2,c("Pr(>|t|)")]
  beta.p<-summary(lm(datanew[,"Y"]~datanew[,"M"]+datanew[,"X"]))$coef[2,c("Pr(>|t|)")]
  pvalue=max(alpha.p,beta.p)
  return(pvalue)
}
