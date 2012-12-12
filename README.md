#Description
yasg (Yet another site generator) is a simple document generator which generates a html document for your project in PHP.
##Installation
<code>
./configure</code>
##Options
<code>
./generate [directory]  
./generate [directory] -desc [discription file]  
./generate [directory] --allfuncs  
./generate [directory] --exvars  
./generate [directory] --exfuncs  
./generate [directory] --exfuncs --allfuncs  
./generate [directory] -o [html file name]  
</code>
##Example
<code>
./generate /var/www/mockstock --desc description.txt --exfuncs --allfuncs -o mockstock.doc.htm</code>
