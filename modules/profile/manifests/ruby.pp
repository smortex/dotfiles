class profile::ruby {
  file { "${fact('home')}/.bundle":
    ensure => directory,
  }

  file { "${fact('home')}/.bundle/config":
    ensure => file,
    content => @("CONFIG"),
      ---
      BUNDLE_PATH: "${fact('home')}/.bundle/vendor"
      BUNDLE_JOBS: "4"
      BUNDLE_GEM__TEST: "rspec"
      BUNDLE_GEM__MIT: "true"
      BUNDLE_GEM__COC: "true"
      | CONFIG
  }
}
