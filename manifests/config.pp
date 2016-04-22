class mcelog::config (
  $settings,
  $config_fn
) {
  create_ini_settings($settings, {'path' => $config_fn})
}
