FROM alpine:edge

# OS packages
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" \
        >> /etc/apk/repositories
RUN apk --update-cache upgrade

# build needs for from-source stuff
RUN apk add \
        # keeps py3-pip completions from halting build
        --force-overwrite \
        autoconf \
        automake \
        bash \
        cargo \
        cmake \
        coreutils \
        curl \
        fish \
        g++ \
        git \
        go \
        libtool \
        libuv \
        linux-headers \
        lua5.3-dev \
        m4 \
        make \
        musl-dev \
        openssh \
        py3-pip \
        python3 \
        python3-dev \
        rust \
        tar \
        unzip \
        xz

# Rust
# Dear god, this takes forever.

# Source
# RUN git clone https://github.com/x-motemen/ghq ~/ghq/github.com/x-motemen/ghq
# RUN cd ~/ghq/github.com/x-motemen/ghq && make install

RUN git clone https://github.com/neovim/libtermkey.git && \
  cd libtermkey && \
  make && \
  make install && \
  cd ../ && rm -rf libtermkey

RUN git clone https://github.com/neovim/libvterm.git && \
  cd libvterm && \
  make && \
  make install && \
  cd ../ && rm -rf libvterm

RUN git clone https://github.com/neovim/unibilium.git && \
  cd unibilium && \
  make && \
  make install && \
  cd ../ && rm -rf unibilium

RUN  git clone https://github.com/neovim/neovim.git && \
  cd neovim && \
  make && \
  make install && \
  cd ../ && rm -rf nvim

# Binary
RUN curl -fsSL https://starship.rs/install.sh | bash -s -- -y
RUN curl --proto '=https' --tlsv1.2 -sSf \
        https://raw.githubusercontent.com/ajeetdsouza/zoxide/master/install.sh | sh

# Other
RUN fish -c 'curl -L https://get.oh-my.fish | source - --noninteractive'

# user stuff
RUN apk add \
        bash \
        bat \
        curl \
        # diff-so-fancy \  # not yet
        direnv \
        # TODO: Fix timezone issues.
        exa \
        fasd \
        fd \
        fish \
        # TODO: Get fzf working properly.
        fzf \
        # ghq \  # not yet
        # github-cli \
        # needed to compile ghq
        hub \
        jq \
        # lazydocker \  # not yet
        # neovim \  # no nightly
        neovim-doc \
        poetry \
        py3-pip \
        python3 \
        python3-dev \
        ripgrep \
        shellcheck \
        # starship \  # not yet
        stow \
        tokei
        # zoxide  # not yet

# Misc
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Config
COPY . /root/.dotfiles/
RUN cd /root/.dotfiles && ./install

# Vim
RUN nvim --headless +PlugInstall +qall

WORKDIR /root
ENV SHELL "/usr/bin/fish"

# RUN adduser -S tim -u 1000 -G users

CMD "/usr/bin/fish"
