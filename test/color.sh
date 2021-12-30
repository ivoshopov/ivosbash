
set -e

echo "Testing color.sh"
source ~/.local/bin/color.sh
[ "$txtblk" = '\e[0;30m' ]
