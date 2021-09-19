Facter.add(:pass_path) do
  setcode 'which pass'
end
