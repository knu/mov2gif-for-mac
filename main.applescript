on main(aFile)
    set command to POSIX path of (path to resource "mov2gif.sh")
    set gifPath to do shell script (quoted form of command) & space & (quoted form of POSIX path of aFile)
    if gifPath is not equal to "" then
        set gif to gifPath as POSIX file
        tell application "System Events"
            if exists gif then
                tell application "Finder" to reveal gif
            end if
        end tell
    end if
end main

on open argv
    repeat with aFile in argv
        main(aFile)
    end repeat
end open

on run
    main(choose file)
end run
