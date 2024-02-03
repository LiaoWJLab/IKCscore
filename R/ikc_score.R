




#' Calculate IKC score using provided expression set and optional parameters
#'
#' @param eset A matrix containing gene expression data. If not a matrix, it will be converted to one.
#' @param pdata An optional data frame with sample information corresponding to the columns of eset.
#' @param scale Logical. If TRUE, the data will be scaled. Default is FALSE.
#' @param check_eset Logical. If TRUE, outlier genes will be removed from the expression set. Default is FALSE.
#' @param id_pdata identifier of pdata
#'
#' @return IKCscore
#' @export
#' @author Dongqiang Zeng
#' @author Jiani Wu
#' @examples
#'
#' data("eset_luad", package = "IKCscore")
#' data("pdata_luad", package = "IKCscore")
#' res <- ikc_score(eset = eset_luad, pdata = pdata_luad, scale = TRUE)

ikc_score <- function(eset, pdata = NULL, id_pdata = "ID", scale = FALSE, check_eset = FALSE){

  if(!is.matrix(eset)) eset<-as.matrix(eset)
  eset <- log2eset(eset)

  if(scale){
    cat(crayon::green(">>>-- Scaling data...\n"))
    eset<-t(scale(t(eset)))
  }
  #############################################
  if(check_eset){
    cat(crayon::green(">>>-- Removing outlier genes...\n"))
    genes<- rownames(eset)
    genes<- IOBR::feature_manipulation(data = eset, feature = genes, is_matrix = TRUE, print_result = TRUE)
    eset<-eset[rownames(eset)%in%genes, ]
  }
  ############################################
  ############################################
  data("sig_io", package = "IKCscore")
  ############################################
  ############################################
  # https://github.com/r-lib/crayon
  cat(crayon::green(">>>-- Predicting new data with IKC model...\n"))
  res<- calculate_sig_score_ssgsea(pdata = NULL, eset = eset, signature = sig_io, mini_gene_count = 3)
  res$IKCscore <- res$immune + res$immune_checkpoint - res$KRT

  print(head(res))

  if(!is.null(pdata)){
    colnames(pdata)[which(colnames(pdata)==id_pdata)] <- "ID"
    res <- merge(res, pdata, by.x = "ID", by.y = "ID", all.x = T, all.y = FALSE)
  }

  cat(crayon::green(">>>-- DONE! \n"))

  return(res)

}
