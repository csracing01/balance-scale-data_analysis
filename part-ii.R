#PART-II

library(igraph)
a <- read.csv('F:/M.Sc/Project Sem 3-4/Social NW Analysis/R files/balance-scale.csv', header = TRUE)
b <- a[-1, ]
b$class <- NULL

d <- dist(b)

f <- fivenum(d)
thres <- f[2]

print("Threshold")
print(thres)

dm <- d
dm[dm <= thres] <- 1
dm[dm > thres] <- 0

m <- as.matrix(dm)

g <- graph.adjacency(m, mode = "undirected")
g1 <- simplify(g)
#plot(g1, main = "Graph of distances using 1st quartile as threshold")

print("No. of vertices")
v <- vcount(g1)
print(v)
print("No. of edges")
e <- ecount(g1)
print(e)
print("Node-to-edge ratio")
print(v/e)
print("Graph")
print(g1)

#layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))

#plot(g1, main = "Graph of distances using 1st quartile as threshold")

deg <- degree(g1)
t <- table(deg)
print("Degrees with their respective frequencies")
print(t)

#h1 <- hist(deg, breaks = seq(0, v-1, by = 1), xlab = "Degree (k)",
 #          las = 1, main = "Histogram showing Degree Distribution",
  #         ylim = c(0, ((max(t)%/%10+1)*10)))

###print(h1)
plot(t, xlab = "Degree (k)", ylab = "Frequency",
           las = 1, main = "degree vs frequency plot",
     xlim = c(0,v-1),
     ylim = c(0, ((max(t)%/%10+1)*10)))

# Frequency is the no. of nodes having a particular degree

dd <- degree.distribution(g1)
l <- length(dd)
dd_all <- rep(dd, length.out = v)
dd_all[l:v] <- 0

#plot(dd_all, main = "Degrees plotted with their Probabilities", ylab = "P[degree = k]",
 #    xlab = "Degree (k)", las = 1)
#lines(dd_all)

#h3 <- hist(deg, breaks = seq(0, v-1, by = 1), xlab = "Degree (k)",
 #          ylab = "P[deg=k]", las = 1, freq = FALSE,
  #         main = "Histogram of degree vs probability")



print("Radius")
print(radius(g1))

print("Diameter")
print(diameter(g1))

e <- eccentricity(g1)

#rm(list = ls())
detach("package:igraph", unload = TRUE)