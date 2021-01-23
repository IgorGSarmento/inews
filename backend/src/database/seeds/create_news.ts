import * as Knex from "knex";

export async function seed(knex: Knex): Promise<void> {
    await knex("news").insert([
        {
            title: "Noticia 1",
            body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porttitor augue eu ornare aliquam. Vestibulum id porttitor lorem, vel laoreet lectus. Nullam dictum euismod ligula, a sagittis ligula tristique eu. Nullam dignissim, ex ac maximus vulputate, elit ex fermentum massa, non venenatis turpis ipsum at nulla."
        },
        {
            title: "Noticia 2",
            body: "Etiam mattis nisi placerat, sollicitudin lectus et, cursus diam. Praesent tristique blandit nulla nec rhoncus. Integer vitae magna arcu. Aenean sollicitudin magna at orci viverra fringilla id quis metus."
        },
        {
            title: "Noticia 3",
            body: "Mauris sed enim sit amet dolor blandit tincidunt vel in sem. Vestibulum congue, sem sit amet ullamcorper tempor, felis dolor facilisis turpis, sed varius tortor nisi quis eros."
        },
        {
            title: "Noticia 4",
            body: "Nullam dignissim, ex ac maximus vulputate, elit ex fermentum massa, non venenatis turpis ipsum at nulla. Etiam mattis nisi placerat, sollicitudin lectus et, cursus diam. Praesent tristique blandit nulla nec rhoncus. Integer vitae magna arcu. Aenean sollicitudin magna at orci viverra fringilla id quis metus. Mauris sed enim sit amet dolor blandit tincidunt vel in sem. Vestibulum congue, sem sit amet ullamcorper tempor, felis dolor facilisis turpis, sed varius tortor nisi quis eros. Curabitur facilisis, sem eleifend gravida malesuada, nisl nibh vehicula purus, eu convallis ex risus quis nulla. Nullam viverra urna id fermentum egestas."
        },
        {
            title: "Noticia 5",
            body: "Sed malesuada ligula quis congue venenatis. Suspendisse potenti. Proin purus risus, venenatis quis turpis sagittis, tincidunt imperdiet sem. In tincidunt sapien felis, vitae convallis purus vestibulum nec. Donec eros ex, dignissim ac arcu ac, interdum congue urna."
        },
    ]);
};
