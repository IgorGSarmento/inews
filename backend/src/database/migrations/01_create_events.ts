import * as Knex from "knex";

export async function up(knex: Knex): Promise<void> {
  return knex.schema.createTable('events', table => {
    table.increments('id').primary()
    table.string('title').notNullable()
    table.string('description', 1000).notNullable()
    table.string('date').notNullable()
    table.string('time').notNullable()
    table.string('address').notNullable()
  })
}

export async function down(knex: Knex): Promise<void> {
  return knex.schema.dropTable('events')
}

