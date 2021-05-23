#/bin/sh
############################################################
# PRE REQUISITES ASSURANCE                                 #
############################################################
if ! type 7z >/dev/null
then
    # Install 7z if its not exists.
    apk add --update p7zip
fi

############################################################
# SCRIPT ARGUMENTS                                         #
############################################################
release_version=${1:-1.0.0}

############################################################
# SCRIPT EXECUTION                                         #
############################################################
cd ./icons
7z a -t7z ../ds-icons-${release_version}.7z -x!3DS*.png
7z a -t7z ../3ds-icons-${release_version}.7z 0000.png 3DS*.png
