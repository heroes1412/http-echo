http-echo
=========
HTTP Echo is a small go web server that serves the contents it was started with
as an HTML page.

The default port is 5678, but this is configurable via the `-listen` flag:

```
http-echo -listen=:8080 -text="hello world"
```

Then visit http://localhost:8080/ in your browser.

========
docker run --rm -p 5678:5678 http-echo:latest -listen=:5678 -text="text"

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: service1
  labels:
    app.kubernetes.io/name: service1  #show in hubble ui
spec:
  replicas: 1
  selector:
    matchLabels:
      app: service1
  template:
    metadata:
      labels:
        app: service1
    spec:
      containers:
        - name: service1
          image: hashicorp/http-echo #default port 5678
          #ports: #no need to use with ingress/service
          #  - name: http #no need to use with ingress/service
          #    containerPort: 5678 #no need to use with ingress/service
          args:
          - "-text='hello from service1'"
          - "-listen=:8080"
```
