# our base image
FROM alpine:3.5

# Install python and pip
RUN apk add --update py2-pip

# install Python modules needed by the Python app
COPY requirements.txt /src/app/
RUN pip install --no-cache-dir -r /src/app/requirements.txt

# copy files required for the app to run
COPY app.py /src/app/
COPY templates/index.html /src/app/templates/

# tell the port number the container should expose
EXPOSE 5000

# run the application
CMD ["python", "/src/app/app.py"]