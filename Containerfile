ARG FEDORA_MAJOR_VERSION=37

FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}

RUN rpm-ostree override remove firefox firefox-langpacks && \
    rpm-ostree install gnome-tweaks distrobox && \
    wget https://pkgs.tailscale.com/stable/fedora/tailscale.repo -P /etc/yum.repos.d/ && \
    sed -i 's/repo_gpgcheck=1/repo_gpgcheck=0/g' /etc/yum.repos.d/tailscale.repo && \
    rpm-ostree install tailscale && \
    systemctl enable tailscaled && \
    ostree container commit
