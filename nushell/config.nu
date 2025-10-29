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

$env.config.render_right_prompt_on_last_line = true

#   -------------------------------
#   ENVIRONMENT CONFIGURATION
#   -------------------------------


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
#   ALIAS
#   -----------------------------

# Generic
alias cp = cp -iv                          # Preferred 'cp' implementation