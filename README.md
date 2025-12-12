# Flavortown Tracker

_From the creators of [SOM Monitor](https://go.skyfall.dev/som-monitor)_

Tracks the Flavortown shop for price updates and new items.

## Setup

Clone the repo:

```bash
git clone https://github.com/skyfallwastaken/flavortown-tracker
cd flavortown-tracker
```

Configure the `.env`:

```env
COOKIE= # flavortown.hackclub.com cookie
WEBHOOK_URL= # slack webhook url
USER_AGENT= # optional
BASE_URL= # optional - defaults to flavortown's prod instance
STORAGE_PATH= # optional - defaults to `flavortown-storage` folder in working dir
```

Then run:

```bash
chmod +x ./scripts/run-every-5min.sh
./scripts/run-every-5min.sh
```
