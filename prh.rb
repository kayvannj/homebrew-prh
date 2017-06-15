# Documentation: https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula

class Prh < Formula
  desc "A tool to help creating PullRequests on Github easier and automate some of the steps"
  homepage "https://github.com/kayvannj/PullRequestHelper"
  # head "https://github.com/kayvannj/PullRequestHelper.git"
  url "https://github.com/kayvannj/PullRequestHelper/archive/2.3.0.tar.gz"
  sha256 "9e656606343c01e1d1d976c95997f83840a804618839aa5f5dff20b2b02de9b0"

  depends_on :python if MacOS.version <= :snow_leopard

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/dd/0e/1e3b58c861d40a9ca2d7ea4ccf47271d4456ae4294c5998ad817bd1b4396/certifi-2017.4.17.tar.gz"
    sha256 "f7527ebf7461582ce95f7a9e03dd141ce810d40590834f4ec20cddd54234c10a"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/d8/82/28a51052215014efc07feac7330ed758702fc0581347098a81699b5281cb/idna-2.5.tar.gz"
    sha256 "3cb5ce08046c4e3a560fc02f138d0ac63e00f8ce5901a56b32ec8b7994082aab"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/2c/b5/2b6e8ef8dd18203b6399e9f28c7d54f6de7b7549853fe36d575bd31e29a7/requests-2.18.1.tar.gz"
    sha256 "c6f3bdf4a4323ac7b45d01e04a6f6c20e32a052cd04de81e05103abc049ad9b9"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/96/d9/40e4e515d3e17ed0adbbde1078e8518f8c4e3628496b56eb8f026a02b9e4/urllib3-1.21.1.tar.gz"
    sha256 "b14486978518ca0901a76ba973d7821047409d7f726f22156b24e83fd71382a5"
  end


  include Language::Python::Virtualenv
  def install
    inreplace "prhpackage/__main__.py", "config_file_path", "#{HOMEBREW_PREFIX}/etc"
    virtualenv_install_with_resources
    # ENV.prepend_create_path "PYTHONPATH", "#{libexec}/vendor/lib/python2.7/site-packages"
    # resource("requests").stage do
    #   system "python", *Language::Python.setup_install_args(libexec/"vendor")
    # end
    #
    # ENV.prepend_create_path "PYTHONPATH", "#{libexec}/lib/python2.7/site-packages"
    # system "python", *Language::Python.setup_install_args(libexec)
    # bin.install Dir[libexec/"bin/*"]
    # bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])

    # bin.install Dir[libexec/"bin/*"]

    # begin
    #   cp "/usr/local/etc/prh_config.py.default", "/usr/local/etc/prh_config.py"
    # rescue
    # end

  end

  test do
    system "#{bin}/prh", "--version"
  end

end
