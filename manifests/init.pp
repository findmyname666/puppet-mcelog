class mcelog (
  String $ensure                  = $::mcelog::params::ensure,
  Array $packages                 = $::mcelog::params::packages,
  Hash $settings                  = $::mcelog::params::settings,
  Stdlib::Absolutepath $config_fn = $::mcelog::params::config_fn,
  String $service                 = $::mcelog::params::service
) inherits mcelog::params {
  contain ::mcelog::install
  contain ::mcelog::service

  case $ensure {
    'present': {
      contain ::mcelog::config

      Class['::mcelog::install']
        -> Class['::mcelog::config']
        ~> Class['::mcelog::service']
    }

    'absent': {
      Class['::mcelog::service']
        ~> Class['::mcelog::install']
    }

    default: {
      fail("Invalid ensure state: ${ensure}")
    }
  }
}
