mkdir /root/.java
mkdir /root/.java/.userPrefs
mkdir /root/.java/.userPrefs/burp
ls -l
cp ./prefs.xml  /root/.java/.userPrefs/burp/prefs.xml
ls -la /root/home/tester/.java/.userPrefs/burp/prefs.xml
if test -z "$ENV_MEM_JVM"; then
    ENV_MEM_JVM=1024m
fi
echo "[+] JVM Mem: ${ENV_MEM_JVM}"
ls -l
ls -al
ls -al .BurpSuite
if [ "$ENV_BURP_PRO" -eq "1" ]; then
    echo "[+] Running Burp Pro"
    java -jar -Xmx${ENV_MEM_JVM} /home/tester/sources/burp-rest-api-2.0.1.jar --address=0.0.0.0 --port=8090 --headless.mode=false  --burp.jar=/home/tester/sources/burp_pro.jar
#    java -jar -Xmx${ENV_MEM_JVM} -Djava.awt.headless=true /home/tester/sources/burp_pro.jar  --project-file="rabbit.burp"
else
    echo "[+] Running Burp Free"
    java -jar -Xmx${ENV_MEM_JVM}  /home/tester/sources/burp_free.jar
fi
