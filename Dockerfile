FROM ubuntu:latest

# install basic deps
RUN apt-get update \
    && apt-get install -y zsh git vim sudo curl

# prepare user 'ricky'
RUN useradd -m -s /bin/zsh ricky \
    && passwd -d ricky \
    && echo '\nricky ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# change user
USER ricky
WORKDIR /home/ricky

# prepare zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/g' ~/.zshrc \
    && chsh -s $(which zsh)

# use zsh
SHELL ["/bin/zsh", "-c"]

# configure git
RUN git config --global user.name "rickkky" \
    && git config --global user.email "rickkky@foxmail.com" \
    && git config --global core.editor vim \
    && git config --global core.ignorecase false

# install nvm and node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash \
    && source ~/.zshrc \
    && nvm install --lts \
    && nvm use --lts \
    && corepack enable




