FROM openjdk:11.0.7
ADD bioMedical-0.0.1-SNAPSHOT.jar /target
EXPOSE 80
ENTRYPOINT ["java","-jar","bioMedical-0.0.1-SNAPSHOT.jar"]