#!/bin/sh

# !! KEEP THIS SCRIPT POSIX COMPLIANT !!

# see https://docs.haskellstack.org/en/stable/configure/customisation_scripts/#ghc-installation-customisation
# for documentation about hooks

set -eu

#   XXX This should use an environment flag to enable verbose mode
#   for these various status messages.
echo 1>&2 "■ .stack/hooks/ghc-install.sh ▶ type=$HOOK_GHC_TYPE version=$HOOK_GHC_VERSION"

case $HOOK_GHC_TYPE in
    bindist)
        if ghcup whereis ghc "$HOOK_GHC_VERSION" 2>/dev/null; then
            exec ghcup whereis ghc "$HOOK_GHC_VERSION"
        elif ! [ -w "$HOME/.ghcup/ghc/" ]; then
            #   We cannot install; just fail quickly.
            echo 1>&2 "~/.ghcup/ghc/ read-only; not attempting install."
            exit 3
        else
            #   Install missing version.
            ghcup install ghc "$HOOK_GHC_VERSION"
            exec ghcup whereis ghc "$HOOK_GHC_VERSION"
        fi
        ;;
    git)
        # TODO: should be somewhat possible
        >&2 echo "Hook doesn't support installing from source"
        exit 1
        ;;
    *)
        >&2 echo "Unsupported GHC installation type: $HOOK_GHC_TYPE"
        exit 2
        ;;
esac
