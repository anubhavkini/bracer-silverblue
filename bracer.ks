# version=F38

# Use graphical install
graphical

# System timezone and timesource
timezone Asia/Kolkata --utc
timesource --ntp-pool=2.fedora.pool.ntp.org --nts

# System language and keyboard layouts
lang en_IN.UTF-8
keyboard --vckeymap=us --xlayouts='us'

# Disk partitioning and bootloader
ignoredisk --only-use=nvme0n1
clearpart --all --drives=nvme0n1 --initlabel --disklabel=gpt
autopart
bootloader --location=mbr --boot-drive=nvme0n1

# OSTree setup
ostreesetup --osname="fedora" --remote="fedora" --url="file:///ostree/repo" --ref="fedora/38/x86_64/silverblue" --nogpg

# Firewall configuration
firewall --use-system-defaults

# Root account
rootpw --lock

# User account
user --name=anubhav --password=changeme --plaintext --gecos="Anubhav Kini" --groups=wheel

# Run the Setup Agent on first boot
firstboot --enable

# Reboot after install
reboot --eject

%post --erroronfail
cp /etc/skel/.bash* /root
%end
