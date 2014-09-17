s9splashgen ・ Splash screen generator
======================================

## Introduction

The Ruby script `s9splashgen` automatically generates splash screens for iPhone and/or iPad apps (iOS 7 and above). It uses `imagemagick` and the gem `rmagick`.

## Installation

Install `imagemagick` and `rmagick` via

```bash
brew install imagemagick
gem install rmagick
```

## Usage

Just run the script 

```bash
./s9splashgen.rb my_splash.png
```

The first argument is the filename of the splash screen file. By default only iPhone splash screens are generated. 
If one supplies a second argument (`ipad` or `universal`), iPad splash screens or iPhone/iPad splash screens are generated respectively.