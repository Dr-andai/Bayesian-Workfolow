# Towards A Bayesian Workflow

This is a learning repository, focused on grasping maths and coding concepts in Bayesian Stats.
We start by covering concenpts in Probability theory. Covering both Discrete and conitnous probability.

# Probability Distribution
This repository sets to offer an Introduction to Probability Distribution by looking into different types of distribution.
We'll attempt to visualize Discrete distributions (Bernoulli, Binomial, Possion and Geomtric Distribution.)
The Code snippets and notes are borrowed from
https://github.com/tirthajyoti/Stats-Maths-with-Python/blob/master/Prob_Distributions_Discrete.ipynb

We then build on conitnous probability, tackle Gausian distribution

In addition, the project covers some basic introduction to Think Bayes and Simulations

# SHINY
Try and implement the disrtributions on a SHINY APP
A demo on creating a Shinylive application for deployment on a static web
steps
- shiny create myapp
Next, create the distribution with shinylive:
- shinylive export myapp site
The resulting site directory will contain the following files (among others that are not shown for brevity):

site
├── app.json          # The application's files serialized to JSON
├── index.html        # A web page for the application
├── edit
│   └── index.html    # A web page for an editor view of the application
├── shinylive-sw.js   # Shinylive service worker
└── shinylive         # Shinylive content
    └── pyodide       # Pyodide files


This directory can now be deployed to a static web hosting service.

You can preview the application by serving the files in the site directory:
python3 -m http.server --directory site 8008