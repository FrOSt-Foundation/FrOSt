#!/bin/sh

java -jar DCPU-Toolchain.jar assemble ../FrOSt/FrOSt_header.dasm FrOSt_header.bin
java -jar DCPU-Toolchain.jar run ../FrOSt/FrOSt.dasm --assemble --bootloader=FrOSt_header.bin --lem1802 --keyboard --clock --edc --debugger
