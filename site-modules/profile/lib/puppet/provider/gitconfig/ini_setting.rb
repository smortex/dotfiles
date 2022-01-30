# frozen_string_literal: true

Puppet::Type.type(:gitconfig).provide(:ini_setting, parent: Puppet::Type.type(:ini_setting).provider(:ruby)) do
  def indent_char
    "\t"
  end

  def indent_width
    1
  end
end
