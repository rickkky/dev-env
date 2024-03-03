FROM ubuntu:latest

# bakup api source
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    # use Tsinghua apt mirror
    && sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
    && sed -i 's/security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list

# no interactive when install packages
ENV DEBIAN_FRONTEND=noninteractive
# install basic deps
RUN apt-get update \
    && apt-get install -y zsh git vim sudo curl iputils-ping tzdata language-pack-zh-hans \
    # clean apt cache
    && rm -rf /var/lib/apt/lists/*

# set timezone
ENV TZ=Asia/Shanghai
RUN ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && dpkg-reconfigure --frontend noninteractive tzdata

# prepare user 'ricky'
RUN useradd -m -s /bin/zsh ricky \
    && passwd -d ricky \
    && echo '\nricky ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# change user
USER ricky
WORKDIR /home/ricky

# configure git
RUN git config --global user.name "rickkky" \
    && git config --global user.email "rickkky@foxmail.com" \
    && git config --global core.editor vim \
    && git config --global core.ignorecase false \
    && git config --global core.autocrlf input \
    && git config --global core.safecrlf true \
    && git config --global init.defaultBranch main \
    && git config --global core.pager "less -iRFX"

# prepare zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    # change theme
    && sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/g' ~/.zshrc \
    # enable display zh_CN chars
    && echo '\nexport LC_CTYPE="zh_CN.UTF-8"' >> ~/.zshrc \
    # install zsh-autosuggestion plugin
    && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    # change autosuggestion config
    && echo '\nZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080"' >> ~/.zshrc \
    # install zsh-syntax-highlighting plugin
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
    # set plugins
    && sed -i 's/plugins=(git)/plugins=(git ssh-agent zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc \
    # change default shell
    && chsh -s $(which zsh)

# use zsh
SHELL ["/bin/zsh", "-c"]

# install nvm and node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash \
    && source ~/.zshrc \
    && nvm install --lts \
    && nvm use --lts \
    && corepack enable \
    && pnpm setup

VOLUME [ "/home/ricky/codespace" ]
