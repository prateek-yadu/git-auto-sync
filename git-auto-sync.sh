#!/bin/bash

# Configuration - easily change these
REMOTE="origin"
BRANCH="main"
REMOTE_URL="git@github.com:your_git_repo"
DIR="/path/to/sync"  # Set your repository path here

# Change to the specified directory
cd "$DIR" || { echo "Error: Cannot change to directory $DIR"; exit 1; }

echo "Working in: $(pwd)"

# Set remote URL if provided
if [ -n "$REMOTE_URL" ]; then
    git remote set-url "$REMOTE" "$REMOTE_URL" 2>/dev/null || git remote add "$REMOTE" "$REMOTE_URL"
    echo "Remote URL configured"
fi

# Pull latest changes
echo "Pulling latest changes from $REMOTE/$BRANCH..."
if ! git pull "$REMOTE" "$BRANCH"; then
    echo "Pull failed. Please resolve conflicts manually."
    exit 1
fi

# Check, commit, and push
if [ -n "$(git status --porcelain)" ]; then
    echo "Changes detected. Committing and pushing..."
    git add -A && git commit -m "commit on $(date +'%d %B %Y')"
    
    if [ $? -eq 0 ]; then
        echo "Commit successful. Pushing..."
        if git push "$REMOTE" "$BRANCH"; then
            echo "✓ Changes committed and pushed successfully"
        else
            echo "✗ Push failed"
            exit 1
        fi
    else
        echo "✗ Commit failed"
        exit 1
    fi
else
    echo "No changes to commit after pull. Working directory clean."
fi
