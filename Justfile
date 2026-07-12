set shell := ["powershell.exe", "-c"]

default:
    just --list

build:
    vsce package --allow-missing-repository

install:
    code --install-extension (Get-Item sleepy-theme-*.vsix).FullName --force

deploy:
    just build
    just install
