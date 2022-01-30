type Profile::Gitconfig::Includes = Hash[
  String[1],
  Struct[{
    path     => String[1],
    settings => Profile::Gitconfig::Sections,
  }],
]
