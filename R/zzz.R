



.onLoad <- function(libname, pkgname) {

  invisible(suppressPackageStartupMessages(library("ggplot2")))
  invisible(suppressPackageStartupMessages(library("IOBR")))

  invisible(suppressPackageStartupMessages(
    sapply(c("crayon", "survminer", "ggplot2"),
           requireNamespace, quietly = TRUE)
    ))
}



##' @importFrom utils packageDescription
.onAttach <- function(libname, pkgname) {
  pkgVersion <- packageDescription(pkgname, fields="Version")
  msg <- paste0("==========================================================================\n",
                " ", pkgname, " v", pkgVersion, "  ",

                "  For help: https://github.com/LiaoWJLab/IKCscore/issues", "\n\n")

  citation <-paste0(" If you use ", pkgname, " in published research, please cite:\n",
                    " JN Wu, ..., WJ Liao*, DQ Zeng*.\n",
                    " Tumor microenvironment assessment-based signatures for predicting response \n ",
                    " to immunotherapy in non-small cell lung cancer. iScience (Under Review) \n",
                    # " Journal of Thoracic Oncology. 12:687975,(2023). \n",
                    # " XXXX, 2020", "\n",
                    # " DOI: 10.3389/JTO.2023.687975\n",
                    # " PMID:  ","\n",
                    "==========================================================================")

  packageStartupMessage(paste0(msg, citation))
}



