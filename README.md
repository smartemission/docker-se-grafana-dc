# docker-se-grafana-dc

Grafana viewer for AirSensEUR data from the InfluxDB Data Collector. Fully functional:
Includes Datasource and Dashboard definitions. You mainly need to provide
credential settings via Env-vars.

## Hosting

The Docker Image is hosted as: [smartemission/se-grafana-dc at DockerHub](https://hub.docker.com/r/smartemission/se-grafana-dc).

## Environment

The following environment vars need to be set,  either via `docker-compose` or Kubernetes.


Variable|Meaning |Example
---|---|--- 
`GF_SECURITY_ADMIN_USER`|Grafana admin username|secret
`GF_SECURITY_ADMIN_PASSWORD`|Grafana admin password|secret
`GF_AUTH_ANONYMOUS_ENABLED`/true
`SE_INFLUX_DC1_URL`|full URL InfluxDB endpoint for remote SE Data Collector for AirSensEUR|`http://dc1.smartemission.nl:8086`
`SE_INFLUX_USER`|InfluxDB user name|secret
`SE_INFLUX_PASSWORD`|InfluxDB user passwd|secret
`GF_SERVER_ROOT_URL`|external URL Grafana Web App|`%(protocol)s://%(domain)s:%(http_port)s/grafana-dc`

Other Grafana variables can be set at will according to the Grafana-scheme that follows
the `Grafana .ini` file format: `GF_<.ini section name>_<varname>`, all in capitals.

## Architecture

This Image uses the standard Grafana Docker Image, mainly 
adding "Provisioning" (as in Grafana v5+) files for Datasources (InfluxDB) and
Dashboards. 

Currently the Dashboards take from two InfluxDB Sources: the SE standard InfluxDB, used
mainly for Calibration and the SE Data Collector InfluxDB, used mainly for AirSensEUR.

The [entry.sh](entry.sh) script will perform
some magic to substitute credentials from environment vars.
It then calls the standard Grafana `/run.sh` script.
