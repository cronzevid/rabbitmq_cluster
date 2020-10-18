# rabbitmq_cluster

Testing cluster of three nodes. Startup:
`docker build . --tag test_rmq && docker-compose up -d`
Halt:
`docker-compose down`

You may need to generate yourself a pair of key/cert, and setup a CA.
