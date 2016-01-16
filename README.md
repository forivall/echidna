Echidna
===

> A tool for forking packages from and into a mono-repo project.

## About

Automates the process of

    git remote add fork-origin git@github.com:octocat/monorepo
    git checkout fork-origin/master
    git subtree split -P packages/spoon-knife -b spoon-knife-master
    git checkout master
    git subtree add -P packages/spork spoon-knife-master

and the rest of the workflow, including merging and contributing upstream.

Also updates the package.json with
* sets `version` from the lerna `VERSION` file
* moves the previous author to `contributor`
* adds other contributors from the `git authors` contrib script's output
* sets `name`
* sets `repository`
