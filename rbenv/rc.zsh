export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix libyaml) --with-zlib-dir=$(brew --prefix zlib)"

eval "$(rbenv init - zsh)"
