s9splashgen ・ Splash screen generator
======================================

## Introduction

The Ruby script `s9splashgen` automatically generates splash screens of all necessary sizes for iPhone and/or iPad apps (iOS 7 and above). It uses `imagemagick` and the gem `rmagick`.

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

The first argument is the filename of the splash screen image (for best results use an image in portrait mode of size of at least 1536x2048 [1242x2208 iphone only]). By default only iPhone splash screens are generated. 
If one supplies a second argument (`ipad` or `universal`), iPad splash screens or iPhone/iPad splash screens are generated respectively.

## Example

The command

```bash
./s9splashgen.rb my_splash.png universal
```

will generate

```bash
  320x480(2x) ->   640x960: screens/Default@2x~iphone.png
  320x568(2x) ->  640x1136: screens/Default-568h@2x~iphone.png
  375x667(2x) ->  750x1334: screens/Default-667h@2x~iphone.png
  414x736(3x) -> 1242x2208: screens/Default-736h@3x~iphone.png
 768x1024(1x) ->  768x1024: screens/Default-Portrait~ipad.png
 1024x768(1x) ->  1024x768: screens/Default-Landscape~ipad.png
 768x1024(2x) -> 1536x2048: screens/Default-Portrait@2x~ipad.png
 1024x768(2x) -> 2048x1536: screens/Default-Landscape@2x~ipad.png
```


## Rubymotion

Add the splash screens to your resources folder. In order to use the splash screens with Rubymotion you have to add the following lines to your rakefile (universal app)

```ruby
app.info_plist['UILaunchImages'] = [
  # iphone
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
  # ipad
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
  }
]
```

Since RubyMotion 2.34 there is no need to add the lines above to your rakefile, if you only want iPhone and iPad (Portrait) launch images.
