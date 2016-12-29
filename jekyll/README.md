This is a Dockerfile for a jekyll/asciidoctor build environment. You can use it to build any of our jekyll documentation sites.

The normal way to use this is to mount the current directory as a volume in the docker container, and build from there. For example, from rvi_sota_server/docs, you can run `docker run -it -v $(pwd):/site advancedtelematic/jekyll-asciidoc` and it will build the site to a `_site` directory.

You can also run a mini server to view your changes, with `docker run -it -p 4000:4000 -v $(pwd):/site advancedtelematic/jekyll-asciidoc jekyll serve -H 0.0.0.0`; the site will be available at <http://localhost:4000/rvi_sota_server/>.
