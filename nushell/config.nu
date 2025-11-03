# config.nu
#
# Installed by:
# version = "0.108.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

#   -------------------------------
#   ENVIRONMENT CONFIGURATION
#   -------------------------------
$env.PATH ++= ['/opt/homebrew/bin/']
$env.config.buffer_editor = "code"
$env.config.render_right_prompt_on_last_line = true

#   -----------------------------
#   IMPROVE TERMINAL EXPERIENCE
#   -----------------------------

# Ensure the vendor dir exists
mkdir ($nu.data-dir | path join "vendor/autoload")

# starship
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# carapace
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
carapace _carapace nushell | save -f ($nu.data-dir | path join "vendor/autoload/carapace.nu")

#   -----------------------------
#   ALIAS / COMMAND HELPERS
#   -----------------------------

# Running system/external commands
alias nu-open = open
alias open = ^open

# Simple command wrappers
alias cp = cp -iv
alias mv = mv -iv
alias mkdir = mkdir -v
alias ll = ls -lt
alias la = ls -la
alias .. = cd ..
alias ... = cd ../..
alias f = open -a Finder .
alias x = exit
alias c = clear
alias k = kubectl

# Git helpers
alias g = git
alias gl = git pull
alias gpr = git pull --rebase
alias ga = git add
alias gaa = git add --all
alias gc = git commit
alias gcm = git commit -m
alias gp = git push

# Get current git branch or short SHA if in detached HEAD
def git-current-branch [] {
    let branch = (git rev-parse --abbrev-ref HEAD | str trim)
    if $branch == "HEAD" {
        git rev-parse --short HEAD | str trim
    } else {
        $branch
    }
}

# Clean local branches gone on remote
def git-clean-local-branch [] {
  git fetch -p

  let gone_branches = (
    git branch -vv
    | lines
    | where {|line| $line =~ ": gone]" }
    | each {|line| $line | split row " " | first | str trim "*" | str trim }
  )

  if ($gone_branches | is-empty) {
    print "✅ No gone branches to delete."
  } else {
    print "🧹 Found gone branches:"
    $gone_branches | each {|b| print $"  - ($b)" }

    let confirm = (input "Delete these branches? (y/N): ")
    if ($confirm | str downcase) == "y" {
      $gone_branches | each {|b| git branch -D $b }
    } else {
      print "❌ Aborted."
    }
  }
}

# Line count of tracked files in current git repo
def gloc [] { 
    git ls-files | xargs wc -l 
}

# Go helpers
alias gog = go get ./...
alias gob = go build
alias got = go test ./...
alias gor = go run

# Kubectl helpers
alias k = kubectl

# Move files to macOS Trash (handles multiple args)
def trash [...files] {
  for f in $files { mv $f ~/.Trash }
}

# Docker cleanup
def dc [] { 
    docker system prune -af --volumes 
}

# Sonar helpers
def sonar-cloud-scan [] {
    if ("sonar-project.properties" | path exists ) {
        sonar-scanner -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=""
    } else {
        print "sonar-project.properties not found"
    }
}
