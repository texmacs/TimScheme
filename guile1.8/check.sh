#!/bin/bash

if [ -L ${BASH_SOURCE-$0} ]; then
  FWDIR=$(dirname $(readlink "${BASH_SOURCE-$0}"))
else
  FWDIR=$(dirname "${BASH_SOURCE-$0}")
fi

APP_HOME="$(cd "${FWDIR}/.."; pwd)"

GUILE_LOAD_PATH=$APP_HOME/specs/modules guile -l $FWDIR/boot.scm $APP_HOME/specs/modules/main.scm
