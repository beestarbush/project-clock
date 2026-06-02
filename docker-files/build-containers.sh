#!/bin/sh
set -eu

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
REPO_ROOT="$(CDPATH= cd -- "${SCRIPT_DIR}/.." && pwd)"

DOCKER_CMD="${DOCKER_CMD:-docker}"
USER_ID="${USER_ID:-$(id -u)}"
GROUP_ID="${GROUP_ID:-$(id -g)}"

echo "Building qtbuilder..."
"${DOCKER_CMD}" build "${REPO_ROOT}" \
  -f "${SCRIPT_DIR}/qtbuilder/Dockerfile" \
  -t qtbuilder \
  --build-arg USER_ID="${USER_ID}" \
  --build-arg GROUP_ID="${GROUP_ID}"

echo "Building bspbuilder..."
"${DOCKER_CMD}" build "${REPO_ROOT}" \
  -f "${SCRIPT_DIR}/bspbuilder/Dockerfile" \
  -t bspbuilder

echo "Building webbuilder..."
"${DOCKER_CMD}" build "${REPO_ROOT}" \
  -f "${SCRIPT_DIR}/webbuilder/Dockerfile" \
  -t webbuilder

echo "All docker images built successfully."
