FROM linuxbrew/brew:latest

LABEL version="1.0.0"
LABEL repository="https://github.com/zbeekman/brew-auto-update-pr"
LABEL homepage="https://github.com/zbeekman/brew-auto-update-pr"
LABEL maintainer="Izaak \"Zaak\" Beekman <zbeekman@gmail.com>"

LABEL com.github.actions.name="GitHub Action for updating Homebrew formula"
LABEL com.github.actions.description="Open a new Homebrew PR when a new release is published."
LABEL com.github.actions.icon="upload"
LABEL com.github.actions.color="gray-dark"

RUN sudo add-apt-repository ppa:cpick/hub \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       jq \
       hub \
    && rm -rf /var/lib/apt/lists/*

USER linuxbrew

RUN cd $(brew --repository homebrew/core) \
    && git remote set-url origin https://github.com/homebrew/homebrew-core \
    && brew update-reset

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
