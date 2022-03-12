 .PHONY: build
 build:
	rm -f country_data.json
	curl https://raw.githubusercontent.com/the-abe-train/globle/master/src/data/country_data.json > country_data.json
	echo 'Name,Latitude,Longitude' > country-points.csv && cat country_data.json | jq -r '.features[] | [.properties.NAME, (.bbox[2]-(.bbox[2]-.bbox[0])), (.bbox[3]-(.bbox[3]-.bbox[1]))] | @csv' >> country-points.csv
