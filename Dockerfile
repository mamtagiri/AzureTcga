# Let's use the image base-notebook to build our image on top of it
FROM jupyter/r-notebook


RUN mkdir tcgaazure

COPY tcgaazure/ tcgaazure/

RUN R -e "install.packages('dplyr', repos='http://cran.rstudio.com/')"

RUN R -e "install.packages('devtools', repos='http://cran.rstudio.com/')"

RUN R -e "install.packages('BiocManager',repos='http://cran.rstudio.com/')"

RUN R -e "BiocManager::install('TCGAbiolinks')"

RUN R -e "devtools::install_github('Azure/AzureStor')"

RUN R -e "devtools::install_github('mamtagiri/tcgaazureR')"

