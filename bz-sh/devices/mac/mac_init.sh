[ -f "$DOTFILES/bz-sh/devices/mac/mac_init.prv.sh" ] &&
    source "$DOTFILES/bz-sh/devices/mac/mac_init.prv.sh"

fcopy() {
    # Ensure a file path was provided
    if [ -z "$1" ]; then
        echo "Usage: $0 /path/to/file"
        exit 1
    fi

    # Get the absolute path of the file
    ABS_PATH=$(
        cd "$(dirname "$1")" && pwd
    )/$(basename "$1")

    # Verify the file actually exists
    if [ ! -f "$ABS_PATH" ] && [ ! -d "$ABS_PATH" ]; then
        echo "Error: File or directory does not exist."
        exit 1
    fi

    # Copy the actual file to the macOS clipboard
    osascript -e "set the clipboard to POSIX file \"$ABS_PATH\""

    echo "Successfully copied to clipboard: $(basename "$ABS_PATH")"

}
