# Documentation: https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula

class Prh < Formula
  desc "A tool to help creating PullRequests on Github easier and automate some of the steps"
  homepage "https://github.com/kayvannj/PullRequestHelper"
  url "https://github.com/kayvannj/PullRequestHelper/archive/2.1.1.tar.gz"
  sha256 "e2543a4aab57702acb25725570aed8f31b565b6f0b352a93c78b0bc3582d3989"

  resource "requests" do
    url "https://pypi.python.org/packages/5b/0b/34be574b1ec997247796e5d516f3a6b6509c4e064f2885a96ed885ce7579/requests-2.12.4.tar.gz#md5=acdb48888a9d3c7309da12fc7f83fedb"
    sha256 "ed98431a0631e309bb4b63c81d561c1654822cb103de1ac7b47e45c26be7ae34"
  end

  def install
    
    resource("requests").stage { system "python", *Language::Python.setup_install_args(libexec/"vendor") }
    
    inreplace "prh.py", "config_file_path", "#{etc}"
    mv "prh.py", "prh"
    bin.install "prh"

    begin
      cp "/usr/local/etc/prh_config.py.default", "/usr/local/etc/prh_config.py"
    rescue
    end

  end

  
end
