// after authentication slides
const express = require('express');
const bodyParser = require('body-parser');
const usersRoutes = require('./routes/user' );
const sessionRoutes = require('./routes/session' );
const eventRoutes = require('./routes/events' );
const { authenticateJWT , authenticateWithClaims  } = require('./middleware/auth' );
const { createModelsMiddleware  } = require('./middleware/model-middleware' );
const app = express();
const port = 3000;
app.use(bodyParser.json());
app.use(createModelsMiddleware );
app.get('/health', (request, response, next) => {
  const responseBody = { status: 'up', port };
  response.json(responseBody);
  next();
});
app.use('/session', sessionRoutes);
app.use('/user', authenticateJWT , usersRoutes);
app.use('/events', eventRoutes);
app.listen(port, () => {
  console.log(`This app is listening on port  ${port}`);
});