# Concourse Resource for Sentry releases

Manage releases in [Sentry](https://sentry.io), can be used to upload sourcemaps.

## Installing

Add the resource type to your pipeline:

```yaml
resource_types:
- name: sentry-releases
  type: docker-image
  source:
    repository: rubenv/concourse-sentry-releases-resource
```

## Source Configuration

* `host`: *Optional.* URL to the Sentry server, uses `https://sentry.io` by default.
* `token`: *Required.* API token.
* `organization`: *Required.* Organization name.
* `project`: *Required.* Project name.

## Behavior

### `check`: Check for new releases

Checks for new releases.

### `in`: Fetch release.

Fetches a release.

### `out`: Create release.

Creates a new release, optionally uploads files (e.g. source files and source maps).

#### Parameters

* `version_from`: *Required.* File from which the version ID should be read.
* `files`: *Optional.* Folder containing files to upload.
* `url_prefix`: *Optional.* URL prefix to apply, defaults to `~/`.

## Example

### Out

Define the resource:

```yaml
resources:
- name: myproject-releases
  type: sentry-releases
  source:
    token: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    organization: myorg
    project: myproject
```

Add to job:

```yaml
jobs:
  # ...
  plan:
  - put: myproject-releases
    params:
      version_from: build-output/release-id
      files: build-output/js/
      url_prefix: ~/js/
```
