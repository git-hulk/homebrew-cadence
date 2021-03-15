class Cadence < Formula
  desc "Fault-Tolerant Stateful Code Platform"
  homepage "https://https://cadenceworkflow.io/"
  url "https://github.com/uber/cadence.git",
      tag:      "v0.18.1",
      revision: "b6dfe37ebfec7742b1470be7129f07518e8bec98"
  license "MIT"

  bottle do
  end

  depends_on "go" => :build

  def install
    ENV["PATH"] = "#{ENV["PATH"]}:#{ENV["GOPATH"]}/bin"
    system "make", "cadence", "cadence-server", "cadence-canary", "cadence-sql-tool", "cadence-cassandra-tool"
    bin.install "cadence"
    bin.install "cadence-server"
    bin.install "cadence-canary"
    bin.install "cadence-sql-tool"
    bin.install "cadence-cassandra-tool"

    system "cp", "-r", "config", "#{etc}/cadence"
    system "cp", "-r", "schema", "#{etc}/cadence"
  end

  test do
    assert_match "cadence:",
      shell_output("#{bin}/cadence version")
  end
end
