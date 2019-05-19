##Exercise 1
dracula <- readLines("dracula.txt", n = -1)

##or use (v | V) for cases.
sum(grepl("vampire",dracula, ignore.case = TRUE))

##case sensitive
sum(grepl("Dracula",dracula))

##harder
sum(unlist(gregexpr('\\<the\\>',dracula, ignore.case = TRUE)) > 0)

##notice theme and stithe can not be included. so have to use boundaries.

###！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
##Misspelling Exercise-2

regexp <- '[CK](u|a)r{1,2}(i|e)*n'


badNames <- c('Curren', 'Currin','Curin', 'Curan','Curen', 'Curn','Karen')

grepl(regexp, badNames)

##match Curan and Currn, but not Curran

regexp <- '[CK](u|a)(?!rra)r{1,2}(i|e|a)*n'

badNames <- c('Curren', 'Currin','Curin', 'Curan','Curen', 'Curn','Karen','Currn','Curran')

grepl(regexp, badNames,perl = TRUE)


###！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！

##phone-numbers Exercise-3

##Read the file
phonen <- readLines("phone-numbers.txt", n = -1)

##only keep the lines of names, address or phone number
regexp <- '^(Contact|[0-9]|Curran)'
phonen <- phonen[grepl(regexp, phonen,ignore.case = FALSE)]

##remove the More info in each name lines
phonen = gsub('(More).*',"",phonen)

##reorder the names
nameregexp <- '^(Curran)[ ]([A-Za-z].*)'
phonen = gsub(nameregexp,'Name: \\2 \\1',phonen)

##reformat phone numbers
phoneregexp <-'(Contact)[:][ ]*(09)[-]([0-9]*)[ ]([0-9]*)'
phonen = gsub(phoneregexp,'Ph: +64-(0)9-\\3\\4',phonen)

##add address
addregexp = '(^[0-9].*)'
phonen = gsub(addregexp,'Address: \\1',phonen)

##reformat street
addregexp1 = '(?<=Address[:][ ])([0-9]*)(.*?(Rd|Cre|Dve|Ave|Hwy|St|Pl))(.*)[ ](Auckland)[ ]([0-9]*)'
phonen = gsub(addregexp1,'Flat/Street number: \\1; Street Name: \\2; Suburb: \\4; City\\Town: \\5; Postcode: \\6',phonen,perl = TRUE)

##show
phonen