#!/bin/bash

# Install all compilers
InstallCompiler() {
           # Perform GUI-related tasks here
        echo "Installing other compilers..."
        sudo apt install -y build-essential      # build-essential
        sudo apt install -y gcc                  # gcc for C
        sudo apt install -y g++                  # g++ for C++
        sudo apt install -y make                 # make for C
        sudo apt install -y cmake                # cmake for C++
        sudo apt install -y autoconf             # autoconf for C
        sudo apt install -y automake             # automake for C
        sudo apt install -y libtool              # libtool for C
        sudo apt install -y pkg-config           # pkg-config for C
        sudo apt install -y nasm                 # nasm for C
        sudo apt install -y libpng-dev           # libpng-dev for C
        sudo apt install -y libjpeg-dev          # libjpeg-dev for C
        sudo apt install -y libtiff-dev          # libtiff-dev for C
        sudo apt install -y zlib1g-dev           # zlib1g-dev for C
        sudo apt install -y libicu-dev           # libicu-dev for C
        sudo apt install -y libpango1.0-dev      # libpango1.0-dev for C
        sudo apt install -y libcairo2-dev        # libcairo2-dev for C
        sudo apt install -y libglib2.0-dev       # libglib2.0-dev for C
        sudo apt install -y libgdk-pixbuf2.0-dev # libgdk-pixbuf2.0-dev for C
        sudo apt install -y libgtk2.0-dev        # libgtk2.0-dev for C
        sudo apt install -y libatk1.0-dev        # libatk1.0-dev for C
        sudo apt install -y libghc-x11-dev       # libghc-x11-dev for C
        sudo apt install -y libxtst-dev          # libxtst-dev for C
        sudo apt install -y libxss-dev           # libxss-dev for C
        sudo apt install -y libasound2-dev       # libasound2-dev for C
        sudo apt install -y libnss3-dev          # libnss3-dev for C
        sudo apt install -y libgconf-2-4         # libgconf-2-4 for C
        sudo apt install -y libgbm-dev           # libgbm-dev for C
        sudo apt install -y libgtk-3-dev         # libgtk-3-dev for C

        # install Java 11
        sudo apt install openjdk-11-jre-headless -y    # openjdk-11-jre-headless for Java
        sudo apt install -y openjdk-11-jdk-headless -y # openjdk-11-jdk-headless for Java
        sudo apt install -y openjdk-11-jre -y          # openjdk-11-jre for Java

        # Fotran
        sudo apt install -y gfortran -y # gfortran for Fortran

        # Haskell
        sudo apt install -y haskell-platform -y # haskell-platform for Haskell

        # Rust
        sudo apt install rustc -y # rustc for Rust

        # Go
        sudo apt install golang-go -y # golang-go for Go

        # Ruby
        sudo apt install ruby-full -y # ruby-full for Rubyv

        # TypeScript
        sudo npm install -g typescript@latest # typescript@latest for TypeScript

        # Swift
        sudo apt install swift -y # swift for Swift

        # Lua
        sudo apt install lua5.3 -y # lua5.3 for Lua

        # Erlang
        sudo apt install erlang -y # erlang for Erlang

        # C#
        sudo apt install mono-complete -y # mono-complete for C#
        sudo apt install mono-runtime -y  # mono-runtime for C#

        # R
        sudo apt install r-base -y # r-base for R

        # Dart
        sudo apt-get update                                                                                                                                                                              # update apt
        sudo apt-get install apt-transport-https                                                                                                                                                         # apt-transport-https
        wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg                                                                             # add key for dart
        echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list # add repo for dart
        sudo apt-get update                                                                                                                                                                              # update apt again
        sudo apt-get install dart -y                                                                                                                                                                     # install dart

}