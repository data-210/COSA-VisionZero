FROM rocker/r-ver:4.1.0

RUN apt-get update && apt-get install -y \
    libssl-dev \
    libxml2-dev \
    libudunits2-dev \
    libcurl4-openssl-dev \
    libproj-dev \
    libgdal-dev \
    libssh2-1-dev \
    libpq-dev \
    git \
    pandoc \
    pandoc-citeproc

RUN R -e "install.packages(c('shiny', 'dplyr', 'shinydashboard', 'udunits2', 'leaflet', 'DT', 'tidyverse', 'rsconnect', 'ggrepel', 'leaflet.extras','sp', 'sf','RColorBrewer'))"

COPY Mappingv3.R /root/app.R
COPY ped_cycle_df.csv /root/ped_cycle_df.csv
COPY RedistrictedCouncilDistricts2022.* /root/
COPY Bike_Facilities.* /root/

EXPOSE 8080

CMD ["R", "-e", "shiny::runApp('/root/app.R', host = '0.0.0.0', port = 8080)"]


