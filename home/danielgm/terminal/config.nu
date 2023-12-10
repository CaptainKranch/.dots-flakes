# Nushell Config File
#
# version = 0.81.1

# let's define some colors

let strong    = "#7E8B7C"
let light     = "#D8DCD6"
let variable  = "#C5C592"

let text      = "#4A5249"
let subtext1  = "#424941"
let subtext0  = "#3B413A"
let overlay2  = "#343933"
let overlay1  = "#2C312C"
let overlay0  = "#252924"
let surface2  = "#1D211D"
let surface1  = "#161816"
let surface0  = "#161816"
let base      = "#0F100F"
let mantle    = "#0F100F"
let crust     = "#070807"

# we're creating a theme here that uses the colors we defined above.

let catppuccin_theme = {
    separator: $overlay2
    leading_trailing_space_bg: $surface2
    header: $strong
    date: $variable
    filesize: $variable
    row_index: $text
    bool: $variable
    int: $strong
    duration: $light
    range: $light
    float: $strong
    string: $text
    nothing: $overlay1
    binary: $subtext1
    cellpath: $subtext0
    hints: dark_gray

    shape_garbage: { fg: $overlay2 bg: $strong attr: b}
    shape_bool: $strong
    shape_int: { fg: $light attr: b}
    shape_float: { fg: $light attr: b}
    shape_range: { fg: $overlay0 attr: b}
    shape_internalcall: { fg: $strong attr: b}
    shape_external: $light
    shape_externalarg: { fg: $strong attr: b}
    shape_literal: $strong
    shape_operator: $variable
    shape_signature: { fg: $strong attr: b}
    shape_string: $strong
    shape_filepath: $light
    shape_globpattern: { fg: $light attr: b}
    shape_variable: $light
    shape_flag: { fg: $light attr: b}
    shape_custom: {attr: b}
}

# The default config record. This is where much of your global configuration is setup.

$env.config = {
  hooks: {
    pre_prompt: [{ ||
      if (which direnv | is-empty) {
        return
      }

      direnv export json | from json | default {} | load-env
    }]
  }
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
  use_grid_icons: true
  footer_mode: "25" # always, never, number_of_rows, auto
  float_precision: 2 # the precision for displaying floats in tables
  # buffer_editor: "emacs" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
  bracketed_paste: true # enable bracketed paste, currently useless on windows
  edit_mode: emacs # emacs, vi
  shell_integration: true # enables terminal markers and a workaround to arrow keys stop working issue
  render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.
}
