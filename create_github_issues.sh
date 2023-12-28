/#!/bin/bash

ORGANIZATION=$1
REPOSITORY_NAME=$2
TITLE=$3
BODY=$4
ASSIGNEES=$5
MILESTONE=$6
LABELS=$7

# Use an array for assignees and labels

ASSIGNEES_ARRAY=($ASSIGNEES)
IFS=',' read -ra LABELS_ARRAY <<< "$LABELS"

# Construct JSON data

DATA=$(cat <<EOF
{
  "title": "$TITLE",
  "body": "$BODY",
  "assignees": ${ASSIGNEES:+[\"${ASSIGNEES_ARRAY[@]}\"]},
  "milestone": "$MILESTONE",
  "labels": ${LABELS:+$(printf '"%s",' "${LABELS_ARRAY[@]}" | sed 's/,$//')}
}
EOF
)

# Make the API call

curl -L \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: Bearer $GH_TOKEN" \
  -H "Content-Type: application/json" \
  https://api.github.com/repos/$ORGANIZATION/$REPOSITORY_NAME/issues \
  -d "$DATA"
