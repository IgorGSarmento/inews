import { Request, Response } from 'express'
import knex from '../database/connection'

class NewsController {
  async index(request: Request, response: Response) {
    const news = await knex('news').select('*').orderBy('id', 'asc')

    return response.json(news)
  }

  async show(request: Request, response: Response) {
    const { id } = request.params

    const news = await knex('news').where('id', id).first()

    return response.json(news)
  }

  async create(request: Request, response: Response) {
    const { title, body } = request.body

    const news = {
      title,
      body
    }

    await knex('news').insert(news)

    return response.json(news)
  }

  async update(request: Request, response: Response) {
    const { id } = request.params
    const { title, body } = request.body

    const news = {
      title,
      body
    }

    await knex('news').where('id', id).update(news)

    return response.json({
      message: 'Update Successfully.',
    })
  }

  async delete(request: Request, response: Response) {
    const { id } = request.params

    await knex('news').where('id', id).delete()

    return response.json({
      message: 'Delete Successfully.',
    })
  }
}

export default NewsController