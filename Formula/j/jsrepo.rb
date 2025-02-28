class Jsrepo < Formula
  desc "Build and distribute your code"
  homepage "https://jsrepo.dev/"
  url "https://registry.npmjs.org/jsrepo/-/jsrepo-1.36.0.tgz"
  sha256 "780aae81814e5247809f5df7746450bfea7c8e45c6f12cabf3f54f70feff033a"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "98f22e15fb503b9935a7701b8f55deb8694d173a32d635f6c4dce25ffe044b73"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "98f22e15fb503b9935a7701b8f55deb8694d173a32d635f6c4dce25ffe044b73"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "98f22e15fb503b9935a7701b8f55deb8694d173a32d635f6c4dce25ffe044b73"
    sha256 cellar: :any_skip_relocation, sonoma:        "6cf39e78596b9612ccfeebc673fe8ff0a2bc24643379b84e7fd541e30f7cd5b3"
    sha256 cellar: :any_skip_relocation, ventura:       "6cf39e78596b9612ccfeebc673fe8ff0a2bc24643379b84e7fd541e30f7cd5b3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "98f22e15fb503b9935a7701b8f55deb8694d173a32d635f6c4dce25ffe044b73"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/jsrepo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jsrepo --version")

    system bin/"jsrepo", "build"
    assert_match "\"categories\": []", (testpath/"jsrepo-manifest.json").read
  end
end
