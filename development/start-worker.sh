#!/bin/bash
FAKTORY_PROVIDER=FAKTORY_URL FAKTORY_URL=tcp://:dcd1b7351070d689@localhost:7419 bundle exec faktory-worker  -r ./text-track-worker.rb
