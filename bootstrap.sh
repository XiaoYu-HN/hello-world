useradd oracle
PUBKEYURL=http://192.0.0.192/latest/meta-data/public-keys/0/openssh-key
curl --silent -o ~oracle/.ssh/authorized_keys $PUBKEYURL
chown $(id -un oracle):$(id -gn oracle) ~oracle/.ssh/authorized_keys
chmod 700 ~oracle/.ssh
chmod 600 ~oracle/.ssh/authorized_keys
