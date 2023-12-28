# create-github-issues

```
Any user with pull access to a repository can create an issue. If issues are disabled in the repository, the API returns a 410 Gone status.

This endpoint triggers notifications. Creating content too quickly using this endpoint may result in secondary rate limiting.
```

reference: [create-github-issue](https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#create-an-issue)

## How code works

* requires owner name / organization name
* requires repository name

### Arguments for creating the issue in Repository.

* title
* body
* lables
* assignees
* milestone


```
These parameters are received from the github workflow UI. These are then passed to restAPI in bash script
``` 

* The credential used is ``` FINE GRAINED PERSONAL ACCESS TOKEN ```
