 .PHONY: build
 build:
	rm -f country_data.json
	curl https://raw.githubusercontent.com/the-abe-train/globle/master/src/data/country_data.json > country_data.json
	
	echo 'Name,Longitude,Latitude' > country-points.csv && cat country_data.json | jq -r '.features[] | [.properties.NAME, (.bbox[0]+((.bbox[2]-.bbox[0])/2)), (.bbox[1]+((.bbox[3]-.bbox[1])/2))] | @csv' >> country-points.csv
