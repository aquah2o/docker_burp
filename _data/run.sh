echo "this is now"
mkdir /root/.java
mkdir /root/.java/.userPrefs
mkdir /root/.java/.userPrefs/burp
cp ./prefs.xml  /root/.java/.userPrefs/burp/prefs.xml
echo "this is it"
echo "cp /prefs.xml /root/.java/.userPrefs/burp/prefs.xml"
chmod 0444 /root/.java/.userPrefs/burp/prefs.xml
chattr +i /root/.java/.userPrefs/burp/prefs.xml
ls -la /root/.java/.userPrefs/burp/prefs.xml
if test -z "$ENV_MEM_JVM"; then
    ENV_MEM_JVM=1024m
fi
echo "[+] JVM Mem: ${ENV_MEM_JVM}"
if [ "$ENV_BURP_PRO" -eq "1" ]; then
    echo "[+] Running Burp 1
    sudo find  / -name  prefs.xml -printf "%T+\t%p\n" | sort

    java -jar -Xmx${ENV_MEM_JVM} /home/tester/sources/burp-rest-api-2.0.1.jar --address=0.0.0.0 --port=8090  --headless.mode=false --unpause-spider-and-scanner --burp.jar=/home/tester/sources/burp_pro.jar 
#    java -jar -Xmx${ENV_MEM_JVM} -Djava.awt.headless=true /home/tester/sources/burp_pro.jar  --project-file="rabbit.burp"
else
    echo "[+] Running Burp 0"
    java -jar -Xmx${ENV_MEM_JVM} /home/tester/sources/burp-rest-api-2.0.1.jar --address=0.0.0.0 --port=8090 --headless.mode=false --unpause-spider-and-scanner --burp.jar=/home/tester/sources/burp_pro.jar 
#  java -jar -Xmx${ENV_MEM_JVM}  /home/tester/sources/burp_free.jar
fi
