data {
  int<lower=0> N;
  int<lower=0> K;
  matrix[N, K] x;
  int<lower=0, upper=1> y[N];
}

parameters {
  real alpha;
  vector[K] beta;
}

model {
  alpha ~ normal(0, 10);
  beta ~ normal(0, 10);
  y ~ bernoulli_logit(alpha + x * beta);
}
generated quantities {
  real alpha_2;
  vector[K] beta_2;

  alpha_2 = square(alpha);
  beta_2 = square(beta);
}
