import path from 'path'

// Adicione as informações da conexão do seu banco de dados abaixo

module.exports = {
  development: {
    client: 'pg',
    connection: {
      database: 'DATABASE',
      user: 'USER',
      password: 'PASSWORD'
    },
    migrations: {
      directory: path.resolve(__dirname, 'src', 'database', 'migrations')
    },
    seeds: {
      directory: path.resolve(__dirname, 'src', 'database', 'seeds')
    },
  }
};


