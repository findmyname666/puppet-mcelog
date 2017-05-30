class mcelog (
  $ensure    = $::mcelog::params::ensure,
  $packages  = $::mcelog::params::packages,
  $settings  = $::mcelog::params::settings,
  $config_fn = $::mcelog::params::config_fn,
  $service   = $::mcelog::params::service
) inherits mcelog::params {

  validate_array($packages)
  validate_hash($settings)
  validate_absolute_path($config_fn)
  validate_string($service, $ensure)

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
