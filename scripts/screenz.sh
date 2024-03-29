#!/bin/bash

# { FONCTION TO CHECK THE INITIALIZATION } #

function check_init() {
    count=0
    if [[ ! -e /usr/bin/xrandr ]]; then
        echo -e "You must install 'xrandr' to use this command."
        exit 84
    fi
    while read lines || [[ -n "$lines" ]]; do
      if [[ $count == 1 ]] && [[ -z $lines ]]; then
          echo "the position of your production in relation to your computer is not notified, make a 'screenz -i' to notify it"
          exit 84
      fi
      ((count++))
    done < ~/.screenz
    if [[ count -ne 2 ]]; then
        rm -f ~/.screenz
        echo "Error config file make a 'screenz -i'."
        exit 84
    fi
}
# {FUNCTION FOR PRINT THE INFO (-H)} #

function help() {
    echo -e "\n\e[1mNAME\e[0m"
    echo -e "\tscreenz - set the orientation or output to configuring multiple monitors"
    echo -e ""
    echo -e "\e[1mSYNOPSIS\e[0m"
    echo -e "\tscreenz [OPTIONS]"
    echo -e ""
    echo -e "\e[1mDESCRIPTION\e[0m"
    echo -e ""
    echo -e "\e[1mOPTIONS\e[0m"
    echo -e "\t-h\tPrint the different information of this programme."
    echo -e "\t-i\tInitialize information to set the program."
    echo -e "\t-p\tAutomatic connection if there is an output."
    echo -e "\t-c\tChoose the output you want."
    echo -e ""
    echo -e "\e[1mRETURN VALUE\e[0m"
    echo -e "\tOn success, screenz return 0."
    echo -e "\tOn error, screenz return 84."
    echo -e ""
    echo -e "\e[1mOTHER\e[0m"
    echo -e "\tThis application generates a hidden file to run."
    echo -e "\t\t'.screenz' is a hidden file that contains your parameters (do not modify)."
    echo -e ""
}
# {FUNCTION TO INITIALIZED THE PROGRAM (-I)} #

function init() {
    while [[ 1 ]]; do
        printf "Where is the position of your output relative to your computer? (left-of/right-of/above/below): "
        read answer
        if [[ $answer == "left-of" ]] || [[ $answer == "right-of" ]] || [[ $answer == "above" ]] || [[ $answer == "below" ]]; then
            if [[ ! -e ~/.screenz ]]; then
                echo -e "\n" >> ~/.screenz
            fi
            sed -i '2d' ~/.screenz
            sed -i 1a"$answer" ~/.screenz
            break
        else
            echo "Invalid answer"
        fi
    done
    if [[ ! -e /usr/bin/screenz ]]; then
        while [[ 1 ]]; do
            printf "You want to add 'screenz' in your system command ? (y/N): "
            read answer
            if [[ $answer == "y" ]]; then
                sudo cp -f screenz /usr/bin/
                break
            elif [[ $answer == "N" ]]; then
                break
            else
                echo "Invalid answer"
            fi
        done
    fi
}
# {FUNCTION FOR AUTOMATIC CONNECTION (-P)} #

function auto () {
    nb=0
    count=0
    countw=0
    defaultscrenz="-1"
    rm -f ~/.temp
    while [[ 1 ]]; do
        xrandr --current >> ~/.temp
        if [[ -e ~/.screenz ]]; then
            while read lines || [[ -n "$lines" ]]; do
                if [[ $countw == 0 ]] && [[ -n $lines ]]; then
                    screenz=$lines
                elif [[ $countw == 1 ]] && [[ -n $lines ]]; then
                    position=$lines
                fi
                ((countw++))
            done < ~/.screenz
            countw=0
            if [[ $count < 1 ]] && [[ $screenz != "" ]] && [[ $screenz != "\0" ]]; then
                ((count++))
            fi
        fi
        while read lines || [[ -n "$lines" ]]; do
            tab=($lines)
            if [[ ${tab[1]} == "connected" ]] && [[ $nb == 0 ]]; then
                defaultscrenz=${tab[0]}
                ((nb++))
            elif [[ ${tab[0]} != $defaultscrenz ]] && [[ ${tab[1]} == "connected" ]] && [[ ${tab[0]} != $screenz ]] && [[ $nb == 1 ]]; then
                sed -i '1d' ~/.screenz
                sed -i 1i"${tab[0]}" ~/.screenz
                xrandr --output ${tab[0]} --auto --$position $defaultscrenz
                if [[ ! -e /usr/bin/wzpaper ]]; then
                    killall wzpaper > /dev/null 2>&1
                    wzpaper -p 0.25
                fi
                count=0
            elif [[ ${tab[0]} == "$screenz" ]] && [[ ${tab[1]} == "disconnected" ]]; then
                xrandr --output ${tab[0]} --off
                sed -i '1d' ~/.screenz
                sed -i 1i'\ \' ~/.screenz
                screenz="\0"
                count=0
            fi
        done < ~/.temp
    rm -f ~/.temp
    sleep 1s
    done
}
# {FUNCTION FOR CHOICE YOUR SCREEN (-C)} #

function choise() {
    nb=0
    count=0
    defaultscrenz="-1"
    while read lines || [[ -n "$lines" ]]; do
      tab=($lines)
      if [[ ${tab[1]} == "connected" ]] && [[ $nb == 0 ]]; then
          defaultscrenz=${tab[0]}
          ((nb++))
      elif [[ ${tab[0]} != $defaultscrenz ]] && [[ ${tab[1]} == "connected" ]] && [[ $nb == 1 ]]; then
          echo -e "connected output\n"
          echo -e "\t${tab[0]}"
          lib+=( ${tab[0]} )
          ((nb++))
      elif [[ ${tab[0]} != $defaultscrenz ]] && [[ ${tab[1]} == "connected" ]]; then
          echo -e "\t${tab[0]}"
          lib+=( ${tab[0]} )
          ((nb++))
      elif [[ ! -n "$lines" ]] && [[ $nb == 1 ]]; then
          echo -e "no output connected."
          exit 84
      fi
    done < ~/.temp
    if [[ $nb == 1 ]]; then
       echo -e "no output connected."
       exit 84 
    fi
    rm -f ~/.temp
    while [[ 1 ]]; do
        printf "\nwhich output do you want ? : "
        read answer
        for (( i = 0; i < $nb; i++ )); do
            if [[ $answer == ${lib[i]} ]]; then
                while [[ 1 ]]; do
                    printf "what position relative to the main screen? (left-of/right-of/above/below): "
                    read answer
                    if [[ $answer == "left-of" ]] || [[ $answer == "right-of" ]] || [[ $answer == "above" ]] || [[ $answer == "below" ]]; then
                        xrandr --output ${lib[i]} --auto --$answer $defaultscrenz
                        echo -e "${lib[i]} is on the $answer side of your main screen"
                        if [[ ! -e /usr/bin/wzpaper ]]; then
                            killall wzpaper > /dev/null 2>&1
                            wzpaper -p 0.25
                        fi
                        exit 0
                    else
                        echo "Invalid answer."
                    fi
                done
            fi
            ((count++))
        done
        if [[ $nb == $count ]]; then
            echo "Invalid output."
        fi
    done
}
# {SWITCH CASE} #

xrandr --current >> ~/.temp
IFS=" "

case $1 in
      "-h" | "--help")
          help
          exit 0
          ;;
      "-i")
          init
          exit 0
          ;;
      "-p")
          check_init
          auto &
          ;;
      "-c")
          check_init
          choise
          ;;
      *)
          if [[ -z $1 ]]; then
              echo "screenz: invalid argument."
          else
              echo "screenz: invalid option - '$1'"
          fi
          echo "Try 'screenz -h' for more information."
          exit 84
          ;;
esac
exit 0

