class mcelog::service {
  $_state = $::mcelog::ensure ? {
    'present' => true,
    'absent'  => false,
  }

  service { $::mcelog::service:
    ensure => $_state,
    enable => $_state,
  }
}
