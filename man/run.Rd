% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/run.R
\name{run}
\alias{run}
\title{Run Section of ISS}
\usage{
run(iss)
}
\arguments{
\item{iss}{Character vector which cummulatively becomes an Inno Setup Script (ISS).}
}
\value{
Chainable character vector, which can be used as the \code{text} argument of \code{\link{writeLines}} to generate an ISS.
}
\description{
Specifies any number of programs to execute after the program has been successfully installed, but before the installer displays the final dialog. See \href{http://www.jrsoftware.org/ishelp/topic_runsection.htm}{[Run] section} for details.
}
\seealso{
\code{\link{get_R}}, \code{\link{copy_installation}}, \code{\link{create_config}}, \code{\link{create_bat}}, \code{\link{create_pkgs}}, \code{\link{directives}}, \code{\link{setup}}, \code{\link{languages}}, \code{\link{tasks}}, \code{\link{files}}, \code{\link{icons}}, \code{\link{run}}, and \code{\link{code}}.
}
\author{
Jonathan M. Hill
}
