library(plyr)
library(ggplot2)
library(scales)
library(grid)

times <- read.table("times.txt")
lines <- read.table("lines.txt")
lemmas <- read.table("lemmas.txt")

all_data <- data.frame(times=times$V1,
                       lines=lines$V1,
                       lemmas=lemmas$V1)

cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

p1 <- ggplot(all_data, aes(x=times/60, y=lines/1e3)) +
             geom_line(size=1) +
             ylab("KLOC") +
             xlab("")
p2 <- ggplot(all_data, aes(x=times/60, y=lemmas)) +
             geom_line(size=1) +
             xlab("total time spent, hours") +
             ylab("# of lemmas")
             

png("progress.png",width=1700,height=1200,res=140)
grid.newpage()
grid.draw(rbind(ggplotGrob(p1), ggplotGrob(p2), size="last"))
dev.off()
#ggsave(filename="progress.png")

# all_data <- data.frame(V1=integer(), V2=integer(),
#                        V3=integer(), V4=integer(),
#                        V5=integer(),
#                        middlebox=character())

# netfilter <- read.table("netfilter-mf-find-mg-1p.txt")
# netfilter["middlebox"] <- "NetFilter"
# vignat <- read.table("vignat-mf-find-mg-1p.txt")
# vignat["middlebox"] <- "VigNAT"
# nop <- read.table("nop-mf-find-mg-1p.txt")
# nop["middlebox"] <- "NOP"
# unverified <- read.table("unverified-mf-find-mg-1p.txt")
# unverified["middlebox"] <- "DPDK-unverified"

# all_data <- rbind(all_data, netfilter)
# all_data <- rbind(all_data, vignat)
# all_data <- rbind(all_data, nop)
# all_data <- rbind(all_data, unverified)


# p <- ggplot(all_data, aes(x=V1/1000, y=V4/1e6,
#                           group=middlebox,
#                           color=middlebox,
#                           shape=middlebox)) +
#      geom_line(size=1) +
#      labs(title="Loopback throughput, 1% packets lost") +
#      xlab("# concurrent flows (K)") +
#      ylab(bquote("Throughput Mpkt/s")) +
#      theme_bw() +
#      expand_limits(x=0,y=0)

# ggsave(filename="thru.png")
# print(p)
