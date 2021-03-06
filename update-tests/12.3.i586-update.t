repo @System 0 testtags 12.3-i586-system.repo.gz

repo factory 0 solv ../trees/openSUSE:@PROJ@-standard-i586.solv
repo nonoss 0 solv ../trees/openSUSE:@PROJ@:NonFree-standard-i586.solv

system i586 rpm @System

namespace namespace:language(de_DE) @SYSTEM
namespace namespace:language(de) @SYSTEM

# DROPS
job erase name libdb-4_5-devel
job erase name krb5-mini
job erase name krb5-mini-devel
job erase name log4j-mini
job erase name libibus-1_0-0

job distupgrade all packages
