echo "MKDIR .JAVA"
mkdir /root/.java
mkdir /root/.java/.userPrefs
mkdir /root/.java/.userPrefs/burp
echo "where is ./PREFS"
sudo find  / -name  prefs.xml -printf "%T+\t%p\n" | sort 
cp /home/admin/prefs.xml  /root/.java/.userPrefs/burp/prefs.xml
ls -la /home/admin/prefs.xml
cd /home/tester/sources/
cp -r /home/tester/sources/extensions /root/.java/.userPrefs/burp
chmod 777 burp-rest-api.sh
cp /home/tester/sources/prefs.xml /root/.java/.userPrefs/burp
ls -l
if test -z "$ENV_MEM_JVM"; then
    ENV_MEM_JVM=1024m
fi
echo "[+] JVM Mem: ${ENV_MEM_JVM}"
pwd
# uncomment to halt docker steps and leave running -->tail -F /dev/null
if [ "$ENV_BURP_PRO" -eq "1" ]; then
    echo "[+] Running Burp 1"
#    java --patch-module burp.StartBurp=decoder.jar -jar burpsuite_pro_v1.7.32.jar 
#    java -Xbootclasspath/p:decoder.jar -jar burpsuite_pro_v1.7.32.jar 
#    ./burp-rest-api.sh --headless.mode=false --address=0.0.0.0 --port=8090  --unpause-spider-and-scanner --config-file="burpsettings.json"
#    java -jar -Xmx${ENV_MEM_JVM} /home/tester/sources/burp-rest-api-2.0.1.jar --address=0.0.0.0 --port=8090  --headless.mode=false --unpause-spider-and-scanner --burp.jar=/home/tester/sources/burp_pro.jar 
#    java -jar -Xmx${ENV_MEM_JVM} -Djava.awt.headless=true /home/tester/sources/burp_pro.jar  --project-file="rabbit.burp"
else
    echo "[+] Running Burp 0"
#    java -jar -Xmx${ENV_MEM_JVM} /home/tester/sources/burp-rest-api-2.0.1.jar --address=0.0.0.0 --port=8090 --headless.mode=false --unpause-spider-and-scanner --burp.jar=/home/tester/sources/burp_pro.jar 
#  java -jar -Xmx${ENV_MEM_JVM}  /home/tester/sources/burp_free.jar
fi
