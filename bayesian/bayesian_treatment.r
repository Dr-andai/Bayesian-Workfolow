# biased coin with P(heads) = 0.6
# randomly mixes 6 fair coins. 3/10 of coins are fair
# only two values are possible 0.5 and 0.6

# before knowing anything, prior distribution is
prior_1 <- 0.3
prior_2 <- 0.7

# y = observed number of heads
n <- 40
y <- 5:35

post1 <- prior_1 * (0.5 ^ y) * (0.5 ^ (n - y))
post2 <- prior_2 * (0.6 ^ y) * (0.4 ^ (n - y))

total <- post1 + post2
post_1 <- post1 / total
post_2 <- post2 / total

plot(y, post_1, type = "n", xlab = expression(y), ylab = "Posterior probability") # nolint: line_length_linter.
abline(v = c(20, 23), col = gray(.9))
abline(h = prior_2, col = gray(.9))
lines(y, post_1)
lines(y, post_2, col = 'blue')
text(23.5, 0.75, 'P(coin is 0.6 unfair) ↑\nwith # heads',
     col='blue', adj=0)
text(23.5, 0.28, 'P(coin is fair) ↓\nwith # heads', adj=0)