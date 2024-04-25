Check on NVD API if there is any vulnerability in a list of programs

You wil need to install the jq tool to extract the content of the alerts - apt update && apt install jq -y

File app_versions.txt format:
app1_name,app1_version
app2_name,app2_version
...
