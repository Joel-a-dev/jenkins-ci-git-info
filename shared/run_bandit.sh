#!/bin/bash

set -v 

BANDIT_CONFIG='config/bandit.config.yaml'
REPORT_HTML='banditReport.html'
REPORT_TXT='banditReport.txt'

echo 'Running Bandit tests'
bandit -r -f html -o app/bandit.report.html .