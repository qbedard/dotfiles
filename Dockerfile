FROM alpine:edge

# OS packages
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" \
        >> /etc/apk/repositories
RUN apk --update-cache upgrade && \
    apk add \
        # keeps fish/py3-pip completions from halting build
        --force-overwrite \ 
        bash \
        bat \
        cargo \
        # cargo-zsh-completion \
        cmake \
        # TODO: Replace with universal when available.
        ctags \
        curl \
        direnv \
        # TODO: Fix timezone issues.
        exa \
        fasd \
        fd \
        fish \
        # TODO: Get fzf working properly.
        fzf \
        # fzf-zsh-completion \
        git \
        # git-zsh-completion \
        hub \
        # lazydocker \
        make \
        musl-dev \
        neovim \
        neovim-doc \
        oh-my-zsh \
        openssh \
        py3-pip \
        python3 \
        python3-dev \
        ripgrep \
        shellcheck \
        stow \
        rust \
        tmux \
        # tmux-zsh-completion \
        # tokei \
        yarn \
        zsh \
        zsh-vcs

# Rust
# Dear god, this takes forever.
# RUN cargo install tokei

# Python
# TODO: Set up python envs for neovim.
RUN pip3 install --upgrade \
        setuptools pip wheel && \
    pip3 install \
        black \
        flake8 \
        ipython \
        isort \
        neovim \
        pipenv \
        vim-vint

# Misc
RUN ln -s "/usr/share/oh-my-zsh" "$HOME/.oh-my-zsh"
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Config
COPY . /root/.dotfiles/
RUN cd /root/.dotfiles && make stow

# Vim
RUN nvim --headless +PlugInstall +qall

WORKDIR /root
ENV SHELL "/bin/fish"
CMD "/bin/fish"
