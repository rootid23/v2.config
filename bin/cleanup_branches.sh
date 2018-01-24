#!/bin/sh

#git branch --merged origin2/develop
#git branch --remote

git_remote_delete() {
  git push origin :$1
}

git_local_and_remote_delete() {
  git branch -D $1 && git push origin :$1
}

git branch -D $1 && git push origin :$1
