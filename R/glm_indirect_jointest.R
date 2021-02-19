##Function for joint effects
##Functions for the joint method binary outcomes
glm_indirect_jointest=function(datanew){
  alpha.p<-summary(lm(datanew[,"M"]~datanew[,"X"]))$coef[2,c("Pr(>|t|)")]
  beta.p<-summary(glm(datanew[,"Y"]~datanew[,"M"]+datanew[,"X"],family = 'binomial'))$coef[2,c("Pr(>|z|)")]
  pvalue=max(alpha.p,beta.p)
  return(pvalue)
}
