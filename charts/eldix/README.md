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

## env parameter appContainer

| Name                      | Beschreibung                                                           | Values                           | default          |
|---------------------------|------------------------------------------------------------------------|----------------------------------|------------------|
| DB-HOST                   | mariaDB hostname or IP Address                                         | *                                | eldix4kim-mariadb |
| DB-NAME                   | eldix database name                                                    | *                                | eldix4kim        |
| DB-USER                   | username for eldix database (will be create by internal db initializer) | *                                | eldix4kim        |
| DB-PASSWORD               | password for eldix database (will be create by internal db initializer) | *                                | eldix            |
| DB-ROOT-PASSWORD          | root password for mariadb (to run db initializer/upgrade)              | *                                | mrdata123!       |
| LOG-MAX-FILES             | max logfile history                                                    | days                             | 50               |
| LOG-MAX-FILE-SIZE         | max logfile size                                                       | storage size (e.g. 100KB,10MB)   | 10MB             | 
| APP-PROFILES              | springboot application profile                                         | dev, default                     | default          |
| TZ                        | timezone                                                               | tzdata zones (e.g. Europe/Berlin) | Europe/Berlin    |

