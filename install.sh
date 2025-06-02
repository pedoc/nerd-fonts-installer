#!/bin/bash
# Select the Nerd Font from https://www.nerdfonts.com/font-downloads
# Testing with ShellCheck

echo "[-] Download The Nerd fonts [-]"
echo "#######################"
echo "Select Nerd Font"
fons_list=("0xProto" "3270" "AdwaitaMono" "Agave" "AnonymousPro" "Arimo" "AtkinsonHyperlegibleMono" "AurulentSansMono" "BigBlueTerminal" "BitstreamVeraSansMono" "CascadiaCode" "CascadiaMono" "CodeNewRoman" "ComicShannsMono" "CommitMono" "Cousine" "D2Coding" "DaddyTimeMono" "DejaVuSansMono" "DepartureMono" "DroidSansMono" "EnvyCodeR" "FantasqueSansMono" "FiraCode" "FiraMono" "FontPatcher" "GeistMono" "Go-Mono" "Gohu" "Hack" "Hasklig" "HeavyData" "Hermit" "iA-Writer" "IBMPlexMono" "Inconsolata" "InconsolataGo" "InconsolataLGC" "IntelOneMono" "Iosevka" "IosevkaTerm" "IosevkaTermSlab" "JetBrainsMono" "Lekton" "LiberationMono" "Lilex" "MartianMono" "Meslo" "Monaspace" "Monofur" "Monoid" "Mononoki" "MPlus" "NerdFontsSymbolsOnly" "Noto" "OpenDyslexic" "Overpass" "ProFont" "ProggyClean" "Recursive" "RobotoMono" "ShareTechMono" "SourceCodePro" "SpaceMono" "Terminus" "Tinos" "Ubuntu" "UbuntuMono" "UbuntuSans" "VictorMono" "ZedMono")
PS3="Enter a number: "
select font_name in "${fons_list[@]}" "Quit";
 do

    if [ -n "$font_name" ]; then
        
        echo "Starting download $font_name nerd font"
        
        if [ "$(command -v curl)" ]; then
            echo "https://gh-proxy.com/https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
            curl -OL "https://gh-proxy.com/https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
            echo "creating fonts folder: ${HOME}/.fonts"
            mkdir -p  "$HOME/.fonts"
            echo "unzip the $font_name.zip"
            unzip "$font_name.zip" -d "$HOME/.fonts/$font_name/"
            fc-cache -fv
            echo "done!"     
            break

        elif [ "$(command -v wget)" ]; then
            echo "https://gh-proxy.com/https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
            wget "https://gh-proxy.com/https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
            echo "creating fonts folder: ${HOME}/.fonts"
            mkdir -p  "$HOME/.fonts"
            echo "unzip the $font_name.zip"
            unzip "$font_name.zip" -d "$HOME/.fonts/$font_name/"
            fc-cache -fv
            echo "done!"
            break

        else
            
            echo "We cannot find the curl and wget command. First, install the curl and wget command, one of them."
            break
        
        fi

    else
        
        echo "Select the vaild $font_name nerd Font, just type number"
        continue;

    fi
done
