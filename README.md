## README

Building this demo app with docker:

```bash
docker build -t demo .
```

Running the docker container:

```bash
docker run -itP demo
```

Using the docker container to run something other than the Dockerfile CMD...

```bash
docker run -it --entrypoint '/bin/bash' demo
```

Using the docker container to run a rake task...

```bash
docker run -it --rm demo bundle exec rake test
```
