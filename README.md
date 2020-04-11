# Dockerized Tensorflow Template
This is a generic template for standalone tensorflow projects.

It uses Tf2, and runs a few services inside a single docker container- first the "one shot" or daemon, which lives in main.py, can be used for initial training at first start, or it can be a daemon that provides ml results asynchronously to a flask application.

The second part is the flask application, which lives in app_server.py. Just a stub. However, it is running a full nginx / uwsgi stack because we're not animals.

The third part is redis, which acts as a go-between for the two processes.

The only port that should be opened is 8080:8080, or 80:8080, which is managed in run.sh. This way redis doesn't leak out and get enslaved by a local redis sentinel or such.
