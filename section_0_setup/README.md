# R 

The first tool we need is a recent version of R. At the time of 
writing, the most recent version is `3.1.0` and that is the version
you need to have to use `Rcpp11`. 

# A C++ compiler

Next, we need a C++ compiler that implements the C++11 standard. Current 
versions of [gcc](https://gcc.gnu.org/) and [clang](http://clang.llvm.org/)
support C++11. 

## Windows

Let's start with Windows. The [Rtools](http://cran.r-project.org/bin/windows/Rtools/)
distribution ships many tools, including a build of gcc version 4.6.2. This 
does not give you full C++11 support, but that comes close enough. 

This gives you an experimental implementation of `C++11`, back when it was 
still called `C++0x`. In particular this does not include support for
`C++11` threads or template aliases, but for the most part, you should be able 
to use `Rcpp11` with this compiler suite. 

The [mingw-w64](http://mingw-w64.sourceforge.net/) project ships more recent
builds of gcc. 

## OSX 

On OSX, you need to install `XCode` and its command line tools. On versions 
of OSX greater than `10.9.3` (Mavericks), you get a version `clang` that 
fully supports C++11. 

## Linux

On Linux, it all depends on your distribution. I'd recommend to get the 
latest available version of gcc (at least 4.8.0). 

# Rcpp11

Next, you need to install `Rcpp11`. You can either get a stable version from
CRAN. 


```r
install.packages( "Rcpp11" )
```

Or a development version from github: 


```r
devtools::install_github("Rcpp11/Rcpp11")
```

The package consists of only header files, it contains no R code and 
no `.cpp` files in the `src/` directory. It does not even have a `src/` 
directory. Installation should be trivial. 

# attributes

Next, you need the [attributes](https://github.com/Rcpp11/attributes)
package. This package is not yet on CRAN, so you need a development
version, but it is pretty stable and routinely used for our unit tests. 


```r
devtools::install_github("Rcpp11/attributes")
```

# Let's try

Once all this is installed, we can try to compile our first `.cpp` file
with `atributes::sourceCpp`. Let's put the following code in the `test.cpp`
file: 

```cpp
#include <Rcpp11>

// [[export]]
IntegerVector test(){
    return {1,2,3} ;
}
```

If everything is installed properly, we should be able to compile
the `test.cpp` file with `sourceCpp` and use the `test` function: 


```r
attributes::sourceCpp( "test.cpp" )
test()
```

```
## [1] 1 2 3
```

