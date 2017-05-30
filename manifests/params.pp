class mcelog::params {
  $ensure = 'present'
  $settings = {}
  $config_fn = '/etc/mcelog/mcelog.conf'

  case $::operatingsystem {
    'RedHat','CentOS','Scientific','SLC','OracleLinux': {
      $packages = ['mcelog']

      case $::operatingsystemmajrelease {
        '6': {
          $service = 'mcelogd'
        }

        '7': {
          $service = 'mcelog'
        }

        default: {
          fail("Unsupported OS release: \
${::operatingsystem} ${::operatingsystemmajrelease}")
        }
      }
    }

    'Debian','Ubuntu': {
      $packages = ['mcelog']
      $service  = 'mcelog'
    }

    'SLES', 'SLED': {
      $packages = ['mcelog']
      $service = 'mcelog'
    }

    default: {
      fail("Unsupported OS: ${::operatingsystem}")
    }
  }
}
