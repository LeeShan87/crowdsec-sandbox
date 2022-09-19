{% if grains['os'] == 'RedHat' or grains['os'] == 'CentOS' or grains['os'] == 'CloudLinux' %}
install-mysql-repo:
  pkgrepo.managed:
    - name: mysql
    - humanname: mysql community repo
    - baseurl: http://repo.mysql.com/yum/mysql-5.5-community/el/$releasever/$basearch/
    - file: /etc/yum.repos.d/mysql.repo
    - gpgcheck: 0
      # http://repo.mysql.com/yum/mysql-5.5-community/el/6/x86_64/

{% endif %}
install-mysql-server:
    pkg.installed:
      - pkgs:
        - mysql-server

enable-mysql:
  service.running:
    - name: mysqld
    - enable: True