require 'spec_helper'

describe 'fixtures::reposerver' do
  let(:facts) {
    {
      :concat_basedir => '/tmp',
      :operatingsystemrelease => '6.4',
      :osfamily => 'RedHat'
    }
  }

  it {should include_class('mrepo')}
end