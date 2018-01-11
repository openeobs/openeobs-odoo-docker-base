FROM debian:jessie
MAINTAINER Odoo S.A. <info@odoo.com>

# Install some deps, lessc and less-plugin-clean-css, and wkhtmltopdf
# SETTING LOCALE TO en_GB: In order to set up the en_GB locale we need to install locales package, add the en_GB definition to /etc/locales.gen and run locale-gen
RUN set -x; \
        apt-get update \
        && apt-get install -y --no-install-recommends \
            ca-certificates \
            curl \
            node-less \
            node-clean-css \
            python-gevent \
            python-pip \
            python-pyinotify \
            python-renderpm \
            virtualenv \
            python-support \
            libpq-dev \
            gcc \
            python-dev \
            libxml2-dev \
            libxslt1-dev \
            libldap2-dev \
            libsasl2-dev \
            libjpeg-dev \
            netcat \
            postgresql-client \
            locales \
        && sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen \
        && locale-gen \
        && curl -o wkhtmltox.deb -SL http://nightly.odoo.com/extra/wkhtmltox-0.12.1.2_linux-jessie-amd64.deb \
        && echo '40e8b906de658a2221b15e4e8cd82565a47d7ee8 wkhtmltox.deb' | sha1sum -c - \
        && dpkg --force-depends -i wkhtmltox.deb \
        && apt-get -y install -f --no-install-recommends \
        && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false npm \
        && rm -rf /var/lib/apt/lists/* wkhtmltox.deb \
        && pip install psycogreen==1.0

ENV LANG en_GB.UTF-8
ENV LANUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8
