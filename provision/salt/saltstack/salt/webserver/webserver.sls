link_www:
  cmd.run:
    - name: 'ln -s /vagrant/www /var/www'

install_webserver_packages:
  pkg.installed:
    - pkgs:
      {% if grains['os'] == 'RedHat' or grains['os'] == 'CentOS' or grains['os'] == 'CloudLinux' %}
      - openssl
      - httpd
      - mod_ssl
      {% elif grains['os'] == 'Ubuntu' or grains['os'] == 'Debian' %}
      - apache2
     {% endif %}