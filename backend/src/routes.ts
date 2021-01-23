import express from 'express'

import NewsController from './controllers/NewsController'
import EventsController from './controllers/EventsController'

const newsController = new NewsController
const eventsController = new EventsController

const routes = express.Router()

routes.get('/news', newsController.index)
routes.get('/news/:id', newsController.show)
routes.post('/news', newsController.create)
routes.put('/news/:id', newsController.update)
routes.delete('/news/:id', newsController.delete)

routes.get('/events', eventsController.index)
routes.get('/events/:id', eventsController.show)
routes.post('/events', eventsController.create)
routes.put('/events/:id', eventsController.update)
routes.delete('/events/:id', eventsController.delete)

module.exports = routes