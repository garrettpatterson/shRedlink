. redlink.conf

#echo $USERNAME
#echo $PASSWORD

if [ ! -f tempdata.log ] 
	then curl -sL -c cookie-jar.txt --data "UserName=$USERNAME&Password=$PASSWORD&timeOffset=420" https://mytotalconnectcomfort.com/portal/  | grep -o "[A-Za-z]\{1,\}, [0-9]\{2,3\}\.[0-9]\{4\}" | awk -F", " '{print $1}' | tr -s '\n' '\t' | awk -F "" '{print "timestamp\t"$0}' > tempdata.log ;
fi

curl -sL -c cookie-jar.txt --data "UserName=$USERNAME&Password=$PASSWORD&timeOffset=420" https://mytotalconnectcomfort.com/portal/  | grep -o "[A-Za-z]\{1,\}, [0-9]\{2,3\}\.[0-9]\{4\}" | awk -F", " '{print $2}' | tr -s '\n' '\t' | awk -F "" -v d=$(date +%s) '{print d"\t"$0}' >> tempdata.log
  
