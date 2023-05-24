FROM golang:1.20.2-bullseye as build 

WORKDIR /api

COPY ./go.mod ./
COPY ./go.sum ./
RUN go mod download
COPY ./ ./
RUN CGO_ENABLED=0 GOOS=linux go build -o server

FROM alpine:3.17.2
WORKDIR /
COPY --from=build /api/server .

ENV PORT=5000
ENV KEYCLOAK_HOST=https://sso.ducluong.monster
ENV CLIENT_ID=api_server
ENV CLIENT_SECRET=Panaxm4uaNAn0jA57yxXDjj5ga2o2xG0
ENV KEYCLOAK_USERNAME=admin
ENV KEYCLOAK_PASSWORD=P&g?@^,wDTNX4]zM
ENV POSTGRES_DSN=postgres://api_server:634zgwxwsjvt5179ximsmkhmg2uxnq5q@159.223.66.111:5432
ENV AWS_REGION=ap-southeast-1
ENV AWS_ACCESS_KEY_ID=AKIAVQKWVG6WNUESIF77
ENV AWS_SECRET_ACCESS_KEY=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

EXPOSE 5000
ENTRYPOINT [ "./server" ]