# Characterizing the Complexity of Human Balance

Here is the poster and some MATLAB code I wrote for the NASA Colorado Space Grant Consortium project on human balance.

[COSGC Poster](https://github.com/akayeedu/Human-Balance/blob/main/COSGC_balance.pdf)

## Description

This is a pilot study in designing information-theoretic tools that could non-invasively distinguish balance behaviors of healthy and impaired individuals (such as those with external injuries, neurological trauma, or movement disorders) from a force plate signal. Certain time series (such as human balance) appear noisy but may have an underlying deterministic mechanism. The Lempel-Ziv Complexity (LZC) is a good measure for capturing these types of dynamics. The LZC measures the irregularity of a symbolic sequence by counting the number of copy operations needed to reproduce the sequence. The Bandt-Pompe permutation method coarse-grains a real-valued time series into a symbolic sequence by assigning symbols based on the rankings of values of nearby points in the time series. Combining these approaches gives the Lempel-Ziv Permutation Complexity (PLZC), and this MATLAB code can be used on any time series to determine its PLZC. The PLZC signature may provide a measure that distinguishes the messy signals of healthy and impaired individuals.

NOTE: This repository only includes the PLZC code and an example denoised/detrended time series to analyze (jerk_signal.mat). It does not include any code needed to filter or wavelet-decompose a raw nonstationary signal.

## Getting Started

### Requirements

* MATLAB or MATLAB Online

### Installing

* Feel free to directly download the raw .m files or the ZIP containing the program files, but ensure they are stored in a directory where MATLAB can reference multiple of these files to run the program.

### Basic Execution

* Download program files and open MATLAB.
* Read in the included human balance signal. This signal is proportional to the mechanical jerk of the foot.
```
load("jerk_signal.mat","jerk_ser")
```
* Coarse-grain the series using the bp_perm.m function (will output a cell array). Choose embedding parameters D and tau (integers, see bp_perm.m file for instructions).
```
coarse_grained_series = bp_perm(jerk_ser,D,tau)
```
* Determine the Lempel-Ziv Complexity of the coarse-grained series using the lzcell.m function. It will return a number.
```
lzcell(coarse_grained_series)
```
### Creating a Sliding Window Plot
The user can pick a window size (w_size, number of samples) and how much the windows overlap (w_overlap, a percentage 0-99). w_slide.m slides this window over the time series and determines the PLZC at each of these windows.
* Read in the included human balance signal (see above).
* Choose embedding parameters D and tau. Then choose w_size and w_overlap.
```
w_slide(jerk_ser,D,tau,w_size,w_overlap)
```
w_slide.m will return an array of the PLZC values corresponding to each window. One graph will show the time-evolution of the PLZC. The other graph (a histogram) shows how often a certain PLZC value occurred among the windows. 
### Deep Dive: Exhaustive History of a Signal
We can plot a time series and indicate where in the series the Lempel-Ziv Complexity increased with spikes. These partitions comprise the exhaustive history of the signal (and we need ex_hist.m for the program to work).
* Read in the included human balance signal (see above).
* Zooming in on part of the signal makes the exhaustive history graph easier to read. Select 2000 points of the balance signal to analyze.
```
short_series = jerk_ser(2001:4000)
```
* Run lzc_partition.m with chosen D and tau to see the exhaustive history graph.
```
lzc_partition(short_series,D,tau)
```

We can see the collection of rank vectors directly from the ex_hist.m program.
* Coarse grain a series using bp_perm.m, and assign it to a variable.
* Run the ex_hist.m function on the series to return the exhaustive history.
```
ex_hist(coarse_grained_series)
```
## Help

Attempting to run lzc_partition.m again after creating a graph may cause issues. Clear stored variables and try again.

lzcell.m and ex_hist.m can run on ANY 1-D cell array input.
The input sequence aaabbaba should be formatted as cell array {'a';'a';'a';'b';'b';'a';'b';'a'}.

## Authors

Complexity code by Ari Kaye (akaye.edu@gmail.com)

Signal processing and data collection by Dr. Matthew Semak (matthew.semak@unco.edu)

## Good References
* [Combining LZC with Bandt-Pompe Method](https://arxiv.org/pdf/1310.1379)
* [Original Paper on Lempel-Ziv Complexity](https://ieeexplore.ieee.org/document/1055501)
* [Lempel-Ziv Complexity on Biomedical Signals](https://pubmed.ncbi.nlm.nih.gov/17073334/)

