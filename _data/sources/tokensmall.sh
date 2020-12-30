set e+
TOKEN=$(curl -s -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' --data '{"username":"admin","password":"qwertyuiop"}' 'http://0.0.0.0:9999/api/auth' | jq -r '.jwt')
echo $TOKEN
curl -i -s -k -X GET -H 'Host: 0.0.0.0:9999' -H 'Accept: application/json, text/plain, */*' -H "Authorization: Bearer ${TOKEN}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36' -H 'Content-Type: application/json' -H 'Origin: http://0.0.0.0:9999' -H 'Referer: http://0.0.0.0:9999/' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.9' -H 'Connection: close' 'http://0.0.0.0:9999/api/users/1'







