system("taskkill /im java.exe /f", intern=FALSE, ignore.stdout=FALSE)
driver <- rsDriver(browser = c("chrome"), chromever = "103.0.5060.134")
remote_driver <- driver[["client"]]
link=("https://services.healthtech.dtu.dk/service.php?NetMHCpan-4.1")
MHC1<-remote_driver$navigate(link)
MHC1_html<-remote_driver$getPageSource()[[1]]
MHC1_html
MHC1_Prediction<-read_html(MHC1_html)
MHC1_Prediction
accept_cookies_MHC1<-remote_driver$findElement(using = "id",value = "cookiescript_accept")$clickElement()
Sys.sleep(2)
#switch to iframe
Sys.sleep(2)
iframe <- remote_driver$findElement("xpath", "*//iframe[@id = 'servicetabs-1']")
remote_driver$switchToFrame(iframe)
MHC1_fastabox<-remote_driver$findElement(using = "name",value="SEQPASTE")
MHC1_fastabox$sendKeysToElement(list(">seq1
MEMKIDALAGTLESSDVMVRIGPAAQPGIQLEIDSIVKQQFGAAIEQVVRETLAQLGVKQ
ANVVVDDKGALECVLRARVQAAALRAAQQTQLQWSQL"))
peptidelength<-remote_driver$findElement(using = "xpath", value = "/html/body/form/div[1]/p[2]/select/option[2]")$clickElement()
HLA1<-remote_driver$findElement(using = "xpath", value = "/html/body/form/span[1]/select/option[1]")$clickElement()
sortbypredictionA1<-remote_driver$findElement(using = "xpath", value = "/html/body/form/input[7]")$clickElement()
submit_MHC1<-remote_driver$findElement(using = "xpath",value = "/html/body/form/p[3]/input[1]")$clickElement()