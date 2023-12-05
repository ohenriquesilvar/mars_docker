FROM ubuntu:18.04

WORKDIR /app

RUN apt-get update && apt-get install -y \
    openjdk-8-jdk \
    wget
    
COPY . /app

RUN wget https://courses.missouristate.edu/kenvollmar/mars/MARS_4_5_Aug2014/Mars4_5.jar -O /app/Mars4_5.jar


ENTRYPOINT ["java", "-jar", "Mars4_5.jar"]

