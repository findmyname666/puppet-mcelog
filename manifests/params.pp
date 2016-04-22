class mcelog::params {
  $enabled = true
  $settings = {}
  $config_fn = '/etc/mcelog/mcelog.conf'

  case $::operatingsystem {
    redhat,centos,scientific,slc,oraclelinux: {
      $packages = ['mcelog']

      case $::operatingsystemmajrelease {
        6:       { $service = 'mcelogd' }
        7:       { $service = 'mcelog'  }
        default: {
          fail("Unsupported OS release: \
${::operatingsystem} ${::operatingsystemmajrelease}")
        }
      }
    }

    debian,ubuntu: {
      $packages = ['mcelog']
      $service  = 'mcelog'
    }

    sles,sled: {
      $packages = ['mcelog']
      $service = 'mcelog'
    }

    default: {
      fail("Unsupported OS: ${::operatingsystem}")
    }
  }
}
