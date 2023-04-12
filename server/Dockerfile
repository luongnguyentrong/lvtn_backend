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
ENV CLIENT_SECRET=WP0FjTw7Ol8JaVhWsY8k4UuXRtc00tiK
ENV KEYCLOAK_USERNAME=admin
ENV KEYCLOAK_PASSWORD=P&g?@^,wDTNX4]zM

EXPOSE 5000
ENTRYPOINT [ "./server" ]