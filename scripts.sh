#!/bin/bash
#get all variables
#echo variables
#cat index.php |grep '\$[^\(^_]'
#echo superglobals
#get supeglobals
#cat index.php |grep '\$_'
# --exclude vars,functions,classes,system vars,supergblobals
#TODO fix this
for i in `ls *.php`
do
    #echo "<?include('$i');echo '#####';print_r(get_defined_vars());?>"|php5
    echo "<?ob_start();
    include('$i');
    ob_end_clean();
    \$a=get_defined_functions();
    print_r(\$a['user']);?>"|php5 2>/dev/null
    #TODO get all the functions,classes,user vars,superglobals
done
