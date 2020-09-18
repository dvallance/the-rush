# TheScore.Umbrella


## Setup

### Database

Get into the root of the directory (thescore_umbrella)

```bash
cd thescore_umbrella
```

You'll need a postgres database for the application. Easiest way to create one is with docker.

```bash
docker run --name thescore_db -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres --publish=5432:5432 --rm postgres
````
Once you have the database running you'll create the development database.

```bash
mix ecto.create
```


