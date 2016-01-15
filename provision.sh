# Dependencies
sudo apt-get update -y
sudo apt-get install -y apache2
sudo apt-get install -y libapache2-mod-shib2
sudo apt-get install -y libapache2-mod-php5
sudo apt-get install -y php5-cli

# HTTPs setup
sudo mkdir /etc/apache2/ssl
sudo cp /vagrant/provision/apache.* /etc/apache2/ssl
sudo cp /vagrant/provision/httpd.conf /etc/apache2

# Shibboleth setup
sudo cp /vagrant/provision/shib_demo/metadata-federation-renater.crt /etc/shibboleth
sudo cp /vagrant/provision/shib_demo/conf_sp2/shibenv.php /etc/shibboleth
sudo cp /vagrant/provision/shib_demo/conf_sp2/attribute-map.xml /etc/shibboleth
sudo cp /vagrant/provision/shib_demo/conf_sp2/attribute-policy.xml /etc/shibboleth
sudo cp /vagrant/provision/shibboleth2.xml /etc/shibboleth
sudo chmod 755 /etc/shibboleth/shibenv.php
sudo shib-keygen # Generate sp-key and sp-cert.pem

# Hosts
sudo cp /vagrant/provision/hosts /etc

# Enable modules
sudo a2enmod ssl
sudo a2enmod shib2

# Restart all
sudo service shibd restart
sudo service apache2 restart
