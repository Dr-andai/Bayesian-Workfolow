library(plotly)

# This code is designed to visualize Bayesian posterior distributions for different sample means 𝑥ˉ
# and prior probabilities that 𝜇 (the unknown mean) exceeds a certain effect size (here, 2). 

ppost <- function(n){
    #  xbar (observed sample means, here set to 0, 1, and 2)
    #  Plarge (the prior probability that 𝜇 > 2; set at 0.01, 0.05, and 0.25)

    d <- expand.grid(xbar = 0:2, Plarge = c(.01, .05, .25))
    p <- plot_ly()
    
    # A loop runs through each row of d, calculating and plotting prior and posterior distributions for each scenario.
    for (i in 1 : nrow(d)){
        w       <- d[i, ]
        xbar    <- w$xbar
        plarge  <- w$Plarge
        psigma  <- 2 / qnorm(1 - plarge)
        vs      <- 1 / sqrt(n)
        vpre    <- psigma ^ 2
        vpost   <- 1 / (1 / vpre + 1 / vs)
        mpost   <- xbar * vpost / vs
        mu      <- seq(-3, 3, by = 0.02)
        lab     <- paste0('<span style="text-decoration: overline">x</span>=', xbar, ' prior P(μ > 2)=', plarge)
        pp     <- dnorm(mu, mpost, sqrt(vpost))
        priorp <- dnorm(mu, 0, psigma)
        vis <- if(i == 1) TRUE else 'legendonly'
        p <- p %>% add_lines(x=~mu, y=~priorp, hoverinfo='none', visible=vis, legendgroup=lab,
                            name=paste0(lab, ':', 'prior'), opacity=0.2, data=data.frame(mu, priorp))
        pexceed <- 1 - pnorm(mu, mpost, sqrt(vpost))
        txt <- paste0('μ=', round(mu, 2), ' P(μ > ' , round(mu, 2), ')=', round(pexceed, 2))
        p <- p %>% add_lines(x=~mu, y=~pp, text=~txt, hoverinfo='text',
                            visible=vis, legendgroup=lab,
                            name=paste0(lab, ':', 'posterior'), data=data.frame(mu, pp, txt))
    }
    p %>% layout(xaxis=list(title='μ'),
                yaxis=list(title='Probability Density Function', range=c(0, 1.35)))
}

ppost(50)