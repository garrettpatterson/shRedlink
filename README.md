# shRedlink
Bash script to log thermostat data from a Redlink thermostat account at MyTotalConnectComfort.com

## Configure
* Clone the repo
* create a "redlink.conf" file, and enter your MyTotalConnectComfort.com credentials as below:
`USERNAME=**********
PASSWORD=**********`
* Run it.

## Usage
The script will run and generate a text file "tempdata.log" with a header, and the following columns:
* coolLowerSetpLimit
* coolUpperSetptLimit
* dispTemperature
* heatLowerSetptLimit
* heatSetpoint
* heatUpperSetptLimit
* indoorHumidity
* outdoorHumidity
* outdoorTemp
* schedCoolSp
* schedHeatSp
* weatherHumidity
* weatherTemperature

These all mean various things, although you'll probably only care to track a select few (like dispTemp).  Some thermostats with outside temp sensors will report through outdoorHumidity and outdoorTemp.  If yours doesn't it pulls temp based on location, and this data will come through weatherHumidity and weatherTemperature.

## Warnings
This basically just uses cURL and basic auth to log into the mytotalconnectcomfort.com site, parse the relevant thermostat values out of the HTML with very loose REGEX and then munges it in bash to a tab-separated file.
