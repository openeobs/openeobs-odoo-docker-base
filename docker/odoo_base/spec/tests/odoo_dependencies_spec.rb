require "spec_helper"

describe "Odoo 8.0 Docker image - Dependencies" do
  before(:all) do
    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image
  end

  describe package('ca-certificates') do
    it{ should be_installed }
  end

  describe package('curl') do
    it{ should be_installed }
  end

  describe package('node-less') do
    it{ should be_installed }
  end

  describe package('node-clean-css') do
    it{ should be_installed }
  end

  describe package('python-gevent') do
    it{ should be_installed }
  end

  describe package('python-pip') do
    it{ should be_installed }
  end

  describe package('python-pyinotify') do
    it{ should be_installed }
  end

  describe package('python-renderpm') do
    it{ should be_installed }
  end

  describe package('python-support') do
    it{ should be_installed }
  end

  describe package('virtualenv') do
    it{ should be_installed }
  end

  describe package('libpq-dev') do
    it{ should be_installed }
  end

  describe package('gcc') do
    it{ should be_installed }
  end

  describe package('python-dev') do
    it{ should be_installed }
  end

  describe package('libxml2-dev') do
    it{ should be_installed }
  end

  describe package('libxslt1-dev') do
    it{ should be_installed }
  end

  describe package('libldap2-dev') do
    it{ should be_installed }
  end

  describe package('libsasl2-dev') do
    it{ should be_installed }
  end

  describe package('libjpeg-dev') do
    it{ should be_installed }
  end

  describe package('npm') do
    it{ should_not be_installed }
  end

  describe package('wkhtmltox') do
    it{ should be_installed }
  end

  describe package('psycogreen') do
    it { should be_installed.by('pip') }
  end

end
