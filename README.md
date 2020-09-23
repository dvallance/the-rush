# TheScore.Umbrella


## Setup

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

Then run the server.
```bash
mix phx.server
```

If phx.server isn't smart enought to run them automatically you may need to.

```bash
mix deps.get
mix deps.compile
cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development
```

## Notes about the assignment.

See accompanying video for a quick demo. (In the root of the directory there is a `thescore-rush-demo.mp4` video file)

I didn't add pagination just do to time and I'm not sure it adds any value to the demo.

Tests are limited as well due to keeping the time down.

For a real production app I would move slower and have more testing and some better design, but I just wanted hit the major features as quickly as possible.

(e.g. for the search I would leverage trigram/similarity features and make sure the searched field is indexed correctly, instead of a simple LIKE query with no index)

Thanks for checking out my work and if you have any questions let me know!
