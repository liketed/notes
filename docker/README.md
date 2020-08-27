run shell in new container as root

    docker run -it -u root 9ced3da34c54 /bin/bash


run shell as root in existing container:

    docker exec -it -u root 8d1007a41a465993ba4e3961448c3ebb70e5a3c9e3e0d024a678c10bcc9536b9 bash


run elasticsearch

    docker run -d -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.5.4

