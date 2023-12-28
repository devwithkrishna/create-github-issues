#! /bin/bash

# GH_TOKEN --> will be passed from the workflow as an env variable
ORGANIZATION=$1
REPOSITORY_NAME=$2
TITLE=$3
BODY=$4
ASSIGNEES=$5
MILESTONE=$6
LABELS=$7

# https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#create-an-issue

curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$ORGANIZATION/$REPOSITORY_NAME/issues \
  -d "{\"title\":\"$TITLE\",\"body\":\"$BODY\",\"assignees\":[$ASSIGNEES],\"milestone\":\"$MILESTONE\",\"labels\":[$LABELS]}"
