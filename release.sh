#!/bin/bash

# Fetch the latest dev tag
latest_dev_tag=$(git describe --tags --match "*dev.*" --abbrev=0)
echo $latest_dev_tag
# Check if the latest_dev_tag is empty (no dev tag exists)
if [ -z "$latest_dev_tag" ]; then
  echo "No dev tag found. Exiting script."
  exit 1
fi

# Extract major version and commit hash
major_version=$(echo "$latest_dev_tag" | sed -E 's/([0-9]+\.[0-9]+\.[0-9]+)\..*/\1/')
echo "Major version: $major_version"

# Increment the QA version (replace -dev. with -rc0.)
qa_version="${major_version}-rc.0"

# Create a new tag for QA
git tag -a "$qa_version" -m "Release Candidate 0 for QA"

git push origin "$qa_version"

# Display the new QA version
echo "QA version created: $qa_version"
