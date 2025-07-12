# Characterizing the Complexity of Human Balance

Here is some MATLAB code I wrote for the NASA Colorado Space Grant Consortium project on human balance.

## Description

This is a pilot study in designing information-theoretic tools that could non-invasively distinguish balance behaviors of healthy and impaired individuals (such as those with external injuries, neurological trauma, or movement disorders) from a force plate signal. Certain time series (such as human balance) appear noisy but may have an underlying deterministic mechanism. The Lempel-Ziv Complexity (LZC) is a good measure for capturing these types of dynamics. The LZC measures the irregularity of a symbolic sequence by counting the number of copy operations needed to reproduce the sequence. The Bandt-Pompe permutation method coarse-grains a real-valued time series into a symbolic sequence by assigning symbols based on the rankings of values of nearby points in the time series. Combining these approaches gives the Lempel-Ziv Permutation Complexity (PLZC), and this MATLAB code can be used on any time series to determine its PLZC. The PLZC signature may provide a measure that distinguishes the messy signals of healthy and impaired individuals.

## Getting Started

### Dependencies

* Describe any prerequisites, libraries, OS version, etc., needed before installing program.
* ex. Windows 10

### Installing

* How/where to download your program
* Any modifications needed to be made to files/folders

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

## Version History

* 0.2
    * Various bug fixes and optimizations
    * See [commit change]() or See [release history]()
* 0.1
    * Initial Release

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc.
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
* [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* [dbader](https://github.com/dbader/readme-template)
* [zenorocha](https://gist.github.com/zenorocha/4526327)
* [fvcproductions](https://gist.github.com/fvcproductions/1bfc2d4aecb01a834b46)
