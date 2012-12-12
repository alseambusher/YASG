#Description
yasg (Yet another site generator) is a simple document generator which generates a html document for your project in PHP.
##Installation
For partial Installation  
<code>
./configure</code>  
For full Installation  
<code>
./configure --all</code>  
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
If full installation is performed you can also convert to pdf  
<code>
./generate [directory] --pdf  
</code>
##Example
<code>
./generate /var/www/mockstock --desc description.txt --exfuncs --allfuncs -o mockstock.doc.htm</code>
