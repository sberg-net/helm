# Changelog

## 1.5.0 (2025-03-26)

### Added
* add networkpolicy settings

## 1.4.0 (2025-03-19)

### Changed
* add flexibility to service configuration 

### Fixed
* wrong if block for initContainers mariadb live check

## 1.3.1 (2025-03-10)

### Fixed
* wrong web service name in ingress.yaml

## 1.3.0 (2025-03-07)

### Changed
* rm default settings securityContext and use image default
* changes on build eldix image path/name
* please use eldix version >=2.10.2

## 1.2.0 (2025-02-27)

### Added
* smtp port service
* external DB configuration
* Probes to eldix container
* nodeSelector {} to eldix container
* settings {} to eldix container
* repo/registry for eldix image

### Changed
* internal DB to mariadb bitnami chart
* ingress/tls configuration
* rm static nfs PV parameter
* new eldix version 2.10.1
* update README 

## 1.1.0 (2025-02-12)

* add README
* clean default values
* add ingress

## 1.0.0 (2025-01-30)

* initial version 1.0.0
