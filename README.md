# TimScheme
TimScheme is not a specific implementation of Scheme. It is a specification that defines essential features for TeXmacs.

It aims to guide developers to make an existing Scheme implementation work for TeXmacs with minimal changes to the TeXmacs scheme code base and minimal extensions to the existing Scheme implementation.

# Ideas
After investigations on R7RS, it may be too hard to make it work without modifying the current scheme code base. Here is my solution:

1. Do not modify all the current the scheme code in the SVN repo
2. Remove the usage of Guile only syntax or define these behaviors in the `boot.scm`
3. Use `simple` scripts to correct the scheme code for R7RS small (eg. the usage of module)

# Tasks
## Task 1
1. `inherit-modules`: load a list of modules and export the public symbols
2. `texmacs-module`: define the name, the dependencies of a module
3. `define-public` and `define-public-macro`: the functions and macros that can be exported
