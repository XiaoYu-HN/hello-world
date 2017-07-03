useradd oracle
mkdir -m 700 ~oracle/.ssh
# get public key from instance metadata and store it in authorized_keys file
PUBKEYURL=http://192.0.0.192/latest/meta-data/public-keys/0/openssh-key
curl --silent -o ~oracle/.ssh/authorized_keys $PUBKEYURL
chown -R $(id -un oracle):$(id -gn oracle) ~oracle/.ssh
# directory & file permission is strictly set, otherwise SSH is not allowed
chmod 600 ~oracle/.ssh/authorized_keys
# allow user sudo access
usermod -G ADMINS oracle
