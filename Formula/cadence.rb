class Cadence < Formula
  desc "Fault-Tolerant Stateful Code Platform"
  homepage "https://https://cadenceworkflow.io/"
  url "https://github.com/uber/cadence.git",
      tag:      "v0.18.1",
      revision: "b6dfe37ebfec7742b1470be7129f07518e8bec98"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, big_sur:       "d704170150cd3b76a02c5d8f7d34df4ff6aa8e417c4a60ab3112640ec7d12b74"
    sha256 cellar: :any_skip_relocation, catalina:      "8238c1c688e526f0b9e9ceeecc0cc2ecfa7809c920c13ac8d2b2a5371cf835d6"
    sha256 cellar: :any_skip_relocation, mojave:        "21c9776755923872d921bdc73158410a52eb4a5f537deda2428d3679be0016ea"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "cadence",  "cmd/tools/cli/main.go"
    bin.install "cadence"
  end

  test do
    assert_match "cadence:",
      shell_output("#{bin}/cadence version")
  end
end
