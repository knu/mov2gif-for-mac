MOV2GIF.app for macOS
=====================

MOV2GIF.app is a tiny application for macOS that converts movies to
optimized GIFs using the method described in the following article,
written by Cassidy K:

	https://cassidy.codes/blog/2017/04/25/ffmpeg-frames-to-gif-optimization/

The scaling option is hardcoded to fit movies to 1280x720 without
upscaling.

The included shell script `mov2gif.sh` can be run on any Unix like
platforms where ffmpeg is available.

## Requirements

This package depends on ffmpeg(1), which can be installed via Homebrew
or MacPorts:

```console
% brew install ffmpeg
```

```console
% port install ffmpeg
```

## Installation

```console
% make install
```

## Usage

1. Directly open the application and select a movie file.

2. Drag and drop movie files to the application.

3. Open a context menu on a movie file and select MOV2GIF from the
   `Open With` menu.

## Author

Copyright (c) 2019 Akinori MUSHA.

Licensed under the 2-clause BSD license.  See `LICENSE.txt` for
details.

Visit [GitHub Repository](https://github.com/knu/mov2gif-for-mac) for
the latest information.
