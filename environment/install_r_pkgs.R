pkgbuild::check_build_tools(debug = TRUE)

# environment R packages
remotes::install_github('HenrikBengtsson/future.apply', ref = '1.3.0')
remotes::install_cran('urca', repos="https://cloud.r-project.org/")
remotes::install_github("RamiKrispin/TSstudio")

# environment Jupyter R kernel
remotes::install_github("IRkernel/IRkernel")

# add R kernel with name: r_kernel
IRkernel::installspec(name="r_kernel", displayname="R for Time Series")
