const app = require('express')()

app.get('/', (req, res ) =>
  res.json({'message':'This is a web app!'})
)
const port = process.env.PORT || 8080

app.listen(port, () => console.log(`Listening on https://localhost:${port}`))
