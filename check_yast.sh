# check if our copy is valid
svn cat http://svn.opensuse.org/svn/yast/trunk/extra-packages > yast_packs.rec

ret=0
archs=$2
test -n "$archs" || archs="__x86_64__ __i386__"

(
for i in $archs; do
  cpp -E -U__i386__ -U__x86_64__ -Ulinux -D$i yast_packs.rec  | grep -v '^#' | grep -v '^ '
done
) | sort -u | sed -e "s,:, ," > yast.list
cat yast.list | while read yast pack; do
  if grep -qx "$yast" $1; then
     if ! grep -qx "$pack" $1; then
        echo "$1: Yast module $yast needs $pack"
        ret=1
     fi
  fi
done

rm yast_packs.rec
rm yast.list

exit $ret