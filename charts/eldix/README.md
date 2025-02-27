# eldix Helm Chart

* Installs KIM Client System eldix

## Get Repo Info

```console
helm repo add sberg https://sberg-net.github.io/helm/
helm repo update
```

_See https://artifacthub.io/packages/helm/sberg/eldix for more details_

## Installing the Chart

To install the chart with the release name `my-eldix`:

```console
helm install my-eldix sberg/edlix
```

## Uninstalling the Chart

To uninstall/delete the my-eldix deployment:

```console
helm delete my-eldix
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## eldix application settings

| Name                                  | Beschreibung                            | Values                            | default         |
|---------------------------------------|-----------------------------------------|-----------------------------------|-----------------|
| eldix.settings.tz                     | timezone                                | tzdata zones (e.g. Europe/Berlin) | Europe/Berlin   |
| eldix.settings.error_mail_address     | sender mail address for error massages  | mail address                      | eldix@sberg.net |
| eldix.settings.log_max_hist           | max logfile history                     | days                              | 50              |
| eldix.settings.log_max_file_size      | max logfile size                        | storage size (e.g. 100KB,10MB)    | 10MB            | 
| eldix.settings.app_profile            | springboot application profile          | dev, default                      | default         |
| eldix.settings.log_level              | app log level                           | debug, info, warn, error          | info            |

## database settings

### external database
If you use an external Database set:

`externalDatabase.enabled: true` </br>
and</br>
`mariadb.enabled: false`

*external database settings:*

| Name                          | Beschreibung                         | Values | default |
|-------------------------------|--------------------------------------|--------|---------|
| externalDatabase.hostname     | mariaDB hostname or IP Address       | *      |         |
| externalDatabase.port         | mariaDB Port (optional)              | *      | 3306    |
| externalDatabase.database     | eldix database name                  | *      |         |
| externalDatabase.user         | username for eldix database          | *      |         |
| externalDatabase.password     | password for eldix database          | *      |         |
| externalDatabase.rootPassword | root password for mariaDB (optional) | *      |         |

If the `rootPassword` is set, the db initializer will conect the db as db-root and can create the database if not exist. 
If not set the initializer will run with user & password and can't create non exiting database.

### internal database mariaDB
The internal DB based on helm chart mariadb bitnami. See detailed information hier: https://artifacthub.io/packages/helm/bitnami/mariadb 

If you use the internal mariadb set:

`externalDatabase.enabled: false` </br>
and</br>
`mariadb.enabled: true`

*the following chart settings will automatically affect eldix container :*

| Name                                        | Beschreibung                         | Values | default |
|---------------------------------------------|--------------------------------------|--------|---------|
| mariadb.primary.service.ports.mysql         | mariaDB Port (optional)              | *      | 3306    |
| mariadb.auth.database                       | eldix database name                  | *      |         |
| mariadb.auth.user                           | username for eldix database          | *      |         |
| mariadb.auth.password                       | password for eldix database          | *      |         |
| mariadb.auth.rootPassword                   | root password for mariaDB (optional) | *      |         |

If the `rootPassword` is set, the db initializer will conect the db as db-root and can create the database if not exist.
If not set the initializer will run with user & password and can't create non exiting database.
