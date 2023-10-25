#Import pandas and matplotlib libaries 
import matplotlib.pyplot as plt
import pandas as pd

#use specific columns in data and load data into df
airline_data = ["Country","Airlinepassengerscarried","Year"]
data_frame = pd.read_csv('airline.csv' , usecols=airline_data)


#Begin to clean data check if any missing values
#print(data_frame.isnull()) No missing values

#Check for any duplicate values
#print(data_frame.duplicated().all()) No duplicated values

# Convert Passengers Carried column from object -> ints
data_frame = data_frame.convert_dtypes()
data_frame['Airlinepassengerscarried'] = data_frame['Airlinepassengerscarried'].str.replace(',', '')
data_frame["Airlinepassengerscarried"]=data_frame["Airlinepassengerscarried"].astype(int)

#Save cleaned csv to new file to be handled
data_frame.to_csv('airline2.csv', index=False)
cleaned_data_frame = pd.read_csv('airline2.csv', usecols=airline_data)

#Find mean,median,mode of passengers carried data
passengers_carried_mean = cleaned_data_frame["Airlinepassengerscarried"].mean()
passengers_carried_median = cleaned_data_frame["Airlinepassengerscarried"].median()
passengers_carried_mode = cleaned_data_frame["Airlinepassengerscarried"].mode()

# Plot top 5 countrys and # of passengers carried in 2021
us_country = cleaned_data_frame["Country"][0]
china_country = cleaned_data_frame["Country"][1]
russia_country = cleaned_data_frame["Country"][2]
india_country = cleaned_data_frame["Country"][3]
ireland_country = cleaned_data_frame["Country"][4]

#Create list of colors to pass to each bar column
color_list = ['b', 'r','y', 'g']

#create x,y axis of country with passenger carried data as y-axis
x_axis = ([us_country,china_country,russia_country,india_country,ireland_country])
y_axis = ([cleaned_data_frame["Airlinepassengerscarried"][0],cleaned_data_frame["Airlinepassengerscarried"][1],
           cleaned_data_frame["Airlinepassengerscarried"][2], cleaned_data_frame["Airlinepassengerscarried"][3],
            cleaned_data_frame["Airlinepassengerscarried"][4] ])

#Label and plot bar plot
plt.bar(x_axis,y_axis,color=color_list)
plt.title("Passengers carried by plane in 2021")
plt.xlabel("Top 5 Countrys")
plt.ylabel("Number of passengers (Hundred Million)")
plt.show()


