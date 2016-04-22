class mcelog (
  $enabled   = $mcelog::params::enabled,
  $packages  = $mcelog::params::packages,
  $settings  = $mcelog::params::settings,
  $config_fn = $mcelog::params::config_fn,
  $service   = $mcelog::params::service
) inherits mcelog::params {

  validate_bool($enabled)
  validate_array($packages)
  validate_hash($settings)
  validate_absolute_path($config_fn)
  validate_string($service)

  class { 'mcelog::install':
    enabled  => $enabled,
    packages => $packages,
  }

  class { 'mcelog::service':
    enabled => $enabled,
    service => $service,
  }

  if $enabled {
    class { 'mcelog::config':
      settings  => $settings,
      config_fn => $config_fn,
    }

    anchor { 'mcelog::begin': ; }
      -> Class['mcelog::install']
      -> Class['mcelog::config']
      ~> Class['mcelog::service']
      -> anchor { 'mcelog::end': ; }
  } else {
    anchor { 'mcelog::begin': ; }
      -> Class['mcelog::service']
      -> Class['mcelog::install']
      -> anchor { 'mcelog::end': ; }
  }
}
