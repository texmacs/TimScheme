# TimScheme
TimScheme is not a specific implementation of Scheme. It is a specification that defines essential features for TeXmacs.

It aims to guide developers to make an existing Scheme implementation work for TeXmacs with minimal changes to the TeXmacs scheme code base and minimal extensions to the existing Scheme implementation.

## Task 1
1. `inherit-modules`: load a list of modules and export the public symbols
2. `texmacs-module`: define the name, the dependencies of a module
3. `define-public` and `define-public-macro`: the functions and macros that can be exported
