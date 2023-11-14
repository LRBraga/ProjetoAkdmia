rm -rf publicado
mkdir publicado
dotnet build -r linux-x64 AkdemiaCS.csproj
dotnet publish -r linux-x64 --self-contained true -o publicado AkdemiaCS.csproj
for DOCK in `docker ps -a | grep -i akdemiacs | awk '{print $1}'`
do
  docker container stop $DOCK
  docker container rm -f $DOCK
done
for IMAGE in `docker images -a | grep -i akdemiacs | awk '{print $1}'`
do
  docker image rm $IMAGE
done
docker image rm akdemiacs.cloud-layer.login.back
docker build --no-cache -t akdemiacs.cloud-layer.login.back .
nohup docker run -e TZ='America/Sao_Paulo' -p 5004:5004 --name AkdemiaCS.Back akdemiacs.cloud-layer.login.back &
rm -rf  publicado
docker ps -a