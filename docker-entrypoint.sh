#!/bin/bash
set -e

service postfix restart

exec "$@"
