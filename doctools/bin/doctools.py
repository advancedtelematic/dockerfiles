#! /usr/bin/env python

from argparse import ArgumentParser
from subprocess import Popen
from os.path import exists, join, basename, splitext
import random
import sys

class AsciidoctorCommand(object):
    def __init__(self, args):
        self.format = args.format
        self.inputfile = args.inputfile
        if args.pdfstyle:
            self.pdfstyle = args.pdfstyle
        if args.outputfile:
            self.outputfile = args.outputfile
        elif args.format == 'adoc':
            self.outputfile = splitext(args.inputfile)[0] + "-coalesced.adoc"
        else:
            self.outputfile = splitext(args.inputfile)[0] + "." + args.format


    def command_line(self):
        if self.format == 'pdf':
            cmdline = [
                "asciidoctor-pdf",
                "-a", "pdf-style=" + self.pdfstyle + ".yml", 
                "-a", "pdf-fontsdir=/themes",
                "-a", "pdf-stylesdir=/themes",
                "-o", self.outputfile
                ]
        elif self.format == 'html':
            cmdline = [
                "asciidoctor",
                "-o", self.outputfile
                ]
        elif self.format == 'adoc':
            cmdline = [
            "asciidoc-coalescer.rb",
            "-o", self.outputfile
            ]
        elif self.format == 'docx':
            cmdline = [
            "asciidoctor",
            "-b", "docbook",
            "-o", "-"
            ]
        
        cmdline.append(self.inputfile)

        if self.format == 'docx':
            cmdline.extend([
                "|", "pandoc",
                "-f", "docbook",
                "-t", "docx",
                "--reference-docx=/themes/ats-reference.docx",
                "-o", self.outputfile])

        return cmdline


def main():
    parser = ArgumentParser(description='Generate a rendered document from one or more asciidoc sources')
    parser.add_argument('inputfile')
    parser.add_argument('-o', '--outputfile', help='File to output. Defaults to same name as input file, with the new extension.')
    parser.add_argument('-f', '--format', default='pdf', help='Type of doc to generate: html|pdf|docx|adoc. \n\'adoc\' output will resolve all conditionals and includes, yielding a new coalesced asciidoc file.')
    parser.add_argument('-s', '--pdfstyle', default='ats-whitepaper', help='PDF stylesheet to apply: ats-whitepaper|ats-rfq')
    parser.add_argument('-n', '--dry-run', help='Print asciidoctor command line rather then run it', action='store_true')

    args = parser.parse_args()

    try:
        asciidoctor_command = AsciidoctorCommand(args)
    except ValueError, e:
        print(e.message)
        sys.exit(1)


    cmdline = asciidoctor_command.command_line()
    if args.dry_run:
        print(" ".join(cmdline))
    else:
        s = Popen(" ".join(cmdline), shell=True) # shell=True b/c docx output requires piping
        try:
            s.wait()
        except KeyboardInterrupt:
            pass


if __name__ == '__main__':
    main()
