# docker sickbeard

This is a Dockerfile to set up "Sickbeard" - (http://sickbeard.com/)

Build from docker file

```
git clone git@github.com:jongillies/docker-sickbeard.git
cd docker-sickbeard
docker build -t sickbeard .
```

docker run -d \
    -v $SICKBEARD_CONFIG:/config  \
    -v $SICKBEARD_DATA:/data \
    -v $SABNZDB_COMPLETE:/complete \
    -v $TRANSMISSION_MOVIES_WATCH:/torrents
    -v $TV_LIBRARY_DIR:/tv \
    -p 8081:8081 --name sickbeard supercoder/sickbeard

Bring up the web interface and navigate to Config/Post Processing

Set the TV Download Dir to /complete

Home | Add Shows to /tv

