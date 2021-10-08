# AtCoder 各言語セットアップ

- Dockerfile作成のためのメモ
- [AtCoder 2019/7 Language Update - Google ドライブ](https://docs.google.com/spreadsheets/d/1PmsqufkF3wjKN6g1L0STS80yP4a6u-VdGiEv5uOHe0M/htmlview)+α参照
- 表示バージョンは[ABC221時点](https://atcoder.jp/contests/abc221/rules)
- 最新版ではなく、AtCoder現在の版に固定する
- OSはUbuntu 18.04LTS
- shellはBash

## 必要

```bash
apt-get update
eval "echo 'APT::Install-'"{Recommend,Suggest}"'s "0";';" \
     > /etc/apt/apt.conf.d/01norecommend
apt-get install -y \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        gcc \
        gnupg \
        git \
        software-properties-common \
        unzip \
        xz-utils \
        zip
```

## Ada2012

- (GNAT 9.2.1)

```bash
apt-add-repository ppa:ubuntu-toolchain-r/test -y
apt-get install gnat-9 -y
```

## Awk

- (GNU Awk 4.1.4)

```bash
apt-get install gawk -y
```

## Bash

- (5.0.11)

```bash
curl -sSL http://ftpmirror.gnu.org/bash/bash-5.0.tar.gz -o bash.tar.gz
tar xf bash.tar.gz
cd bash-5.0
./configure
make
sudo make install
```

## bc

- (1.07.1)

```bash
apt-get install bc -y
```

## Brainfuck

- (bf 20041219)

```bash
apt-get install bf -y
```

## C, C++

- (Clang 10.0.0)

```bash
apt-add-repository ppa:ubuntu-toolchain-r/test -y
apt-get update
apt-get install clang-10 -y
```

- (GCC 9.2.1)

```bash
apt-add-repository ppa:ubuntu-toolchain-r/test -y
apt-get update
apt-get install gcc-9 -y
```

## Clojure

- (1.10.1.536)

```bash
curl -sSL https://download.clojure.org/install/linux-install-1.10.1.536.sh -o clj.sh
chmod +x clj.sh
bash clj.sh
```

## C&#35;

- (Mono-csc 3.5.0)

```bash
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
            --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" \
>> /etc/apt/sources.list.d/mono-official-stable.list
apt-get update
apt-get install mono-devel -y
```

- (Mono-mcs 6.8.0.105)

```bash
apt-get install mono-mcs -y
```

- (.NET Core 3.1.201)

```bash
curl -sSLO https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
apt-get install ./packages-microsoft-prod.deb -y
apt-get update
apt-get install dotnet-sdk-3.1 -y
```

## COBOL - Fixed , COBOL - Free

- (OpenCOBOL 1.1.0)

```bash
apt-get install open-cobol -y
```

## Common Lisp

- (SBCL 2.0.3)

```bash
apt-get install sbcl -y
curl -sSL https://sourceforge.net/projects/sbcl/files/sbcl/2.0.3/sbcl-2.0.3-source.tar.bz2/download -o sbcl.tar.bz2
tar xf sbcl.tar.bz2
cd sbcl-2.0.3
GNUMAKE=make sh make.sh
sh install.sh
apt-get --purge remove sbcl -y
```

## Crystal

- (0.33.0)

```bash
wget -O- https://dist.crystal-lang.org/apt/setup.sh | bash
apt-get install crystal -y
```

## Dart

- (2.7.2)

```bash
curl -sSL https://storage.googleapis.com/dart-archive/channels/stable/release/2.7.2/linux_packages/dart_2.7.2-1_amd64.deb -o dart.deb
apt-get install ./dart.deb -y
```

## Dash

- (0.5.8)
- pre-installed

## dc

- (1.4.1)

```bash
apt-get install dc -y
```

## D

- (DMD 2.091.0)

```bash
curl -sSL http://downloads.dlang.org/releases/2.x/2.091.0/dmd_2.091.0-0_amd64.deb -o dmd.deb
apt-get install ./dmd.deb -y
echo '{"name":"a","targetType":"none","dependencies":{"mir":"~>3.2.0"}}' > dub.json
dub build --cache=system
echo 'export INCLUDES="$(dub list|rev|sed "1,2d;\$d;s/ .*/I-/;s/^/ecruos/"|rev|xargs)"' >> ~/.bashrc
. ~/.bashrc
```

- (GDC 9.2.1)

```bash
apt-add-repository ppa:ubuntu-toolchain-r/test -y
apt-get update
apt-get install gdc-9 -y
```

- (LDC 1.20.1)

```bash
curl -sSL https://dlang.org/install.sh | bash -s ldc-1.20.1
```

## Erlang, Elixir

- (Elixir 22.3)
- (Erlang 1.10.2)

```bash
curl -sSL https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb -o erlang.deb
apt-get install erlang.deb -y
apt-get update
apt-get install esl-erlang -y
apt-get install elixir -y
```

## F&#35;

- (Mono 10.2.3)

```bash
# Mono導入後
apt-get install fsharp -y
```

- (.NET Core 3.1.201)

`C#`の項参照

## Forth

- (gforth 0.7.3)

```bash
apt-get install gforth -y
```

## Fortran

- (GNU Fortran 9.2.1)

```bash
add-apt-repository ppa:ubuntu-toolchain-r/test -y
apt-get install gfortran-9 -y
```

## Go

- (1.14.1)

```bash
curl -sSL https://golang.org/dl/go1.14.1.linux-amd64.tar.gz -o go.tar.gz
tar -C /usr/local -xzf go.tar.gz
echo 'export PATH="$PATH:/usr/local/go/bin"' >> ~/.bashrc
. ~/.bashrc
```

## Haskell

- (GHC 8.8.3)

```bash
apt-get install -y \
        libffi-dev libffi6 libgmp-dev \
        libgmp10 libncurses-dev \
        libncurses5 libtinfo5
echo "export GHCUP_INSTALL_BASE_PREFIX=/opt" >> ~/.bashrc
. ~/.bashrc
chown $USER:$USER /opt
export BOOTSTRAP_HASKELL_NONINTERACTIVE=1
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
echo "source /opt/.ghcup/env" >> ~/.bashrc
. ~/.bashrc
mkdir -p /opt/.cabal/store
cabal user-config update -a store-dir:/opt/.cabal/store
cabal user-config update -a package-db:/opt/.cabal/store
cabal v2-install --lib --package-env /opt/.cabal/global.env \
      QuickCheck-2.13.2 \
      array-0.5.3.0 \
      attoparsec-0.13.2.3 \
      bytestring-0.10.8.2 \
      containers-0.6.0.1 \
      deepseq-1.4.4.0 \
      extra-1.6.18 \
      fgl-5.7.0.1 \
      hashable-1.3.0.0 \
      heaps-0.3.6.1 \
      integer-logarithms-1.0.3 \
      lens-4.18.1 \
      massiv-0.4.2.0 \
      mono-traversable-1.0.13.0 \
      mtl-2.2.2 \
      mutable-containers-0.3.4 \
      mwc-random-0.14.0.0 \
      parallel-3.2.2.0 \
      parsec-3.1.13.0 \
      primitive-0.7.0.0 \
      psqueues-0.2.7.2 \
      random-1.1 \
      reflection-2.1.5 \
      repa-3.4.1.4 \
      template-haskell-2.14.0.0 \
      text-1.2.3.1 \
      tf-random-0.5 \
      transformers-0.5.6.2 \
      unboxing-vector-0.1.1.0 \
      unordered-containers-0.2.10.0 \
      utility-ht-0.0.14 \
      vector-0.12.0.3 \
      vector-algorithms-0.8.0.1 \
      vector-th-unbox-0.2.1.7
```

## Haxe; Java

- (4.0.3)

```bash
add-apt-repository ppa:haxe/releases -y
apt-get update
apt-get install haxe -y
haxelib setup /opt/haxelib
haxelib install hxjava
```

## Haxe; js

- (4.0.3)

```bash
add-apt-repository ppa:haxe/releases -y
apt-get update
apt-get install haxe -y
haxelib setup /opt/haxelib
haxelib install hxnodejs
```

## Java

- (OpenJDK 11.0.6)

```bash
apt-get install openjdk-11-jdk -y
```

- (OpenJDK 1.8.0)

```bash
apt-get install openjdk-8-jdk -y
```

## JavaScript

- (Node.js 12.16.1)

```bash
curl -sL https://deb.nodesource.com/setup_12.x | bash
apt-get install nodejs -y
npm update -g npm
```

## Julia

- (1.4.0)

```bash
curl -sSL https://julialang-s3.julialang.org/bin/linux/x64/1.4/julia-1.4.0-linux-x86_64.tar.gz -o julia.tar.gz
tar -C /opt -xzf julia.tar.gz
ln -s /opt/julia-1.4.0/bin/julia /usr/local/bin/julia
julia -e 'using Pkg
Pkg.add("DataStructures"); using DataStructures
Pkg.add("Primes"); using Primes'
```

## Kotlin

- (1.3.71)

```bash
curl -s https://get.sdkman.io | bash
. ~/.sdkman/bin/sdkman-init.sh
sdk install kotlin
```

## Lua

- (Lua 5.3.5)

```bash
curl -sSL https://www.lua.org/ftp/lua-5.3.5.tar.gz -o lua.tar.gz
tar xf lua.tar.gz
cd lua-5.3.5
make linux
make install
```

- (LuaJIT 2.1.0)

```bash
apt-get install luajit -y
```

## Nim

- (1.0.6)

```bash
curl https://nim-lang.org/choosenim/init.sh -sSf | bash -s -- -y
echo 'export PATH="$PATH:/root/.nimble/bin"' >> ~/.bashrc
. ~/.bashrc
nimble install neo -y
apt-get install libopenblas-base -y
nimble install bignum -y
```

## Objective-C

- (Clang 10.0.0)

```bash
apt-get install gobjc-9 gnustep gnustep-devel -y
```

## OCaml

- (4.10.0)

```bash
apt-add-repository ppa:avsm/ppa -y
apt-get update
apt-get install opam -y
opam switch create 4.09.0
opam install num containers core iter batteries -y
```

## Octave

- (5.2.0)

```bash
apt-add-repository ppa:alexlarsson/flatpak -y
apt-get update
apt-get install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub org.octave.Octave
```

## Pascal

- (FPC 3.0.4)

```bash
apt-get install fpc -y
```

## Perl

- (5.26.1)

```bash
apt-get install perl -y
```

## PHP

- (7.4.4)

```bash
apt-add-repository ppa:ondrej/php -y
apt-get update
apt-get install php7.4-cli php7.4-bcmath php7.4-gmp -y
```

## Prolog

- (SWI-Prolog 8.0.3)

```bash
apt-add-repository ppa:swi-prolog/stable -y
apt-get update
apt-get install swi-prolog -y
```

## PyPy2

- (7.3.0)

```bash
curl -sSL https://bitbucket.org/pypy/pypy/downloads/pypy2.7-v7.3.0-linux64.tar.bz2 -o pypy2.tar.bz2
tar -C /opt -xf pypy2.tar.bz2
ln -s /opt/pypy2.7-v7.3.0-linux64/bin/pypy /usr/local/bin/pypy
```

## PyPy3

- (7.3.0)

```bash
curl -sSL https://bitbucket.org/pypy/pypy/downloads/pypy3.6-v7.3.0-linux64.tar.bz2 -o pypy3.tar.bz2
tar -C /opt -xf pypy3.tar.bz2
ln -s /opt/pypy3.6-v7.3.0-linux64/bin/pypy3 /usr/local/bin/pypy3
```

## Python3

- (3.8.2)
- (Cython 0.29.16)

```bash
apt-get install -y python3.8 python3.8-dev python3-pip build-essential
python3.8 -m pip install Cython==0.29.16 numba numpy scipy scikit-learn networkx
```

## Racket

- (7.6)

```bash
apt-add-repository ppa:plt/racket -y
apt-get update
apt-get install racket -y
```

## Raku

- (Rakudo 2020.02.1)

```bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
                 --recv 379CE192D401AB61
echo "deb https://dl.bintray.com/nxadm/rakudo-pkg-debs `lsb_release -cs` main" \
>> /etc/apt/sources.list.d/rakudo-pkg.list
sudo apt-get update && sudo apt-get install rakudo-pkg
```

## Ruby

- (2.7.1)

```bash
curl -sSL https://github.com/postmodern/ruby-install/archive/v0.8.3.tar.gz -o ruby-install.tar.gz
tar -xzvf ruby-install.tar.gz
cd ruby-install-0.8.3
make install
ruby-install ruby 2.7.1
gem install specific_install
gem specific_install https://github.com/ruby-numo/numo-narray.git
```

## Rust

- (1.42.0)

```bash
echo 'export RUSTUP_HOME=/opt/rust/rustup' >> ~/.bashrc
echo 'export CARGO_HOME=/opt/rust/cargo' >> ~/.bashrc
. ~/.bashrc
curl --proto '=https' \
     --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo 'export PATH="$PATH:/opt/rust/cargo/bin"' >> ~/.bashrc
. ~/.bashrc
rustup install 1.42.0
mkdir -p /opt/rust/templates/1.42.0/main
cd /opt/rust/templates/1.42.0/main
rustup run 1.42.0 cargo init
echo 'superslice = "1.0.0"' >> Cargo.toml
echo 'permutohedron = "0.2.4"' >> Cargo.toml
echo 'bitset-fixed = "0.1.0"' >> Cargo.toml
rustup run 1.42.0 cargo build --release
```

## Scala

- (2.13.1)

```bash
apt-get install openjdk-8-jre-headless -y
curl -sSL https://www.scala-lang.org/files/archive/scala-2.13.1.deb -o scala.deb
apt-get install ./scala.deb -y
```

## Scheme

- (Gauche 0.9.9)

```bash
curl -sSL https://raw.githubusercontent.com/shirok/get-gauche/master/get-gauche.sh | bash
```

## Sed

- (4.4)
- pre-installed

## Standard ML

- (MLton 20130715)

```bash
apt-get install mlton -y
```

## Swift

- (5.2.1)

```bash
apt-get install libicu-dev libpython-all-dev -y
curl -sSL https://swift.org/builds/swift-5.2.1-release/ubuntu1804/swift-5.2.1-RELEASE/swift-5.2.1-RELEASE-ubuntu18.04.tar.gz -o swift.tar.gz
tar xvfz ./swift.tar.gz
mkdir -o /usr/local/swift
mv ./swift-5.2.1-RELEASE-ubuntu18.04/* /usr/local/swift
echo 'export PATH="$PATH:/usr/bin"' >> ~/.bashrc
. ~/.bashrc
```

## Text

- (cat 8.28)
- pre-installed

## TypeScript

- (3.8)
- nodejsの後で

```bash
npm install -g typescript@3.7.4
npm install -g tstl
```

## Unlambda

- (2.0.0)

```bash
curl -sSL ftp://ftp.madore.org/pub/madore/unlambda/unlambda-2.0.0.tar.gz -o unlambda.tar.gz
tar xf unlambda.tar.gz
gcc -O2 -ansi unlambda-2.0.0/c-refcnt/unlambda.c
cp a.out /usr/bin/unlambda-c
```

## Vim

- (8.2.0460)

```bash
add-apt-repository ppa:jonathonf/vim
apt-get install vim-noxadd
```

## Visual Basic

- (.NET Core 3.1.101)

`C#`の項参照

## Zsh

- (5.4.2)

```bash
apt install zsh -y
```
