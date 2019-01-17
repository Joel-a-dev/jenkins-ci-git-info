#!/bin/bash

set -v 

BANDIT_CONFIG='config/bandit.config.yaml'
REPORT_HTML='banditReport.html'
REPORT_TXT='banditReport.txt'

echo 'Running Bandit tests'
bandit -r -f html -o bandit.report.html ../../

if [ ! -f $IGNORE_FILE ]; then
    echo "Initially creating bandit.ignore file"
    mv /bandit/bandit.ignore.example /src/bandit.ignore 
    chmod -R 666 "$IGNORE_FILE"
fi
