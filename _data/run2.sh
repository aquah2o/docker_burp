 
mkdir /root/.java
mkdir /root/.java/.userPrefs
mkdir /root/.java/.userPrefs/burp
ls -l
echo "THIS IS THE STUFF"
cp ./prefs.xml  /root/.java/.userPrefs/burp/prefs.xml
cp ./prefs.xml  /home/.java/.userPrefs/burp/prefs.xml
cp ./prefs.xml  /home/tester/.java/.userPrefs/burp/prefs.xml
ls -la /root/home/tester/.java/.userPrefs/burp/prefs.xml
ls -la /root/home/tester/.java/.userPrefs/burp/prefs.xml
if test -z "$ENV_MEM_JVM"; then
    ENV_MEM_JVM=1024m
fi
echo "[+] JVM Mem: ${ENV_MEM_JVM}"

if [ "$ENV_BURP_PRO" -eq "1" ]; then
    echo "[+] Running Burp Pro"
       java -jar -Xmx${ENV_MEM_JVM} /home/tester/sources/burp-rest-api-2.0.1.jar --address=0.0.0.0 --port=8090  --headless.mode=false --unpause-spider-and-scanner --burp.jar=/home/tester/sources/burp_pro.jar 
#    java -jar -Xmx${ENV_MEM_JVM}  /home/tester/sources/burp_pro.jar
else
    echo "[+] Running Burp Free"
    java -jar -Xmx${ENV_MEM_JVM} /home/tester/sources/burp-rest-api-2.0.1.jar --address=0.0.0.0 --port=8090  --headless.mode=false --unpause-spider-and-scanner --burp.jar=/home/tester/sources/burp_pro.jar 
#   java -jar -Xmx${ENV_MEM_JVM}  /home/tester/sources/burp_free.jar
fi
