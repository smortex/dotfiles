class pam_u2f {
  include "pam_u2f::${fact('os.family')}"
}
