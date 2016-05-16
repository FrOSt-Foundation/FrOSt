#!/bin/sh

java -jar DCPU-Toolchain.jar assemble ../FrOSt/FrOSt_header.dasm FrOSt_header.bin
java -jar DCPU-Toolchain.jar assemble ../FrOSt/FrOSt.dasm FrOst.boot --bootloader=FrOSt_header.bin
