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
enable_desc=0
description=""
function get_user_func {
        #echo "<?include('$i');echo '#####';print_r(get_defined_vars());?>"|php5
    echo "<?
    function test(){
    ob_start();
    include('$file');
    ob_end_clean();
    \$a=get_defined_functions();
    return \$a['user'];
    }
    //test();
    //ob_start();
    //include('$file');
    //ob_end_clean();
    //\$a=get_defined_functions();
    //\$a=\$a['user'];
    \$a=test();
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
for arg in $*
do
    if [ $enable_desc -eq 1 ]
    then
        description=`cat $arg`
        enable_desc=0
    fi
    if [ $arg == '--exvars' ]
    then
        exvars=1
    elif [ $arg == '--exfuncs' ]
    then
        exfuncs=1
    elif [ $arg == '--allfuncs' ]
    then
        allfuncs=1
    elif [ $arg == '--desc' ]
    then
        enable_desc=1
    fi
done
echo "<!doctype html><html><head><title>Documentation</title><style>"
cat bootstrap.css
echo "</style><script>"
cat jquery.js
echo "</script><script>"
cat bootstrap.js
echo "</script></head><body><div class='container'>"
#if [ $description != "" ]
if [ "$description" != "" ]
then
    echo "<h1>Description</h1>"
    echo $description
    echo "<hr />"
fi
for file in `find $1 -name '*.php'`
do
    echo '<h2>'$file'</h2>'
    if [ $exfuncs -eq 0 ]
    then
        echo '<h3>User functions</h3>'
        get_user_func $file
    fi
    echo '<h3>Included files</h3>'
    get_included_files $file
    echo '<h3>Constants</h3>'
    get_constants $file
    if [ $allfuncs -eq 1 ]
    then
        echo '<h3>All functions</h3>'
        get_all_func $file
    fi
    echo "<hr />"
done
echo "</div></body></html>"
