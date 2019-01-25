#!/bin/sh

maxwidth=1280
maxheight=720
filters="fps=15,scale='iw*min(1,min($maxwidth/iw,$maxheight/ih))':-1:flags=lanczos"

tmpdir=$(mktemp -d /tmp/"${0##*/}".XXXXXX)
status=0

PATH=$PATH:/usr/local/bin:/opt/local/bin

for mov; do
    basename="$(basename "$mov")"
    gif="$(dirname "$mov")/${basename%.*}.gif"

    {
        set -e

        palette="$tmpdir/palette.png"

        ffmpeg -v warning -i "$mov" -vf "$filters,palettegen=stats_mode=diff" -y "$palette"
        ffmpeg -i "$mov" -i "$palette" -lavfi "$filters,paletteuse=dither=bayer:bayer_scale=5:diff_mode=rectangle" -y "$gif"
    } >&2 || status=$?
    if [ -f "$gif" ]; then
        printf '%s\n' "$gif"
    fi
done

rm -rf "$tmpdir"
exit $status
