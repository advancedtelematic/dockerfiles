# Documentation-related toolset

This docker image contains everything you need to do stuff with docs.

Included tools:

    asciidoctor
    asciidoctor-pdf
    asciidoctor-diagram
    jekyll-asciidoc
    pandoc
    blockdiag
    seqdiag

## Generate an ATS-styled Word or PDF document from an Asciidoc source

This image makes use of the themes and techniques in ats-doc-builder(https://github.com/advancedtelematic/ats-doc-builder) to generate nice docs with ATS styling.

To make an MS Word file, do this:

    docker run --rm -it -v $(pwd):/site advancedtelematic/doctools -f docx [file]

To make a PDF, do this:

    docker run --rm -it -v $(pwd):/site advancedtelematic/doctools -f pdf [file]

You can also override the entrypoint to access the tools manually:

    docker run --rm -it -v $(pwd):/site --entrypoint [toolname] advancedtelematic/doctools [arguments]

And you can get help on the launcher script with:

    docker run --rm -it advancedtelematic/doctools -h
