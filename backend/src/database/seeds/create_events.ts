import * as Knex from "knex";

export async function seed(knex: Knex): Promise<void> {
    await knex("events").insert([
        {
            title: "Evento 1",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porttitor augue eu ornare aliquam.",
            date: "20 de Janeiro de 2021",
            time: "15h00m",
            address: "Rua dos Bobos, Número 0",
        },
        {
            title: "Evento 2",
            description: "Etiam mattis nisi placerat, sollicitudin lectus et, cursus diam. Praesent tristique blandit nulla nec rhoncus.",
            date: "21 de Fevereiro de 2021",
            time: "13h00m",
            address: "Rua dos Bobos, Número 1",
        },
        {
            title: "Evento 3",
            description: "Mauris sed enim sit amet dolor blandit tincidunt vel in sem.",
            date: "22 de Março de 2021",
            time: "11h00m",
            address: "Rua dos Bobos, Número 2",
        },
        {
            title: "Evento 4",
            description: "Nullam dignissim, ex ac maximus vulputate, elit ex fermentum massa, non venenatis turpis ipsum at nulla.",
            date: "23 de Abril de 2021",
            time: "17h00m",
            address: "Rua dos Bobos, Número 3",
        },
        {
            title: "Evento 5",
            description: "Sed malesuada ligula quis congue venenatis. Suspendisse potenti. Proin purus risus, venenatis quis turpis sagittis, tincidunt imperdiet sem.",
            date: "24 de Maio de 2021",
            time: "19h00m",
            address: "Rua dos Bobos, Número 4",
        },
    ]);
};
