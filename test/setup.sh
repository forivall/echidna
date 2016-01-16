#!/usr/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

rm -rf upstream repo

mkdir -p upstream/packages/spoon
(cd upstream
  git init
  git remote add origin git@github.com:forivall-old-repos/echidna-test-upstream.git
  echo 1.0.0 > VERSION
)
(cd upstream/packages/spoon
  > package.json tee <<EOF
{
  "name": "spoon",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "Alice Smith <alice@example.org>",
  "license": "ISC"
}
EOF
)


mkdir -p repo
(cd repo
  git init
  git remote add origin git@github.com:forivall-old-repos/echidna-test-repo.git
  echo 0.1.0 > VERSION
  > .echidna tee <<EOF
{
  "author": "Bob Smythe <bob@example.org>"
}
EOF
)
