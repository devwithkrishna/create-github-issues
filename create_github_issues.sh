#!/bin/bash

ORGANIZATION=$1
REPOSITORY_NAME=$2
TITLE=$3
BODY=$4
ASSIGNEES=$5
LABELS=$6

# Use an array for assignees and labels
ASSIGNEES_ARRAY=($ASSIGNEES)
IFS=',' read -ra LABELS_ARRAY <<< "$LABELS"

# Construct JSON data
DATA=$(cat <<EOF
{
  "title": "$TITLE",
  "body": "$BODY",
  "assignees": $(printf '%s' "${ASSIGNEES:+[\"${ASSIGNEES_ARRAY[@]}\"]}"),
  "labels": ${LABELS:+[\"${LABELS_ARRAY[@]}\"]}
}
EOF
)

# DEBIG json
echo "JSON DATA: $DATA"

# Make the API call
curl -L \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: Bearer $GH_TOKEN" \
  -H "Content-Type: application/json" \
  https://api.github.com/repos/$ORGANIZATION/$REPOSITORY_NAME/issues \
  -d "$DATA"
