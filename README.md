# Helm Resource for Sentry releases

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
