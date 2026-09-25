#usage
#
#```{r, echo=FALSE, results='asis'}
#doc_child <- it.read('child.qmd')
#it.run(doc_child)
#```
#
#```{r, echo=FALSE, results='asis'}
#it.extract(doc_child, c("chunk-1", "chunk-2"))
#```

FLG_IN_RENDERING <- isTRUE(getOption("knitr.in.progress"))
#"research2025soa_prep_0605test.qmd"
it.read <- function(file){
  filename <- file
  
  con <- textConnection("qmd", "w", local = TRUE)
  options(knitr.duplicate.label = "allow")
  knitr::purl(file, output = con, quiet = T)
  close(con)

  return(list(qmd = qmd, filename = filename))
}

it.run <- function(doc, read.as.source = F){
  if(FLG_IN_RENDERING & !(read.as.source)){
    options(knitr.duplicate.label = "allow")
    cat(knitr::knit_child(doc$filename, quiet = T), sep = '\n')
  }else{
    source(textConnection(doc$qmd))
  }
}


#場合によってはこっちのやり方で出来ないかも検討する
#https://gedevan-aleksizde.github.io/rmarkdown-cookbook/reuse-chunks.html

it.extract <- function(doc, chunk_labels, chunk_option = NULL){
  qmd <- doc$qmd
  
  lines <- readLines(textConnection(qmd))
  
  code_all <- ""
  for(chunk_label in chunk_labels){
    start <- grep(paste0("^## ----", chunk_label , "(,|----)"), lines)
    end <- grep("^## ----", lines)
    end <- end[end > start][1] - 1  # 次のチャンクの前で終了
    code <- lines[start:end]
    
    if(FLG_IN_RENDERING){
      code <- c(code, "```")
      if (is.null(chunk_option))
        chunk_option <- knitr::opts_current$get()$params.src
      code[1] <- paste0("```{",chunk_option,"}")
    }
    code <- paste0(code, collapse = "\n")
    code_all <- paste0(code_all, code,"\n")
  }
  
  if(FLG_IN_RENDERING){
    options(knitr.duplicate.label = "allow")
    cat(knitr::knit_child(textConnection(code_all), quiet = T), sep = '\n')
  }else{
    eval(parse(text = code_all), envir = parent.frame())
  }
}
