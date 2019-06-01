workflow "New workflow" {
  on = "release"
  resolves = ["Homebrew bump formula pr"]
}

action "Homebrew bump formula pr" {
  uses = "./"
}
