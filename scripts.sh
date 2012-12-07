#!/bin/bash
#get all variables
#echo variables
#cat index.php |grep '\$[^\(^_]'
#echo superglobals
#get supeglobals
#cat index.php |grep '\$_'
# --exclude vars,functions,classes,system vars,supergblobals
exvars=0
exfuncs=0
allfuncs=0
function get_user_func {
        #echo "<?include('$i');echo '#####';print_r(get_defined_vars());?>"|php5
    echo "<?
    ob_start();
    include('$file');
    ob_end_clean();
    \$a=get_defined_functions();
    \$a=\$a['user'];
    \$isempty=0;
    foreach(\$a as \$row){
        echo \$row.'<br>';
        \$isempty=1;
    }
    if(\$isempty==0)
        echo 'None';
    ?>"|php5 2>>yasg.log
    #TODO get all the functions,classes,user vars,superglobals
}
function get_all_func {
        #echo "<?include('$i');echo '#####';print_r(get_defined_vars());?>"|php5
    echo "<?ob_start();
    include('$file');
    ob_end_clean();
    foreach(get_defined_functions() as \$row){
    foreach(\$row as \$row2)
        echo \$row2.'<br>';
    }?>"|php5 2>>yasg.log
    #TODO get all the functions,classes,user vars,superglobals
}
function get_included_files {
    echo "<? ob_start();
    include('$file');
    ob_end_clean();
    foreach(get_included_files() as \$row){
        echo \$row.'<br>';
    }?>"|php5 2>>yasg.log
}
function get_constants {
    echo "<?
    ob_start();
    include('$file');
    ob_end_clean();
    \$a=get_defined_constants();
    if(isset(\$a['user']))
    \$a=\$a['user'];
    else
    \$a=array();
    \$isempty=0;
    foreach(\$a as \$row){
        echo \$row.'<br>';
        \$isempty=1;
    }
    if(\$isempty==0)
        echo 'None';
    ?>"|php5 2>>yasg.log
   
}
