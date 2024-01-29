#!/bin/sh

set -Eefuvx

CI=${1:-local}
DB_ADDR=${2:-127.0.0.1:26257}
DB_NAME=${3:-cdc-test}
GITHUB_TOKEN=${4:-00000000-0000-0000-0000-000000000000}
GITHUB_USER=${5:-smhmayboudi}
PROJECT_REF=${6:-0000.00.00-rc}
VERSION=${7:-development}

DSN="cockroachdb://root@${DB_ADDR}/${DB_NAME}?sslmode=disable"
if [ ${CI} = github ]; then
  SOURCE=github://${GITHUB_USER}:${GITHUB_TOKEN}@smhmayboudi/cdc-example/db/${DB_NAME}/${VERSION}#${PROJECT_REF}
fi
if [ ${CI} = local ]; then
  SOURCE=file://db/${DB_NAME}/${VERSION}
fi

migrate -database=${DSN} -source=${SOURCE} -verbose drop -f
migrate -database=${DSN} -source=${SOURCE} -verbose up
