FROM openjdk:8
ADD target/*.jar biom.jar
EXPOSE 80
ENTRYPOINT ["java","-jar","biom.jar"] 