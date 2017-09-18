FROM golang:1.9

WORKDIR /go/src/github.com/treacher/namespace-rolebinding-operator

RUN useradd -u 10001 kube-operator

RUN go get github.com/Masterminds/glide

COPY glide.yaml .
COPY glide.lock .

RUN glide install

COPY . .

RUN GOOS=linux GOARCH=amd64 go build -v -i -o bin/linux/namespace-rolebinding-operator ./cmd

FROM scratch
MAINTAINER Michael Treacher <m.w.treacher@gmail.com>

COPY --from=0 /etc/passwd /etc/passwd

USER kube-operator

COPY --from=0 /go/src/github.com/treacher/namespace-rolebinding-operator/bin/linux/namespace-rolebinding-operator .

ENTRYPOINT ["./namespace-rolebinding-operator"]
