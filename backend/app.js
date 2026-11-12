import express from 'express'
import dotenv from 'dotenv'

dotenv.config()
const app = express()
const port = process.env.PORT

app.get('/', (req, res) => {
  res.send('This is going to be an API server!')
})

app.listen(port, () => {
  console.log(`Example Server is Running on port ${port}`)
})
