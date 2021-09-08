set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx HOMEBREW_CURLRC 1

if [ (arch) = arm64 ]
    if test -f /opt/homebrew/bin/brew
        eval (/opt/homebrew/bin/brew shellenv)
    end
else
    if test -f /usr/local/bin/brew
        eval (/usr/local/bin/brew shellenv)
    end
end

add_paths \
    /opt/homebrew/bin \
    /usr/local/opt/mysql-client/bin \
    /usr/local/opt/openjdk/bin \
    /opt/homebrew/opt/mysql-client/bin \
    /opt/homebrew/opt/openjdk/bin \
    ~/Library/Python/2.7/bin \
    ~/Library/Python/3.6/bin \
    ~/Library/Python/3.7/bin \
    ~/Library/Python/3.8/bin \
    ~/Library/Python/3.9/bin
