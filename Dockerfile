# syntax=docker/dockerfile:1
FROM rapporteket/base-r:main

LABEL maintainer="Arnfinn Hykkerud Steindal <arnfinn.hykkerud.steindal@helse-nord.no>"

WORKDIR /app/R

COPY *.tar.gz .

RUN --mount=type=secret,id=GITHUB_PAT,env=GITHUB_PAT \
    R -e "remotes::install_local(list.files(pattern = \"*.tar.gz\"))" \
    && rm ./*.tar.gz

EXPOSE 3838

CMD ["R", "-e", "options(shiny.port = 3838,shiny.host = \"0.0.0.0\"); pilot::run_app()"]
