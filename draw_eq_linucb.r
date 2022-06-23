
library(readxl)

setwd('C:\\Users\\tongw\\OneDrive - Temple University\\Research\\MAB\\code\\R')

source('theme_setting.r')

png("eq_linucb.png", units="in", width=5, height=3, res=300)


eq_linucb_bias        <- read_excel("eq_linucb_bias.xlsx")
names(eq_linucb_bias) <- c('beta', 
                          'contextual_bandits', 
                          'RBA', 
                          'suggested_W', 
                          'controlled_std_W')








p_ucb_bias <- ggplot(data=eq_linucb_bias, aes(x=beta))                       + 
  geom_line(aes(y=contextual_bandits, 
                color='contextual_bandits'))                                   +                                       
  geom_line(aes(y=RBA, 
                color='RBA'))                                                 + 
  geom_line(aes(y=suggested_W, 
                color='suggested_W'))                                          + 
  geom_line(aes(y=controlled_std_W,
                color='controlled_std_W'))                                     + 
  ylim(-0.3,0.1)                                                           + 
  geom_hline(yintercept=0, 
             linetype = "dashed")                                          +
  labs(x='c', 
       y=expression(paste('Bias of estimating',beta[2](1))) )               +
  scale_colour_manual("",
                      breaks = names(eq_linucb_bias)[-1],
                      values = colors)






eq_linucb_std         <- read_excel("eq_linucb_std.xlsx")
names(eq_linucb_std) <- c('beta', 
                         'contextual_bandits', 
                         'RBA', 
                         'suggested_W', 
                         'controlled_std_W')



p_ucb_std <- ggplot(data=eq_linucb_std, aes(x=beta))                             + 
  geom_line(aes(y=contextual_bandits, 
                color='contextual_bandits'))                                   +                                       
  geom_line(aes(y=RBA, 
                color='RBA'))                                                 + 
  geom_line(aes(y=suggested_W, 
                color='suggested_W'))                                          + 
  geom_line(aes(y=controlled_std_W,
                color='controlled_std_W'))                                     + 
  ylim(0,1.5)                                                                  + 
  labs(x='c', 
       y=expression(paste('Bias of estimating',beta[2](1))) ) +
  scale_colour_manual("",
                      breaks = names(eq_linucb_std)[-1],
                      values = colors)





grid_arrange_shared_legend(p_ucb_bias,
                           p_ucb_std,
                           nrow=1, ncol=2)


dev.off()
