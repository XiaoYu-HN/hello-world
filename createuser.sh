useradd oracle
# get public key from instance metadata and stored in authorized_keys file
PUBKEYURL=http://192.0.0.192/latest/meta-data/public-keys/0/openssh-key
curl --silent -o ~oracle/.ssh/authorized_keys $PUBKEYURL
chown $(id -un oracle):$(id -gn oracle) ~oracle/.ssh/authorized_keys
# directory & file permission is strictly set, otherwise SSH is not allowed
chmod 700 ~oracle/.ssh
chmod 600 ~oracle/.ssh/authorized_keys
# allow user sudo access
usermod -G ADMINS oracle
