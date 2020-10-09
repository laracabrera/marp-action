#!/bin/bash

set -e

EMOJI_WORKING=(
    "👷 Working..."
    "🏃 Running..."
    "🏗 Building..."
    "🚧 Building..."
)
STARTING_MESSAGE=${EMOJI_WORKING[$[$RANDOM % ${#EMOJI_WORKING[@]}]]}

EMOJI_SUCCESS=(
    "💯 Done!"
    "🚢 Ship it!"
    "🚀 Awesome!"
  )
SUCCESS_MESSAGE=${EMOJI_SUCCESS[$[$RANDOM % ${#EMOJI_SUCCESS[@]}]]}

echo "$STARTING_MESSAGE"
echo ""

# ENTRYPOINT ["node", "/home/marp/.cli/marp-cli.js"]

echo "   Building with marp..."
echo ""
for f in $(find $SUBFOLDER/ -name '*.md') ; do
  FICHERO=$(basename "$f" .md)
  node /home/marp/.cli/marp-cli.js $f --allow-local-files -o "${FICHERO}.pdf"
done
echo "✔  Built Successfully!"
echo ""

# echo "   Publishing to ${GITHUB_REPOSITORY} ${REMOTE_BRANCH}..."
# echo ""

# remote_repo="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" && \
# git init && \
# git config user.name "marp-action" && \
# git config user.email "marp-action@users.noreply.github.com" && \
# git add . && \
# git status && \
# curr_branch="$(git rev-parse --abbrev-ref HEAD)" && \
# git commit -m'action build' && \
# git push --force $remote_repo ${curr_branch}:${PUBLISH_TO_BRANCH}

# echo "✔  Pushed Successfully!"
# echo ""

# echo "$SUCCESS_MESSAGE"

