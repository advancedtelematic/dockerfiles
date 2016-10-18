FROM ruby:2.2.5

ADD Gemfile /
RUN bundle install
RUN wget https://github.com/jgm/pandoc/releases/download/1.17.2/pandoc-1.17.2-1-amd64.deb && dpkg -i pandoc-1.17.2-1-amd64.deb && rm pandoc-1.17.2-1-amd64.deb

ADD ats-doc-builder/pdf-themes /themes/
ADD ats-doc-builder/docx-themes /themes/
ADD mkdocx /bin/
ADD mkpdf /bin/

VOLUME /site
WORKDIR /site
CMD ["jekyll", "b"]

