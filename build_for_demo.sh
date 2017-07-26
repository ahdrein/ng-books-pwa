#!/bin/bash
PATH=$PATH:$(npm bin)
set -x

# Production build
ng build -bh "https://ahsanayaz.github.io/ng-books-pwa/" --prod

# generate new index.html using app shell

node_modules/.bin/ngu-app-shell --module src/app/app.module.ts \
    --out dist/index.html

# merge ngsw-manifest and copy to dist
./node_modules/.bin/ngu-sw-manifest --module src/app/app.module.ts \
                --out dist/ngsw-manifest.json
