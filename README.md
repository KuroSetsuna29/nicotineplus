# nicotineplus

This is a fork from https://bitbucket.org/freddywullockx/nicotineplus (fda1755b5160e2e8e78608348b4472b2e8d88068)

Full credits go to Freddy Wullockx for inital setup

------

Docker image for [Nicotine+](https://nicotine-plus.org/)

This image uses GDK Broadway instead of noVNC. This means very little lag, even with many search results, and no fixed resolution in the browser.

Don't forget to forward the ports for Soulseek on your router. Check the Nicotine settings.

```
docker run -it
    -p 8080:8080 \
    -v /host/appdata/nicotineplus:/root/.config/nicotine \
    -v /host/downloads:/downloads \
    -e LOGIN=username \
    -e PASSW=password \
    -e DARKMODE=true \
    ghcr.io/KuroSetsuna29/nicotineplus:latest
```