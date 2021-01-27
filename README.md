# LaTeX Report Template

![Badge](https://gitlab.utc.fr/LaTeX-UTC/Templates/latex-thesis-template/badges/master/build.svg)


[![Creative Commons License - CC-BY
4.0](https://i.creativecommons.org/l/by/4.0/88x31.png)](http://creativecommons.org/licenses/by/4.0/)

This is a simple LaTeX template for report and thesis.

> See the document
[here](https://gitlab.utc.fr/LaTeX-UTC/Templates/latex-thesis-template/builds/artifacts/master/raw/main.pdf?job=building-latex)

Most of the template is an adaptation of [Lilian Besson internship
report](https://bitbucket.org/lbesson/internship-mva-2016/src/c35130e0f40e9787f8fd4dd333990642cd8875d7/README.md?at=master&fileviewer=file-view-default).

## Usage

`make` can be used to do most of the workflow of compiling and cleaning the
repo.

`compile_on_change.sh` can be used to recompile when changes happen.

## Structure

The repo is organised as follows:
 - `Makefile`: used by `make` to compile the document and clean the repo when ;
 - `biblio.bib`: the bibliography
 - `main.tex`: the entrypoint for the compilation. Defines the structure of the
     document
 - `glossary.tex`: the glossary ; included at the end.
 - `preamble.tex` and `settings.text`: the fixtures that define the appearance
     of the document
 - `chapters/`: the content of the document.  Several doc are present and are
     include
 - `compile_on_change.sh`: a script that compiles the document on change
 - `figs/`: where to put rasters, vector images and plantuml script to be
     included at compile time ;
 - `scripts/`: a set of custom script to use for the compilation


## How to include raster in the document LaTeX?

Main take away: **All the figures have to be present in the `figs/` folder
`figs/` for any type of extensions.**

The supported extensions are:
 - `.pdf`
 - `.png`
 - `.svg`
 - `.pu` (PlantUML)

### How to include `pdf`'s and `png`'s?

 1. Put the figure in `figs/`, for instance: `figs/rabbit.pdf`
 1. Use it in the document directely without any path nor extension:

    ```latex
    \includegraphics[width=.5\textwidth]{rabbit}
    ```

### How to include `.pu`'s?

 1. Put the figure in `figs/`, for instance: `figs/cactus.pu`
 1. Add it to the list of figures to generate as `pdf` in  `Makefile`:

    ```MakeFile
    GENERATED_PDF_FROM_UML= \
    ...
          generated/figs/uml/cactus.pdf \
    ...
    ```
 1. Use it in the document directely without any path nor extension:

    ```latex
    \includegraphics[width=.5\textwidth]{citron}
    ```

## Gitlab Continuous Integration

`.gitlab-ci.yml` defines a simple CI pipeline : it compiles the document and
makes the artefact available online.

This way, you can easily share the link so that people can have access to the
last state of your document on the `master` branch instead of asking it
everytime.

If you use GitLab, you can fork this repo and activate the sharred runner to
have this setup.

## License

This entire project is publicly released under [the Creative Commons
— Attribution 4.0
InternationalLicense](http://creativecommons.org/licenses/by/4.0/) (CC BY 4.0).

