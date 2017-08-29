FROM alpine
MAINTAINER Michael Treacher <m.w.treacher@gmail.com>

RUN addgroup -S kube-operator && adduser -S -g kube-operator kube-operator

USER kube-operator

COPY bin/linux/namespace-rolebinding-operator .

ENTRYPOINT ["./namespace-rolebinding-operator"]
