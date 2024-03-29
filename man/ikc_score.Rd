% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ikc_score.R
\name{ikc_score}
\alias{ikc_score}
\title{Calculate IKC score using provided expression set and optional parameters}
\usage{
ikc_score(
  eset,
  pdata = NULL,
  id_pdata = "ID",
  scale = FALSE,
  check_eset = FALSE
)
}
\arguments{
\item{eset}{A matrix containing gene expression data. If not a matrix, it will be converted to one.}

\item{pdata}{An optional data frame with sample information corresponding to the columns of eset.}

\item{id_pdata}{identifier of pdata}

\item{scale}{Logical. If TRUE, the data will be scaled. Default is FALSE.}

\item{check_eset}{Logical. If TRUE, outlier genes will be removed from the expression set. Default is FALSE.}
}
\value{
IKCscore
}
\description{
Calculate IKC score using provided expression set and optional parameters
}
\examples{

data("eset_luad", package = "IKCscore")
data("pdata_luad", package = "IKCscore")
res <- ikc_score(eset = eset_luad, pdata = pdata_luad, scale = TRUE)
}
\author{
Dongqiang Zeng

Jiani Wu
}
