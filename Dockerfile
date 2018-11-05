FROM ubuntu:16.04

WORKDIR /gradient/

RUN apt-get update
RUN apt-get install -y make gcc g++ ruby ruby-dev nodejs
RUN apt-get install libffi-dev

COPY Gemfile /gradient/Gemfile
COPY Gemfile.lock /gradient/Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY _i18n /gradient/_i18n/
COPY _includes /gradient/_includes/
COPY _layouts /gradient/_layouts/
COPY _sass /gradient/_sass/
COPY assets /gradient/assets/
COPY css /gradient/css/
COPY deploy /gradient/deploy/
COPY pliki /gradient/pliki/
COPY _config.yml /gradient/_config.yml
COPY archiwum.md /gradient/archiwum.md
COPY baza-wiedzy.md /gradient/baza-wiedzy.md
COPY index.html /gradient/index.html
COPY o-nas.md /gradient/o-nas.md
COPY portfolio.html /gradient/portfolio.html
COPY spotkania.md /gradient/spotkania.md
COPY statut.md /gradient/statut.md
COPY projekty.html /gradient/projekty.html

CMD jekyll serve --host 0.0.0.0
