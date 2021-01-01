require 'facter'

Facter.add(:tmux_version) do
  setcode "tmux -V | cut -d' ' -f2"
end
