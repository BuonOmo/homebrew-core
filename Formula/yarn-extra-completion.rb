class YarnExtraCompletion < Formula
  desc "Zsh extra completion for Yarn add, run, and remove subcommands"
  homepage "https://github.com/BuonOmo/yarn-extra-completion"
  url "https://github.com/BuonOmo/yarn-extra-completion/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "dfb96f6327d3e8575655c3951629852a46e4c9081ec80dce3e1e540d20f2030b"
  license "MIT"
  head "https://github.com/BuonOmo/yarn-extra-completion.git", branch: "main"

  depends_on "jq"
  depends_on "yarn"
  depends_on "zsh"

  def install
    zsh_completion.install "yarn-extra-completion.plugin.zsh" => "_yarn_extra"
  end

  test do
    (testpath/"test.zsh").write <<~EOS
      autoload _yarn_extra
      which _yarn_extra
    EOS
    assert_match(/^_yarn_extra/, shell_output("zsh test.zsh"))
  end
end
