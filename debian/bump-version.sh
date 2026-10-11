#!/bin/sh
# Run this before committing. Bumps the version to match the commit
# count your commit is about to produce (current count + 1), so once
# committed, the version in these files is exactly correct.
# Usage: debian/bump-version.sh
set -eu

cd "$(dirname "$0")/.."

COUNT="$(($(git rev-list --count HEAD) + 1))"
VERSION="0.$COUNT"

sed -i "s/^version = .*/version = '$VERSION'/" setup.py
sed -i "1s/^ffmpeg-python (.*)/ffmpeg-python ($VERSION)/" debian/changelog

echo "Bumped to $VERSION"
