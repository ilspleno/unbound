
FROM alpine:latest
LABEL Name=unbound Version=0.0.1
RUN apk add --no-cache unbound git perl perl-libwww perl-lwp-protocol-https
WORKDIR /adblock
#RUN git clone https://github.com/StevenBlack/hosts.git /adblock/hosts
RUN git clone https://github.com/jodrell/unbound-block-hosts.git /adblock/unbound-block-hosts
RUN unbound-anchor
RUN /adblock/unbound-block-hosts/unbound-block-hosts
ADD unbound.conf /etc/unbound/unbound.conf
CMD unbound -d
EXPOSE 53/udp
