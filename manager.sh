#!/bin/bash -eu
#
# Copyright 2018 The Outline Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

IFS="
"

declare -a FILES=(
  # macOS.
  Outline-Manager.dmg
  Outline-Manager.dmg.blockmap
  latest-mac.yml
  Outline-Manager.zip
  # Windows.
  Outline-Manager.exe
  Outline-Manager.exe.blockmap
  latest.yml
  # Linux.
  Outline-Manager.AppImage
  latest-linux.yml
)

function usage() {
  cat <<-EOM
Usage: $0 <tag>

Examples:
  $0 v1.1.8
EOM
exit 1
}

while getopts h? opt; do
  case $opt in
    *) usage ;;
  esac
done
shift $((OPTIND-1))

if (( $# != 1 )); then
  usage
fi

readonly TAG=$1
readonly RELEASE_BASE=https://github.com/Jigsaw-Code/outline-server/releases/download/$TAG

# Make sure we're on a clean and up to date master.
#
# Sample git status -sb -uno output (remove the leading "# "):
# ## my-feature-branch
# M manager/some-modified-file
# M manager/another-modified-file
if [[ $(git status -sb -uno | wc -l | tr -d ' ') != 1 ]]; then
  echo >&2 "Please stash changes before running this script."
  exit 1
fi
if ! git status -sb -uno | grep '^## master.*' > /dev/null; then
  echo >&2 "Please switch to the master branch."
  exit 1
fi

git pull -q

pushd manager >/dev/null
for file in ${FILES[@]}; do
  echo $file
  curl -sLO $RELEASE_BASE/$file
done

git checkout -b manager-$TAG
git commit -a -m "release server manager $TAG"
git branch

echo "All done!"
