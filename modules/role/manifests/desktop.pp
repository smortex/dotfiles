class role::desktop inherits role::base {
  include profile::git
  include profile::gnupg
  include profile::mail
  include profile::nvim
  include profile::ruby
}
