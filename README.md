<!-- badges: start -->
[![Version](https://img.shields.io/github/v/release/rapporteket/pilot?sort=semver)](https://github.com/rapporteket/pilot/releases)
[![R build status](https://github.com/rapporteket/pilot/workflows/R-CMD-check/badge.svg)](https://github.com/rapporteket/pilot/actions)
[![Codecov test coverage](https://codecov.io/gh/Rapporteket/pilot/branch/main/graph/badge.svg)](https://codecov.io/gh/Rapporteket/pilot?branch=main)
[![Lifecycle: maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![GitHub open issues](https://img.shields.io/github/issues/rapporteket/pilot.svg)](https://github.com/rapporteket/pilot/issues)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Doc](https://img.shields.io/badge/Doc--grey.svg)](https://rapporteket.github.io/pilot/)
<!-- badges: end -->
  
# Pilot-rapportek

## Bygg docker image lokalt

For å bygge og kjøre docker image lokalt kan man gjøre følgende:

1. Bygg pakken til en `tar.gz`-fil
```sh
R CMD build .
```
2. Lag Github Personal Access Token. Dette kan enten gjøres direkte på github (https://github.com/settings/tokens) eller gjennom R (`usethis::create_github_token()`). Det tryggeste er å *ikke* gi den noe særlig med rettigheter (kun lese). Vi lager og bruker en token for å ikke få feil fordi man har for mange api-kall til github.
3. Putt den i miljøvariablen `GITHUB_PAT`.
```sh
export GITHUB_PAT=ghp_ETT_ELLER_ANNET # token du nettop lagde
```
4. Bygg image med navn `some_image_name`. Bruker `--progress plain` for å få ut alt av `stdout`, og mater inn token som en hemmelighet
```sh
docker build -t some_image_name --progress plain --secret id=GITHUB_PAT .
```
5. Kjør image
```sh
# enten
docker run -p 3838:3838 some_image_name
# eller
docker compose up
```
6. Åpne siden http://localhost:3838/ og se resultatet
