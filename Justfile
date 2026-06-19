set shell := ["powershell.exe", "-c"]

default:
    just --list

compile:
    vsce package
    code --install-extension pcoi-theme-*.vsix --allow-missing-repository

package:
    vsce package

install:
    code --install-extension pcoi-theme-*.vsix --allow-missing-repository
