class mcelog::install {
  package { $::mcelog::packages:
    ensure => $::mcelog::ensure,
  }
}
