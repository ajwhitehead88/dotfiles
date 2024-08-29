bemenu_components=(
  "-i"
  "-l 10"
  "-W 0.25"
  "-c"
  "--prompt ''"
  "--fn 'pango:Roboto 11'"
  "--tb '#282828'"
  "--tf '#458588'"
  "--fb '#282828'"
  "--ff '#ebdbb2'"
  "--nb '#282828'"
  "--nf '#ebdbb2'"
  "--ab '#282828'"
  "--af '#ebdbb2'"
  "--sb '#83a598'"
  "--sf '#282828'"
  "--hb '#665c54'"
  "--hf '#ebdbb2'"
  "-B 2"
  "-R 2"
  "--bdr '#83a598'"
)

export BEMENU_OPTS=${(j: :)bemenu_components}
export BEMOJI_PICKER_CMD='bemenu -l 20'
