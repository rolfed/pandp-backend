# Parking and Privacy Backend Service

PANDP service is built with Java 8, Spring Boot, GraphQL, PostGres and docker. This service is the backend of the application. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
Java 8
Maven 8
Docker
GraphQL
PostGres
```

### Installing

A step by step series of examples that tell you how to get a development env running

Clone project
```bash
git clone git@github.com:rolfed/pandp-backend.git
```

Install dependencies 
```bash
mvn install
```
Run docker-compose
```bash
docker-compose up
```

Run docker-compose in detach mode 
```bash
docker-compose up -d
```

Rebuild docker containers with docker-compose
```bash
docker-compose down 
docker-compose up --build
```
This will create pandp database with a dev user with password 'password'

Please visit the following to manage application:
* Adminer (MySql database client)
```bash
http://localhost:9999
```
*Graphiql
```bash
http://localhost:8080/graphiql 
```

## Running the application 

Run application 
```bash
mvn spring-boot:run 
```


Add property variables to application.properties
```bash
## PostGreSQL
spring.datasource.initialization-mode=always
spring.datasource.platform=postgres
spring.datasource.url=jdbc:postgresql://localhost:5432/pandp
spring.datasource.username=dev
spring.datasource.password=password

## drop and create table again, for testing
## comment this in production
spring.jpa.hibernate.ddl-auto=update

# Meant to hide HHH000424: Disabling contextual LOB creation as createClob() method threw error
spring.jpa.properties.hibernate.temp.use_jdbc_metadata_defaults=false

```

## Running the tests 
coming soon..


### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Spring Boot](https://spring.io/guides/gs/spring-boot/) - Backend framework
* [Maven](https://maven.apache.org/) - Dependency Management
* [GraphQL](https://graphql.org/) - Query API Layer
* [PostGres](https://www.postgresql.org/) - Relational Database

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

