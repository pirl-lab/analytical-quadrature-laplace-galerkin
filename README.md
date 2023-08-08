# Analytical Quadrature Laplace Galerkin

## Introduction
This repository contains a Matlab implementation of the algorithm presented in the following paper:
Gumerov, Nail A., Shoken Kaneko, and Ramani Duraiswami. "Analytical Galerkin boundary integrals of Laplace kernel layer potentials in $\mathbb{R}^3$." https://arxiv.org/abs/2302.03247 (2023).


## Description

- The main routine of the proposed algorithm is implemented in GalerkinLaplaceTriGS.m. It recursively calls I3, I2, I1, and I0 functions for the recursive dimensionality reduction. 
- GalerkinLaplaceTriNum.m implements the evaluation of Galerkin integrals using the integrate2 function from Matlab as a reference.
- Scripts starting with plot_Fig can be used to produce the plots in the paper.

## Author
This code base was implemented by Dr. Nail A. Gumerov (https://www.umiacs.umd.edu/people/gumerov).

## License
This code is made public under the creative commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0) license.
