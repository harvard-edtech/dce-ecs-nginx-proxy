# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.5.1] - 2026-11-18

### Fixed
- workflow `base_image_name` now matches the Dockerfile (`nginx:1.30-alpine`); 1.5.0 was still built on 1.30.2

## [1.5.0] - 2026-11-18

### Modified
- nginx base image pinned at the minor version level (1.30)
- image is now also tagged `latest`

## [1.4.0] - 2026-06-04

### Modified
- update and pin nginx base image to 1.30.2
- now using shared dce-build-and-push github workflow

## [1.3.0]

### Modified
- supported TLS versions limited to TLSv1.2 and TLSv1.3.

## [1.2.0] - 2025-01-23

### Added
- proxy settings now pass Origin header

## [1.1.0] - 2023-06-01

First tagged version
