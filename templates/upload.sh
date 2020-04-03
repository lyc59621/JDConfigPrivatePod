#!/bin/bash

Cyan='\033[0;36m'
Default='\033[0;m'

podSpecName=""
podVersionName=""
confirmed="n"
confirmed1=""
VersionString = ""
podspecTag = ""


getPodspecName() {
    read -p "Enter Podspec Name: " podSpecName

    if test -z "$podSpecName"; then
        podSpecName
    fi
}
getPodspecVersion() {
    read -p "Enter Podspec Version: " podVersionName

    if test -z "$podVersionName"; then
        podVersionName
    fi
}
getPodspecTag() {
    read -p "Enter new tag: " podspecTag

    if test -z "$podspecTag"; then
        podspecTag
    fi
}


getInfomation() {
    getPodspecName
    getPodspecTag
    echo -e "\n${Default}================================================"
    echo -e "  Podspec Name  :  ${Cyan}${podSpecName}.podspec${Default}"
    echo -e "  Project tag    :  ${Cyan}${podspecTag}${Default}"

    echo -e "================================================\n"
}
#用户判断
echo -e "\n"
while [ "$confirmed" != "y" -a "$confirmed" != "Y" ]
do
    if [ "$confirmed" == "n" -o "$confirmed" == "N" ]; then
        getInfomation
    fi
    read -p "confirm? (y/n):" confirmed
done



VersionString=`grep -E 's.version.*=' ${podSpecName}.podspec`

echo -e "\n${Default}================================================"
echo -e "  Podspec Version  :  ${Cyan}$VersionString${Default}"
echo -e "================================================\n"

#用户判断
echo -e "\n"
while [ "$confirmed1" != "y" -a "$confirmed1" != "Y" ]
do

#    if [ "$confirmed1" == "n" -o "$confirmed1" == "N" ]; then
#        getPodspecVersion
#    fi
    read -p "confirm? (y/n):" confirmed1
done








#VersionNumber=`tr -cd 0-9 <<<"$VersionString"`
#NewVersionNumber=$(($VersionNumber + 1))
#LineNumber="grep -nE 's.version.*=' ${podSpecName}.podspec | cut -d : -f1"
#sed -i "" "${LineNumber}s/${VersionNumber}/${NewVersionNumber}/g" ${podSpecName}.podspec

#echo "current version is ${VersionNumber}, new version is ${NewVersionNumber}"
echo "current version is ${VersionString}"

git stash
git pull origin master --tags
git stash pop

git add .
git commit -a -m "${VersionString}"
git tag "${podspecTag}" -m "${VersionString}"
git push --tags
git push origin master
set the new version to ${podspecTag}
set the new tag to ${podspecTag}

cd ~/.cocoapods/repos/JDConfigPrivatePod && git pull origin master && cd - && pod repo push JDConfigPrivatePod ${podSpecName}.podspec --verbose --allow-warnings --use-libraries


