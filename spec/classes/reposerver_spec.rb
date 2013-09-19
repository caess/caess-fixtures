require 'spec_helper'

describe 'fixtures::reposerver' do
  let(:facts) {
    {
      :concat_basedir => '/tmp',
      :operatingsystemrelease => '6.4',
      :osfamily => 'RedHat'
    }
  }

  it {should contain_class('mrepo')}

  it {should contain_mrepo__repo('centos6-x86_64').with({
    'ensure' => 'present',
    'update' => 'never',
    'repotitle' => 'CentOS 6 64-bit',
    'metadata' => 'repomd',
    'arch' => 'x86_64',
    'release' => '6',
    'urls' => {
      'os' => 'rsync://ftp.linux.ncsu.edu/CentOS/6/os/x86_64/',
      'updates' => 'rsync://ftp.linux.ncsu.edu/CentOS/6/updates/x86_64/',
      'fasttrack' => 'rsync://ftp.linux.ncsu.edu/CentOS/6/fasttrack/x86_64/',
      'cr' => 'rsync://ftp.linux.ncsu.edu/CentOS/6/cr/x86_64/',
    }
  })}
end