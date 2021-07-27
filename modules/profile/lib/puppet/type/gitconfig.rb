# frozen_string_literal: true

Puppet::Type.newtype(:gitconfig) do
  ensurable

  newparam(:setting, namevar: true) do
    desc 'Section/setting name to manage from glance-api.conf'
  end

  newparam(:path) do
    desc 'The path'
  end

  newparam(:section) do
    desc 'The section'
  end

  newparam(:value) do
    desc 'The value of the setting to define'
  end
end
