export QP=$(docker images | grep -i postgres | wc -l)
if [ $QP -lt 1 ]
then
  docker pull postgres
fi
docker run --name AkdemiaCS -e POSTGRES_PASSWORD=123456789 -p 5432:5432 -d postgres
