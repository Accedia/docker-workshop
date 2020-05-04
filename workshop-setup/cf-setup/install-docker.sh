#!/bin/bash -xe

# add auto confirm here
yes | sudo amazon-linux-extras install docker
sudo usermod -a -G docker ec2-user

sudo cat > ~/override.conf <<EOF
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375
EOF

sudo mkdir -p /etc/systemd/system/docker.service.d/
sudo mv ~/override.conf /etc/systemd/system/docker.service.d/override.conf

sudo systemctl daemon-reload
sudo service docker restart
