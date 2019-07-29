<template>
  <div>
    <h1>Providers List</h1>
    <table border="1">
      <tr>
        <td><b>Company Name</b></td>
        <td><b>Flat Rate</b></td>
        <td><b>Flat Rate USD</b></td>
        <td><b>Rate per Kilo >>></b></td>
      </tr>
      <tr v-for="p in providers" :key="p.id">
        <td>{{ p.company_name }}</td>
        <td>{{ (p.rate_cents / 100).toFixed(2) }} {{ p.currency }}</td>
        <td>{{ (p.common_rate_cents / 100).toFixed(2) }} USD</td>
        <td v-for="r in p.shipping_rates">
          <table>
            <tr>
              <td>{{ r.origin }}</td>
              <td> > </td>
              <td>{{ r.destination }}</td>
              <td>{{ (r.rate_cents / 100).toFixed(2) }} {{ p.currency }}</td>
              <td>{{ (r.common_rate_cents / 100).toFixed(2) }} USD</td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
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
  axios.get('http://localhost:3000') 
  .then(response => {
    this.providers = response.data
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
