# frozen_string_literal: true

Puppet::Type.newtype(:gitconfig) do
  ensurable

  newparam(:name, namevar: true) do
    desc 'An arbitrary name used as the identity of the resource.'
  end

  newparam(:path) do
    desc 'The gitconfig file Puppet will ensure contains the specified setting.'
  end

  newparam(:section) do
    desc 'The name of the section in the ini file in which the setting should be defined.'
  end

  newparam(:setting) do
    desc 'The name of the setting to be defined.'
  end

  newparam(:value) do
    desc 'The value of the setting to define'
  end
end
