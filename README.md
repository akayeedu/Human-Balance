# Characterizing the Complexity of Human Balance

Here is some MATLAB code I wrote for the NASA Colorado Space Grant Consortium project on human balance.

## Description

This is a pilot study in designing information-theoretic tools that could non-invasively distinguish balance behaviors of healthy and impaired individuals (such as those with external injuries, neurological trauma, or movement disorders) from a force plate signal. Certain time series (such as human balance) appear noisy but may have an underlying deterministic mechanism. The Lempel-Ziv Complexity (LZC) is a good measure for capturing these types of dynamics. The LZC measures the irregularity of a symbolic sequence by counting the number of copy operations needed to reproduce the sequence. The Bandt-Pompe permutation method coarse-grains a real-valued time series into a symbolic sequence by assigning symbols based on the rankings of values of nearby points in the time series. Combining these approaches gives the Lempel-Ziv Permutation Complexity (PLZC), and this MATLAB code can be used on any time series to determine its PLZC. The PLZC signature may provide a measure that distinguishes the messy signals of healthy and impaired individuals.

NOTE: This repository only includes the PLZC code and an example denoised/detrended time series to analyze (jerk_signal.mat). It does not include any code needed to filter a raw nonstationary signal.

## Getting Started

### Requirements

* MATLAB or MATLAB Online

### Installing

* Feel free to directly download the raw .m files or the ZIP containing the program files.

### Executing program

* How to run the program
* Step-by-step bullets
```
code blocks for commands
```

## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```

## Authors

Contributors names and contact info

Ari Kaye (akaye.edu@gmail.com)

Dr. Matthew Semak (matthew.semak@unco.edu)


## Acknowledgments

Inspiration, code snippets, etc.
* [awesome-readme](https://github.com/matiassingers/awesome-readme)

