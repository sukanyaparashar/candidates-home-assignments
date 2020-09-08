<template lang="pug">
section.section
  .columns.is-mobile
    card(title='BTC/USD')  BTC/USD one month history chart here
    card(title='ETH/USD')  ETH/USD one month history chart here
    card(title='XRP/USD')  XRP/USD one month history chart here
</template>
<script>
import Card from '~/components/Card'
export default {
  name: 'HomePage',
  components: {
    Card,
  },
}
</script>
