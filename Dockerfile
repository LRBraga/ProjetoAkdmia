FROM mcr.microsoft.com/dotnet/core/sdk
RUN apt update
RUN apt install -y libgdiplus sshpass net-tools
RUN mkdir /app
WORKDIR /app
EXPOSE 5004
WORKDIR /app
COPY publicado/ /app
COPY dbconn.txt /app
#COPY dbconnRedis.txt /app
ENTRYPOINT ["/app/AkdemiaCS"]