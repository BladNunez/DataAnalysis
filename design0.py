#import required libaries
import matplotlib.pyplot as plt
import pandas as pd 

#read into CSV file and get sepal length and width
sepal_length_width = ["sepallength" , "sepalwidth", "class", "petallength","petalwidth"]
data_frame = pd.read_csv('iris.csv' , usecols=sepal_length_width)

#size the first plot
plt.rcParams["figure.figsize"] = [7.50, 3.50]
plt.rcParams["figure.autolayout"] = True

#slice data set into sections of (setosa,virginica,versicolor)
setosa = data_frame[0:50]
versicolor = data_frame[50:99]
virginica = data_frame[100:150]

#use scatter plot to plot all widths/length of each flower 
plt.scatter(setosa['sepalwidth'],setosa['sepallength'], marker='>',color='red',label='Iris-Setosa')
plt.scatter(versicolor['sepalwidth'],versicolor['sepallength'], color='blue',label='Iris-Versicolor')
plt.scatter(virginica['sepalwidth'],virginica['sepallength'], marker='p',color='green',label='Iris-Virginica')

#label charts and show it
plt.xlabel("Sepal Width Cm (X-Axis)")
plt.ylabel("Sepal Length Cm (Y-Axis)")
plt.title("Sepal Length Vs Width")
plt.legend()
plt.savefig('sepals.png')
plt.savefig('sepals.pdf')


#Second chart (subplots)
fig , (ax1, ax2, ax3) = plt.subplots(nrows=1 , ncols=3)

#plot setosa petal width/length in subplot
ax1.plot(setosa['petalwidth'],setosa['petallength'], marker='>',color='red',label='Iris-Setosa')
ax1.set_xlabel("Petal Width Cm (X-Axis)")
ax1.set_ylabel("Petal Length Cm (Y-Axis)")
ax1.set_title("Petal Length Vs Width")
ax1.legend()

#plot versicolor petal width/length in subplot
ax2.plot(versicolor['petalwidth'],versicolor['petallength'],marker='o',color='blue',label='Iris-Versicolor')
ax2.set_xlabel("Petal Width Cm (X-Axis)")
ax2.set_ylabel("Petal Length Cm (Y-Axis)")
ax2.set_title("Petal Length Vs Width")
ax2.legend()

#plot virginica petal width/length in subplot
ax3.plot(virginica['petalwidth'],virginica['petallength'], marker='p',color='green',label='Iris-Virginica')
ax3.set_xlabel("Petal Width Cm (X-Axis)")
ax3.set_ylabel("Petal Length Cm (Y-Axis)")
ax3.set_title("Petal Length Vs Width")
ax3.legend()

#save petal image of subplots
plt.savefig('petals.png')
plt.savefig('petals.pdf')
plt.tight_layout()
plt.show()



