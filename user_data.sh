#!/bin/bash

# Install Apache HTTP Server
sudo yum update -y
sudo yum install httpd -y

# Deploy web application
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Local IP Address</title>
</head>
<body>
  <h1>Local IP Address</h1>
  <p>The local IP address of this machine is: $(curl http://169.254.169.254/latest/meta-data/local-ipv4)</p>
</body>
</html>
EOF

# Start Apache service
sudo systemctl start httpd
sudo systemctl enable httpd
