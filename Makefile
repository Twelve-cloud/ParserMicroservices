include .env
export

.RECIPEPREFIX := $() $()

# ----------------------------------- APP ------------------------------------------------

COMPOSE :=                             \
    -f docker-compose.yaml             \
    -f ${COMPOSE_KAFKA}                \
    -f ${COMPOSE_MONGO}                \
    -f ${COMPOSE_POSTGRES}             \
    -f ${COMPOSE_REDIS}                \
    -f ${COMPOSE_PARSER}               \

COMPOSE_ENV :=                         \
    --env-file=.env                    \
    --env-file=env/.env.compose        \

build: docker-compose.yaml
    sudo docker compose -p parser ${COMPOSE_ENV} ${COMPOSE} up --build

start: docker-compose.yaml
    sudo docker compose -p parser ${COMPOSE_ENV} ${COMPOSE} up

start_detach: docker-compose.yaml
    sudo docker compose -p parser ${COMPOSE_ENV} ${COMPOSE} up --detach

stop: docker-compose.yaml
    sudo docker compose -p parser ${COMPOSE_ENV} ${COMPOSE} down
