require 'spec_helper'

describe 'capistrano::default' do
  it 'will run ruby' do
    expect(package('ruby2.1')).to be_installed
  end
end

describe command('cap --version') do
  its(:exit_status) { should eq 0}
end
