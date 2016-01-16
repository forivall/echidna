Echidna
===

> A tool for forking packages from and into a mono-repo project.

## About

Automates the process of

    git remote add fork-origin git@github.com:octocat/monorepo && git config  git fetch --no-tags fork-origin
    git subtree split -P packages/spoon-knife -b spoon-knife-master fork-origin/master
    git subtree add -P packages/spork spoon-knife-master

and the rest of the workflow, including merging and contributing upstream.

Also stores its git branches in modules in the .git dir, instead of requiring you to
add them directly as remotes. This is what git submodules do. Then the equivalent is

    git submodule add --name monorepo git@github.com:octocat/monorepo subtree-workdir/monorepo
    git reset .gitmodules subtree-workdir/monorepo && git checkout .gitmodules
    (cd subtree-workdir/monorepo; git subtree split -P packages/spoon-knife subtree/spoon-knife/master)
    git fetch $(git rev-parse --show-toplevel)/.git/modules/monorepo subtree/spoon-knife/master && git subtree add -P packages/spork FETCH_HEAD

or, if monorepo is already checked out somewhere

    (cd ../monorepo && git subtree split -P packages/spoon-knife subtree/spoon-knife/master)
    git fetch ../monorepo subtree/spoon-knife/master && git subtree add -P packages/spork FETCH_HEAD

Also updates the package.json with
* sets `version` from the lerna `VERSION` file
* moves the previous author to `contributor`
* adds other contributors from the `git authors` contrib script's output
* sets `name`
* sets `repository`
