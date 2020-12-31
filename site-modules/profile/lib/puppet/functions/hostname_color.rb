# Return a color based on the fqdn
Puppet::Functions.create_function(:hostname_color) do
  dispatch :hostname_color do
    return_type 'Integer'
  end

  def hostname_color
    hostname = Facter['fqdn'].value
    n = Digest::MD5.digest("#{hostname}\n")[-1].ord % 231
    n += 17 if [0, 15, 16].include?(n)
    n
  end
end
