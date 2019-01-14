#!/bin/bash

# script to generate the api_server/___init___.py file
# using variables from the jenkins CI

echo "
import os

__version__ = '$TAGGED_VERSION'

commit_hash = '$GIT_COMMIT'

build_timestamp = '$BUILD_TIMESTAMP'

" > api_server/___init___.py