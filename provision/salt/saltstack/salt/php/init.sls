{% if grains['os'] == 'RedHat' or grains['os'] == 'CentOS' or grains['os'] == 'CloudLinux' %}
install-remi-repo:
  pkgrepo.managed:
    - name: remi-php72
    - humanname: Remi's PHP 7.2 RPM repository for Enterprise Linux 7
    - baseurl: http://rpms.remirepo.net/enterprise/$releasever/php72/$basearch/
    - file: /etc/yum.repos.d/remirepo.repo
    - gpgcheck: 0

install-remi-safe-repo:
  pkgrepo.managed:
    - name: remi-safe
    - humanname: Safe Remi's RPM repository for Enterprise Linux 7
    - baseurl: http://rpms.remirepo.net/enterprise/7/safe/$basearch/
    - file: /etc/yum.repos.d/remisafe.repo
    - gpgcheck: 0

install-php:
  pkg.installed:
    - pkgs:
      - php
      - php-cli
      - php-fpm
      - php-mysqlnd
      - php-devel
      - php-mcrypt
      - php-curl
      - php-xml
      - php-pear
      - php-bcmath
      - php-json
      - php-mcrypt
      - php-pear
      - php-zip
      - php-mbstring
      - php-gd
      - php-xdebug

{% elif grains['os'] == 'Ubuntu' or grains['os'] == 'Debian' %}
depending_packages:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - lsb-release
      - ca-certificates

download_key_and_install_repo:
   cmd.run:
     - name: sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list;apt-get update

install_php7:
  pkg.installed:
    - pkgs:
      - php7.2
      - php7.2-cli
      - php7.2-fpm
      - php7.2-mysqlnd
      - php7.2-zip
     #- php7.2-devel
      - php7.2-gd
      #- php7.2-mcrypt
      - php7.2-mbstring
      - php7.2-curl
      - php7.2-xml
      #- php7.2-pear
      - php7.2-bcmath
      - php7.2-json
      #- php7.2-apache
      - php7.2-xdebug
{% endif %}
