## 
class common::jenkin {
  class {'jenkins':
  }

  jenkins::plugin { 'git': }
  jenkins::job { 'CentOS-6.8':
    config => template("${templates}/test-build-job.xml.erb"),
  }


}
