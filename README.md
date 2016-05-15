# FrOSt

FrOSt is a free operating system under the free license GNU GPL, made by a tiny group of french people.  We worked hard on it, and are proud to release it.

We would be very pleased to know how you use or modify it, and we would be very grateful to you if you informed your users what your operating system is based on. :) You can also thank us for our job by sending us bugreports, fixes, enhancements, t-shirts, money, beer & pizza on our [forum](http://frost-0x10c.tk/Forum/index.php).


## What is FrOSt?

FrOSt is a community French project which goal is to create a free and Open-Source OS for ~~0x10^c~~ [techcompliant](https://reddit.com/r/techcompliant).


## How to run FrOSt?

### Easy way

Run buildAndRun.sh (linux) or buildAndRun.bat (windows) in tools/

### Hard way

You have to assemble the FrOSt/FrOSt.dasm file. You can find a toolchain for that effect [here](https://github.com/azertyfun/DCPU-Toolchain).


## How can I develop a program for that OS?

The wiki contains all the information you need.


## How to contribute

### Development environment

We use git as a CVS (obviously).

We used to use DevCPU, and it should still work, but for now we use [DCPU-Toolchain](https://github.com/azertyfun/DCPU-Toolchain).
You just have to `git clone` the repo somewhere and assemble FrOSt/FrOSt.dasm.


### Syntax guidelines

#### General rules

* git handles EOL character(s) (LF/CRLF), so no problem with that.
* __Document__ your code ! It will be easier to maintain and understand later.
* Write simple and clear commit messages : One change per commit. For instance, 'Misc driver changes' can surely be split in multiple commits.
* Don't be afraid to use `git branch` for any change of more than one commit (cf. precedent rule).
* Don't be afraid to read and check other people's commits. The code will only be better!


#### Norms

* All rules **must be respected** an can be found on the [wiki](https://github.com/FrOSt-Foundation/FrOSt/wiki/Coding-rules).

### Available branches :

* `master` : It's the main branch and is only modified for project releases.
* `indev` : It's the development branch and must be modified only by people who know it.  /!\ May not work, and will be more or less buggy anyways.
* Other temporary branches may appear (cf. general rules).

## Useful links

* [Latest hardware specifications](https://github.com/techcompliant/TC-Specs)
* [Old DCPU specifications](https://web.archive.org/web/20130817110245/http://dcpu.com)
