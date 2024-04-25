#!/bin/bash

#Define path to the list of programs
input_file="app_versions.txt"

#Rea the lines of fhe file
while IFS= read -r line; do
    #Extract program name and version
    app_name=$(echo $line | cut -d',' -f1)
    version=$(echo $line | cut -d',' -f2)

    #Create the URL to chek the NVD API
    url="https://services.nvd.nist.gov/rest/json/cves/2.0?keywordSearch=${app_name}-${version}"
    
    #Request to the API and print the response
    response=$(curl -s "$url")
    echo "Response of API to the program ${app_name} version ${version}:"
    echo "$response" | jq .
    echo "------------------------------------------------------"
done < "$input_file"
