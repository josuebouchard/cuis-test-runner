FROM python:3.11-slim-bullseye

# Used to run smalltalk ui:
# RUN apt-get update && \
#       apt-get -y install libxrender-dev libgl-dev libsm-dev libpulse-dev

ADD ./linux64/ /home/linux64/
COPY runTests.st main.py /home/
ENTRYPOINT [ "python", "/home/main.py" ]