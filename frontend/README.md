# Amun frontend task

### Backgground

Very often, frontend work at Amun involves integration with external providers, and two-way communication with data providers.

In the task in front of you we will exercise a simple one-way communication with a data provider, fetching data and presenting it.

### Implementation details

- Fork this repo to your local machine
- Generate API key on [cryptocompare](https://cryptocompare.com)
- Use [that](https://min-api.cryptocompare.com/documentation?key=Historical&cat=dataHistoday) API endpoint to fetch **one month** of daily price history for the following pairs:
  - BTC/USD
  - ETH/USD
  - XRP/USD <br>
    For each pair, present a chart showing the time on the X axis, and the price on the Y axis

The final result should show on the home page three charts of the above pairs.

You are free to use whichever charting library you find suitable for the task.

Reach out to your contact at Amun for any question or clearification

## Build Setup

```bash
# install dependencies
$ npm install

# serve with hot reload at localhost:3000
$ npm run dev

# build for production and launch server
$ npm run build
$ npm run start

# generate static project
$ npm run generate
```

For detailed explanation on how things work, check out [Nuxt.js docs](https://nuxtjs.org).
