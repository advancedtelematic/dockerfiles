# Documentation-related toolset

This docker image contains everything you need to render asciidoc documents in a user-presentable format.

Included tools:

    asciidoctor
    asciidoctor-pdf
    asciidoctor-diagram
    pandoc
    blockdiag
    seqdiag

This image makes use of the themes and techniques in [ats-doc-builder](https://github.com/advancedtelematic/ats-doc-builder) to generate nice docs with ATS styling.

## Generate an ATS-styled PDF document from an Asciidoc source

    docker run --rm -it -v $(pwd):/site advancedtelematic/doctools -f pdf [file]

### Use a custom PDF theme

Mount your theme as a file inside `/themes` in the docker container, and use the `-s` option to select the theme:

    docker run --rm -it -v $(pwd):/site -v $(pwd)/mytheme.yml:/themes/mytheme.yml advancedtelematic/doctools -f pdf -s mytheme [file]

You'll probably want to use one of the existing themes in the [ats-doc-builder](https://github.com/advancedtelematic/ats-doc-builder/tree/master/pdf-themes) repo as a starting point. See the [asciidoctor-pdf documentation](https://github.com/asciidoctor/asciidoctor-pdf/blob/master/docs/theming-guide.adoc) for how to make/modify your theme.

## Make an MS Word file

    docker run --rm -it -v $(pwd):/site advancedtelematic/doctools -f docx [file]

## Access the tools manually

Override the entrypoint:

    docker run --rm -it -v $(pwd):/site --entrypoint [toolname] advancedtelematic/doctools [arguments]

If what you really need/want is to be able to play around a bit without having to start a docker container with each command, you can also override the entrypoint to `/bin/sh` and go from there.

## View the command help

    docker run --rm -it advancedtelematic/doctools -h


