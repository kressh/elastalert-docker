# Elastalert Docker Image

Docker image with Elastalert on Alpine Linux.

Assumes the use of port 9200 when communicating with Elasticsearch.

# Volumes

- /opt/elastalert       - Elastalert (config.yaml) configuration files.
- /opt/elastalert/rules - Contains Elastalert rules.


# Environment

- ELASTALERT_INDEX         - Name of Elastalert writeback index in Elasticseach. Defaults to `elastalert_status`.
- ELASTALERT_CREATE_INDEX  - Fill if you want to run `elastalert-create-index`
