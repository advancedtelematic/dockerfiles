This is a Dockerfile for a jekyll/asciidoctor build environment. Here are some things you might want to do with it:

### Build the doc site for SOTA, or any other jekyll site

The normal way to use this is to mount the current directory as a volume in the docker container, and build from there. For example, from rvi_sota_server/docs, you can run `docker run -it -v $(pwd):/site advancedtelematic/jekyll-asciidoc` and it will build the site to a `_site` directory.

You can also run a mini server to view your changes, with `docker run -it -p 4000:4000 -v $(pwd):/site advancedtelematic/jekyll-asciidoc jekyll serve`; the site will be available at <http://localhost:4000/rvi_sota_server/>.

### Generate an ATS-styled Word or PDF document from an Asciidoc source

This image makes use of the themes and techniques in ats-doc-builder(https://github.com/advancedtelematic/ats-doc-builder) to generate nice docs with ATS styling. 

To make an MS Word file, do this:

    docker run -it -v $(PWD):/site advancedtelematic/jekyll-asciidoc mkdocx [file]

This can take quite a long time (30-60 seconds) if the document has data-uri encoded SVG images. However, the best/most bug-free results tend to be acheived if you do use data-uri encoding.

To make a PDF, do this:

    docker run -it -v $(PWD):/site advancedtelematic/jekyll-asciidoc mkpdf [file]