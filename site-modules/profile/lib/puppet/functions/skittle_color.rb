require 'skittlize'

# Return a color based on the fqdn
Puppet::Functions.create_function(:skittle_color) do
  dispatch :skittle_color do
    param 'String', :subject
    return_type 'Integer'
  end

  def skittle_color(subject)
    subject.skittle_color
  end
end
