# Puppet mcelog module

This module installs, configures and starts mcelog.

### Requirements

Module has been tested on:

* Puppet 3.8
* RHEL/CentOS 6,7 and Debian 7,8

Required modules:

* stdlib (https://github.com/puppetlabs/puppetlabs-stdlib)
* inifile (https://github.com/puppetlabs/puppetlabs-inifile)

# Quick Start

Setup

```puppet
include mcelog
```

Full configuration options:

```puppet
class { 'mcelog':
  ensure    => present|absent  # ensure state
  packages  => [...],          # override list of packages to install
  settings  => {...},          # hash of hashes to apply in mcelog.conf
  config_fn => '...'           # absolute path for mcelog.conf
  services  => [...],          # override list of services to start
}
```
Example:

```puppet
class { 'mcelog':
  settings => {
    ''     => { 'raw' => 'yes' },  # main section
    'dimm' => { 'dmi-prepopulate' => 'yes' },
  },
}
```

***

CERIT Scientific Cloud, <support@cerit-sc.cz>
