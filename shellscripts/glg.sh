echo "****Get URL of LOGO, specify date as YYMMDD. Return the latest otherwise.****"
if [ -n "$1" ]; then
    target=$1
else
    target="yesterday"
fi
echo "Getting LOGO on $target"
month=$(date -d "${target}" +%m)
year=$(date -d "${target}" +%y)
day=$(date -d "${target}" +%d)
dow=$(date -d "${target}" +%a)
declare -A weekdays
weekdays=( ["mån"]="mo" ["tis"]="di" ["ons"]="mi" ["tor"]="do" ["fre"]="fr" ["lör"]="sa" ["sön"]="so" )
#echo ${weekdays[${dow}]}
URL="https://downloadzdf-a.akamaihd.net/mp4/zdf/$year/$month/${year}${month}${day}_${weekdays[${dow}]}_neu_lot/2/${year}${month}${day}_${weekdays[${dow}]}_neu_lot_3296k_p15v14.mp4"
echo $URL
ok=$(curl -I $URL 2>/dev/null | head -n 1 | cut -d$' ' -f2)
if [[ "$ok" -eq "200" ]];
then
    google-chrome --new-window "$URL"
fi

