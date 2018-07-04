#!/bin/bash
set -e

python -m unittest discover -s test/unit/ -p 'test_*.py'

