#   Bash functions I don't use right now, but may need one day.

#   `slowerthan MS CMD` (MS must be range 0-999) returns 1 if CMD takes
#   longer than MS seconds to run, including the time to start a new bash
#   process. All CMD output is suppressed and errors are ignored.
slowerthan() {
    local ms="$1"; shift
    local command="$*"; shift
    local t=$(TIMEFORMAT='%3R';
        time (bash -c "$command; exit 0" >/dev/null 2>&1) 2>&1)
    local secs=${t%%.*} millis=${t##*.}
    #echo "$command s=$secs ms=$millis > $ms ?"
    [[ $secs -gt 0 || $millis -gt $ms ]] && return 1
    return 0
}
