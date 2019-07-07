# edit the dataframe in a spreadsheet-like editor
aq  <- edit(airquality)

# overwrite original dataframe
fix(aq)

# enter data into a blank dataframe
dd <- dataframe()
fix(dd)

# or
dd <- edit(data.frame())
