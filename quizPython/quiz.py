import mysql.connector
import requests
import json
import html
import urllib
import urllib.parse as urlparse
from urllib.parse import urlencode

url1="https://opentdb.com/api.php?"



mydb=mysql.connector.connect(host="localhost",user="ganesh",passwd="123456")
def getDataFromUrl(category, difficulty , amount , typeQuestions):
    dataUrl=url1+"amount="+amount+"&category="+category+"&difficulty="+difficulty+"&type="+typeQuestions
    print(dataUrl)
    data=requests.get(dataUrl).json()
    return data

def parseJsonToList(data):
    listReturn=[]
    results=data["results"]
    for a in results:
        question=a["question"]
        answer=a["correct_answer"]
        options=a["incorrect_answers"]
        option1=options[0]
        option2=options[1]
        option3=options[2]
        item={"question":question,"answer":answer,"option1":option1,"option2":option2,"option3":option3}
        listReturn.append(item)
    return listReturn


def returnListNames(mycursor):
    a = list(mycursor)
    listReturn=[]
    for x in a:
        itemlist=list(x)
        item=itemlist[0]
        listReturn.append(item)
    return listReturn


def checkExistence(name,type):
    mycursor=mydb.cursor()
    mycursor.execute("show "+type)
    items=returnListNames(mycursor)
    if name in items:
        return True

def _storeInTable(table_name,data):
    mycursor=mydb.cursor()
    mycursor.execute("create table "+table_name+"(question varchar(100), option1 varchar(50), option2 varchar(50),option3 varchar(50),answer varchar(50))")
    listQuestions=parseJsonToList(data)
    for a in listQuestions:
        question=html.unescape(a["question"])
        option1=html.unescape( a["option1"])
        option2=html.unescape( a["option2"])
        option3=html.unescape( a["option3"])
        answer=html.unescape(a["answer"])
        val=[question,option1,option2,option3,answer]
        query="insert into "+table_name+" (question,option1,option2,option3,answer) values (%s,%s,%s,%s,%s);"
        mycursor.execute(query,val)
    mydb.commit()
    print("records inserted")

def saveDataToDatabase(data,database_name,table_name):
    mycursor=mydb.cursor()
    
    #Check if database exists if exists then use else create 
    if checkExistence(database_name,"databases"):
        #database exists using the same
        mycursor.execute("use "+database_name)
        if checkExistence(table_name,"tables"):
            #table exists dropping table
            mycursor.execute("drop table "+table_name)
            #new table creating and saving data
            _storeInTable(table_name,data)
        else:
            #new table creating and saving data
            _storeInTable(table_name,data)        
    else:
        #database creating 
        mycursor.execute("create database "+database_name)
        #new table creating and saving data
        _storeInTable(table_name,data)




saveDataToDatabase(getDataFromUrl("17","hard","41","multiple"),"trivia_db","science_hard_multiple")
saveDataToDatabase(getDataFromUrl("22","hard","42","multiple"),"trivia_db","geography_hard_multiple")
saveDataToDatabase(getDataFromUrl("23","hard","46","multiple"),"trivia_db","history_hard_multiple")
saveDataToDatabase(getDataFromUrl("20","hard","7","multiple"),"trivia_db","mythology_hard_multiple")
saveDataToDatabase(getDataFromUrl("11","hard","28","multiple"),"trivia_db","films_hard_multiple")
saveDataToDatabase(getDataFromUrl("21","hard","9","multiple"),"trivia_db","sports_hard_multiple")
saveDataToDatabase(getDataFromUrl("18","hard","22","multiple"),"trivia_db","computers_hard_multiple")

