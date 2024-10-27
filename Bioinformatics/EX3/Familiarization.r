library(readxl)

pdf("Familiarization.pdf")

# 1. Calculate the total population of each country.

# Loading the sheet
age = as.data.frame(read_xlsx("EurostatCensus2011.xlsx", sheet=1))

# Defining the sumation function
sum <- function(x) {
    output = 0
    for (thing in x) {
        output = output + thing
    }
    return(output)
}

sensus <- function(df, hush = FALSE) {
    # Keeping a varibale for the numbre of rows to not re calculate multiple times within the rest of the funcion
    length = nrow(df)
    # Keeping a variable that hold all the sums
    holder = c(1:length)
    # For slicing
    for (index in 1:length) {
        # Isolating data
        data = df[index,2:ncol(df)]
        # Calculating
        holder[index] = sum(data)
        # Showing output
        if (hush) {
        }
        else {
            print(c('The total population of ', df[index, 1], ' is', holder[index]))
        }
    }
    return(sum(holder))
}

# Assigned to a varibale to not print the return value
quiet = sensus(age)

# Question delimination for ease of reading output
print('---------')

# 2. Calculate the total population of the European Union (EU) and the total
# population per age group.

# Defining criteria for EU
exclude = c('United Kingdom', 'Iceland', 'Liechtenstein', 'Norway', 'Switzerland')

# Filtering data from non EU countries
new = subset(age, age$Country != exclude)
# Clearing memory
rm(age)

# Calculating
result = sensus(new, hush = TRUE)
print(c('EU population: ', result))

# Second requirement
groups <- function(df, hush = FALSE) {
    # Saving to a variable to not call the function multiple times
    size = ncol(df)
    # Preparing output for question 3
    holder = c()
    # Going over all the columns other than "Country"
    for (col in 2:size) {
        # Saving column data
        data = df[,col]
        # Calculating sum
        holder[col-1] = sum(data)
        # Showing output
        if (hush) {
        }
        else {
            print(c('The total population of age group', colnames(df)[col], ' is', holder[col-1]))
        }
    }
    return(holder)
}

# Saving for question 3
results = groups(new)

print('---------')

# 3. Using a pie chart represent the total age distribution of the EU
# population.

# See question 2
pie(results[1:ncol(new)-1], colnames(new)[2:ncol(new)], main = 'Total Age Distribution of the EU')
# Managing memory
rm(new)

# 4. Using barplot represent the occupation distribution of the EU population
# i. As a percentage (%)
job = as.data.frame(read_xlsx("EurostatCensus2011.xlsx", sheet = 2))
# Removing non EU data
df = subset(job, job$`GEOGRAPHICAL AREA` != exclude)
# Managing memory
rm(job)

# Gettin occupation data
occ = groups(df, hush = TRUE)

# Initializing data structure
comparison = c()

# Comparing with population statistics
for (entry in 1:length(occ)) {
    relative = occ[entry]/result
    comparison[entry] = relative
}

barplot(comparison, main = 'Percentage distribution of EU occupation', names.arg = colnames(df)[2:ncol(df)], las=2)

# ii. In absolute values
# All the same without the fraction
absolute = c()
for (entry in 1:length(occ)) {
    absolute[entry] = occ[entry]
}

barplot(absolute, main = 'Percentage distribution of EU occupation', names.arg = colnames(df)[2:ncol(df)], las=2)

# 5. Using a pie chart represent the percentage of non-local EU population
# per continent of origin. 
final = as.data.frame(read_xlsx("EurostatCensus2011.xlsx", sheet = 3))
# Removing non EU countries
pruned = subset(final, final$`GEOGRAPHICAL AREA/COUNTRY OF CITIZENSHIP` != exclude)
# Managing memory
rm(final)


# pie()

dev.off()
