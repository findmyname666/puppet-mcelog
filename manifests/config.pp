class mcelog::config {
  create_ini_settings(
    $::mcelog::settings,
    { 'path' => $::mcelog::config_fn }
  )
}
