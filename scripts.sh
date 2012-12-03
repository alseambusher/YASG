#!/bin/bash
#get all variables
#echo variables
#cat index.php |grep '\$[^\(^_]'
#echo superglobals
#get supeglobals
#cat index.php |grep '\$_'
#TODO fix this
for i in `ls *.php`
do
    #echo "<?include('$i');echo '#####';print_r(get_defined_vars());?>"|php5
    echo "<?include('$i');echo '#####';\$a=get_defined_functions();print_r(\$a['user']);?>"|php5
done
