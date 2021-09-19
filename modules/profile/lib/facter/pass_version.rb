Facter.add(:pass_version) do
  setcode "pass --version | grep -o 'v[0-9.]*'"
end
