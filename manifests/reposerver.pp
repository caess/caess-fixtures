# == Class: fixtures::mockrepo
#
# Full description of class fixtures::mockrepo here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { fixtures:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Chris Ess <caess@ithiriel.com>
#
# === Copyright
#
# Copyright 2013 Chris Ess
#
class fixtures::reposerver {
  class { "mrepo": }

  mrepo::repo { 'centos6-x86_64':
    ensure    => present,
    update    => never,
    repotitle => 'CentOS 6 64-bit',
    arch      => 'x86_64',
    release   => '6',
    urls      => {
      os         => 'rsync://ftp.linux.ncsu.edu/CentOS/6/os/x86_64/',
      updates    => 'rsync://ftp.linux.ncsu.edu/CentOS/6/updates/x86_64/',
      fasttrack  => 'rsync://ftp.linux.ncsu.edu/CentOS/6/fasttrack/x86_64/',
      cr         => 'rsync://ftp.linux.ncsu.edu/CentOS/6/cr/x86_64/'
    }
  }
}
