// after authentication slides
const express = require('express');
const bodyParser = require('body-parser');
const usersRoutes = require('./routes/users' );
const sessionRoutes = require('./routes/session' );
const registerRoutes  = require('./routes/register' );
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
app.use('/users', authenticateJWT , usersRoutes);
app.use('/register', registerRoutes);
app.use('/events', authenticateJWT , eventRoutes);
app.listen(port, () => {
  console.log(`This app is listening on port  ${port}`);
});