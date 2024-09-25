# Firefox Kiosk Container

Welcome to the **Firefox Kiosk Container** repository! 🎉

This project is in the early stages of development. The goal is to create a lightweight and efficient containerized environment for running Firefox in kiosk mode within an [Instruqt](https://www.instruqt.com) track. 

## Getting Started

The easiest way is to just pull the container straight from the Docker Hub:

```bash
docker pull deltwalrus/instruqt-firefox-kiosk:latest
```

Details and history on the [Docker Hub](https://hub.docker.com/repository/docker/deltwalrus/instruqt-firefox-kiosk)

PRs are welcome, goals moving forward are:
- Improve performance or rescaling contents
- Hide/remove/obfuscate underlying desktop
- Suppress all loading messages
- Improve performance of remote rendering (pixelation, etc.)
