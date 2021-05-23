#/bin/sh
############################################################
# PRE REQUISITES ASSURANCE                                 #
############################################################
if ! type curl >/dev/null
then
    # Install curl if its not exists.
    apk add --update curl
fi

############################################################
# SCRIPT ARGUMENTS                                         #
############################################################
# 1 Argument: Nintendo DS System (DS or 3DS)
# 2 Argument: Last ID to fetch (DS: 6464 or 3DS: 1155)
ds_system=${1}
ds_system=`echo "${ds_system}" | tr [:lower:] [:upper:]`
if [[ "${ds_system}" == "3DS" ]]
then
    title_max=${2:-1155}
else
    ds_system=
    title_max=${2:-6464}
fi

############################################################
# SCRIPT EXECUTION                                         #
############################################################
# Downloads the default icon first.
if [[ ! -f "./icons/0000.png" ]]
then
    echo "Fetching: http://img.files-ds-scene.net/boxarts/0000.png"
    curl -fsS -o "./icons/0000.png" "http://img.files-ds-scene.net/boxarts/0000.png"
fi

# Iterates over all title IDs and try to download its icons.
title_id=1
while [[ "${title_id}" -le "${title_max}" ]]
do
    # Formatts the target title ID to use 4 digits.
    id=`printf %04d ${title_id}`
    if [[ ! -f "./icons/${ds_system}${id}.png" ]]
    then
        # Calculates icon pagination.
        ref_mult=`expr \( ${title_id} - 1 \) / 250`
        begin_id=`expr \( 250 \* ${ref_mult} \) + 1`
        end_id=`expr \( 1 + ${ref_mult} \) \* 250`

        # Formatts pagination IDs with the same 4 digits.
        begin=`printf %04g ${begin_id}`
        end=`printf %04g ${end_id}`

        echo "Fetching: http://img.files-ds-scene.net/boxarts/${ds_system}/${ds_system}${begin}-${end}/${ds_system}${id}.png"
        curl -fsS -o "./icons/${ds_system}${id}.png" "http://img.files-ds-scene.net/boxarts/${ds_system}/${ds_system}${begin}-${end}/${ds_system}${id}.png"
    fi
    title_id=`expr ${title_id} + 1`
done
