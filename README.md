# packer-archlinux

![CI Status]()

## Description
packer-archlinux is component for build archlinux vagrant box file.

## Requirements
- [Packer](https://www.packer.io/)
- [Virtualbox](https://www.virtualbox.org/)
- [Arch Linux ISO](https://wiki.archlinux.org/)

## Usage

  Download archlinux iso by `iso_download.sh`

  ```shell
  $ ./iso_download.sh
  ```

  Then, run `packer build`

  ```shell
  $ packer build archlinux-x86_64.json
  ```

## Configuration

TBD
edit variables at packer json.
