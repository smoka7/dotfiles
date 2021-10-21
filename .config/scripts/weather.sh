#!/bin/sh
weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?id=113491&APPID=41c9b01229453be614f32c55f963accb&units=metric")
if [ ! -z "$weather" ]; then
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".weather[].icon" | head -1)
    weather_description=$(echo "$weather" | jq -r ".weather[].description" | head -1)

    echo "$weather_icon" "$weather_description"@@"$weather_temp"
else
    echo "..."
fi
