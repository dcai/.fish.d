function fish_greeting --description Greeting
    if type -q fortune
        echo
        echo "=============== Quote Of The Day ==============="
        echo
        fortune -e tang300 song100
        echo
        echo "================================================"
        echo
    end
end
