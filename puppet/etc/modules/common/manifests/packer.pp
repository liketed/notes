define common::packer {
  jenkins::job { $name:
    config => template("common/${templates}/packer.json.erb"),
  }
}
