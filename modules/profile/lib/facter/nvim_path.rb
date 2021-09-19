Facter.add(:nvim_path) do
  setcode 'which nvim'
end  
