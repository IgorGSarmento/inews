import { Request, Response } from 'express'
import knex from '../database/connection'

class EventsController {
  async index(request: Request, response: Response) {
    const events = await knex('events').select('*').orderBy('id', 'asc')

    return response.json(events)
  }

  async show(request: Request, response: Response) {
    const { id } = request.params

    const event = await knex('events').where('id', id).first()

    return response.json(event)
  }

  async create(request: Request, response: Response) {
    const {
      title,
      description,
      date,
      time,
      address
    } = request.body

    const event = {
      title,
      description,
      date,
      time,
      address
    }

    await knex('events').insert(event)

    return response.json(event)
  }

  async update(request: Request, response: Response) {
    const { id } = request.params
    const {
      title,
      description,
      date,
      time,
      address
    } = request.body

    const event = {
      title,
      description,
      date,
      time,
      address
    }

    await knex('events').where('id', id).update(event)

    return response.json({
      message: 'Update Successfully.',
    })
  }

  async delete(request: Request, response: Response) {
    const { id } = request.params

    await knex('events').where('id', id).delete()

    return response.json({
      message: 'Delete Successfully.',
    })
  }
}

export default EventsController