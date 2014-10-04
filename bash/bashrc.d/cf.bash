# Count files
cf() {
    local dir

    # Specify directory to check
    dir=${1:-$PWD}

    # Error conditions
    if [[ ! -e $dir ]] ; then
        printf 'bash: cf: %s does not exist\n' "$dir" >&2
        return 1
    elif [[ ! -d $dir ]] ; then
        printf 'bash: cf: %s is not a directory\n' "$dir" >&2
        return 1
    elif [[ ! -r $dir ]] ; then
        printf 'bash: cf: %s is not readable\n' "$dir" >&2
        return 1
    fi

    # Count files and print; use a subshell so options are unaffected
    (
        declare -a files
        shopt -s dotglob nullglob
        files=("$dir"/*)
        printf '%d\t%s\n' "${#files[@]}" "$dir"
    )
}

