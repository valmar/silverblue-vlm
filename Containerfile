FROM quay.io/fedora-ostree-desktops/silverblue:39

RUN cd /etc/yum.repos.d/ && \
    curl -LO https://pkgs.tailscale.com/stable/fedora/tailscale.repo && \
    rpm-ostree override remove power-profiles-daemon \
                               firefox \
                               firefox-langpacks && \
    rpm-ostree install adw-gtk3-theme \
                       diffstat \
                       doxygen \
                       gnome-tweaks \
                       libappindicator-gtk3 \
                       openssl1.1 \
                       patch \
                       patchutils \
                       subversion \
                       systemtap \
                       tailscale \
                       tuned \
                       tuned-profiles-atomic \
                       tuned-utils \
                       webkit2gtk4.0 && \
    systemctl enable tailscaled && \
    systemctl enable tuned && \
    systemctl enable rpm-ostreed-automatic.timer && \
    ostree container commit
