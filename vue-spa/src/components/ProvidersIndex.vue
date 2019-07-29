<template>
  <div>
    <h1>Providers List</h1>
    <ul>
      <li class="title">
        <div>Company Name</div>
        <div>Total</div>
      </li>
      <li v-for="p in providers" :key="p.company_name">
        <div>{{ p.company_name }}</div>
        <div>{{ p.rate_cents / 100 }} {{ p.currency }}</div>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'ProvidersIndex',
  data () {
    return {
      providers: [
        {
          name: 'company_name',
          rate: {
            total: 100,
            currency: 'USD'
          }
        }
      ]
    }
  },
  created() {
  axios.get('http://localhost:3000/shipping_service_providers') 
  .then(response => {
    this.providers = response.data
  })
  axios.get('http://localhost:3000/shipping_rates') 
  .then(response => {
    this.rates = response.data
  })
 .catch(e => {
  this.error.push(e)
  })
 },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: flex;
  justify-content: space-between;
  margin: 0 10px;
}

.title {
  font-weight: bold;
  border-bottom: 1px solid #c0c0c0;
  margin-bottom: 10px;
  text-transform: uppercase;
}
</style>
