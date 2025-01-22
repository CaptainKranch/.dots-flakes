# Nushell Config File
#
# version = 0.81.1

# let's define some colors

# https://github.com/catppuccin/i3/blob/main/themes/catppuccin-mocha
let rosewater = "#dc8a78"
let flamingo  = "#dd7878"
let pink      = "#ea76cb"
let mauve     = "#8839ef"
let red       = "#d20f39"
let maroon    = "#e64553"
let peach     = "#fe640b"
let yellow    = "#df8e1d"
let green     = "#40a02b"
let teal      = "#179299"
let sky       = "#04a5e5"
let sapphire  = "#209fb5"
let blue      = "#1e66f5"
let lavender  = "#7287fd"
let text      = "#4c4f69"
let subtext1  = "#5c5f77"
let subtext0  = "#6c6f85"
let overlay2  = "#7c7f93"
let overlay1  = "#8c8fa1"
let overlay0  = "#9ca0b0"
let surface2  = "#acb0be"
let surface1  = "#bcc0cc"
let surface0  = "#ccd0da"
let base      = "#eff1f5"
let mantle    = "#e6e9ef"
let crust     = "#dce0e8"
# we're creating a theme here that uses the colors we defined above.

let catppuccin_theme = {
    separator: $overlay2
    leading_trailing_space_bg: $surface2
    header: $red
    date: $pink
    filesize: $green
    row_index: $text
    bool: $peach
    int: $red
    duration: $sky
    range: $sapphire
    float: $lavender
    string: $text
    nothing: $overlay1
    binary: $subtext1
    cellpath: $subtext0
    hints: dark_gray

    shape_garbage: { fg: $overlay2 bg: $red attr: b}
    shape_bool: $maroon
    shape_int: { fg: $pink attr: b}
    shape_float: { fg: $pink attr: b}
    shape_range: { fg: $overlay0 attr: b}
    shape_internalcall: { fg: $maroon attr: b}
    shape_external: $mauve
    shape_externalarg: { fg: $red attr: b}
    shape_literal: $flamingo
    shape_operator: $rosewater
    shape_signature: { fg: $red attr: b}
    shape_string: $red
    shape_filepath: $peach
    shape_globpattern: { fg: $teal attr: b}
    shape_variable: $pink
    shape_flag: { fg: $mauve attr: b}
    shape_custom: {attr: b}
}

# The default config record. This is where much of your global configuration is setup.
$env.config = {
  color_config: $catppuccin_theme  # <-- this is the theme
  use_ansi_coloring: true

  # true or false to enable or disable the welcome banner at startup
  show_banner: false
  
  table: {
    mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
    index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
    show_empty: true # show 'empty list' and 'empty record' placeholders for command output
    trim: {
      methodology: wrapping # wrapping or truncating
      wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
      truncating_suffix: "..." # A suffix used by the 'truncating' methodology
    }
  }

  completions: {
    case_sensitive: false # set to true to enable case-sensitive completions
    quick: true  # set this to false to prevent auto-selecting completions when only one remains
    partial: true  # set this to false to prevent partial filling of the prompt
    algorithm: "prefix"  # prefix or fuzzy
    external: {
      enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up may be very slow
      max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
      completer: null # check 'carapace_completer' above as an example
    }
  }
  filesize: {
    metric: true # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
    format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, zb, zib, auto
  }
  cursor_shape: {
    emacs: line # block, underscore, line, blink_block, blink_underscore, blink_line (line is the default)
    vi_insert: block # block, underscore, line , blink_block, blink_underscore, blink_line (block is the default)
    vi_normal: underscore # block, underscore, line, blink_block, blink_underscore, blink_line (underscore is the default)
  }
  footer_mode: "auto" # always, never, number_of_rows, auto
  float_precision: 2 # the precision for displaying floats in tables
  # buffer_editor: "emacs" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
  bracketed_paste: true # enable bracketed paste, currently useless on windows
  edit_mode: emacs # emacs, vi
}

# Alliases
alias ll = ls -l
alias k = kubectl
