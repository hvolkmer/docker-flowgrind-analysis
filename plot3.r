# to be used like this:
# ARGS:
# log1.log  1. Log
# log2.log  2. Log
# log3.log  3. Log
# output.png  Ouput file
# "3x3 VM pairs/flows" Title
library(ggplot2);
args <- commandArgs(trailingOnly = TRUE)
print(args)

log1 <- args[1]
log2 <- args[2]
log3 <- args[3]
outputfile <- args[4]
graphtitle <- args[5]

df1 <- data.frame(read.table(log1))
df1 <- df1[df1$V1=="S",]
print(head(df1))
df2 <- data.frame(read.table(log2))
df2 <- df2[df2$V1=="S",]
print(head(df2))
df3 <- data.frame(read.table(log3))
df3 <- df3[df3$V1=="S",]
print(head(df3))

time <- data.frame(seconds=df1[df1$V2==0,'V3'])
df <- data.frame(a0=df1[df1$V2==0,'V5'],
                 a1=df1[df1$V2==1,'V5'],
                 a2=df1[df1$V2==2,'V5'],
                 
                 b0=df2[df2$V2==0,'V5'],
                 b1=df2[df2$V2==1,'V5'],
                 b2=df2[df2$V2==2,'V5'],
                 
                 c0=df3[df3$V2==0,'V5'],
                 c1=df3[df3$V2==1,'V5'],
                 c2=df3[df3$V2==2,'V5'])


print(head(df))
print(head(rowSums(df)))
print("Avg. rowsum")
print(mean(rowSums(df)))


ggplot(df, aes(x=time$seconds,xmax=max(time$seconds))) +
  #geom_area(aes(y=a0), fill="lightblue") +
  #geom_ribbon(aes(ymin=a0, ymax=a0+b1), fill="blue") +
  #geom_ribbon(aes(ymin=a0+b1, ymax=a0+b1+c2), fill="darkblue") +
  geom_area(aes(y=a0), fill="lightblue") +
  geom_ribbon(aes(ymin=a0, ymax=a0+a1), fill="blue") +
  geom_ribbon(aes(ymin=a0+a1, ymax=a0+a1+a2), fill="darkblue") +
  geom_ribbon(aes(ymin=a0+a1+a2, ymax=a0+a1+a2+b0), fill="pink") +
  geom_ribbon(aes(ymin=a0+a1+a2+b0, ymax=a0+a1+a2+b0+b1), fill="red") +
  geom_ribbon(aes(ymin=a0+a1+a2+b0+b1, ymax=a0+a1+a2+b0+b1+b2), fill="darkred") +
  geom_ribbon(aes(ymin=a0+a1+a2+b0+b1+b2, ymax=a0+a1+a2+b0+b1+b2+c0), fill="lightgreen") +
  geom_ribbon(aes(ymin=a0+a1+a2+b0+b1+b2+c0, ymax=a0+a1+a2+b0+b1+b2+c0+c1), fill="green") +
  geom_ribbon(aes(ymin=a0+a1+a2+b0+b1+b2+c0+c1, ymax=a0+a1+a2+b0+b1+b2+c0+c1+c2), fill="darkgreen") +
  ylab("Throughput (Mbits/s)") +
  xlab("Time (seconds)") +
  scale_y_continuous(limits=c(0,10000)) +
  scale_x_continuous(limits=c(0,300), breaks=seq(0,300,by=60)) +
  ggtitle(graphtitle)

ggsave(file=outputfile)
