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

## Rubymotion

In order to use the splash screens with Rubymotion you have to edit your rakefile, i.e. for a universal app you add the following

```ruby
app.info_plist['UILaunchImages'] = [
 {
   'UILaunchImageName' => 'Default',
   'UILaunchImageOrientation' => 'Portrait',
   'UILaunchImageMinimumOSVersion' => '7.0',
   'UILaunchImageSize' => '{320, 480}'
 },
 {
   'UILaunchImageName' => 'Default-568h',
   'UILaunchImageOrientation' => 'Portrait',
   'UILaunchImageMinimumOSVersion' => '7.0',
   'UILaunchImageSize' => '{320, 568}'
 },
 {
   'UILaunchImageName' => 'Default-667h',
   'UILaunchImageOrientation' => 'Portrait',
   'UILaunchImageMinimumOSVersion' => '8.0',
   'UILaunchImageSize' => '{375, 667}'
 },
 {
   'UILaunchImageName' => 'Default-736h',
   'UILaunchImageOrientation' => 'Portrait',
   'UILaunchImageMinimumOSVersion' => '8.0',
   'UILaunchImageSize' => '{414, 736}'
 },
 {
   'UILaunchImageName' => 'Default-Portrait',
   'UILaunchImageOrientation' => 'Portrait',
   'UILaunchImageMinimumOSVersion' => '7.0',
   'UILaunchImageSize' => '{768, 1024}'
 },
 {
   'UILaunchImageName' => 'Default-Landscape',
   'UILaunchImageOrientation' => 'Landscape',
   'UILaunchImageMinimumOSVersion' => '7.0',
   'UILaunchImageSize' => '{768, 1024}'
 }]
```