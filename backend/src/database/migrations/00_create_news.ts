import * as Knex from "knex";

export async function up(knex: Knex): Promise<void> {
  return knex.schema.createTable('news', table => {
    table.increments('id').primary()
    table.string('title').notNullable()
    table.string('body', 1000).notNullable()
  })
}

export async function down(knex: Knex): Promise<void> {
  return knex.schema.dropTable('news')
}
