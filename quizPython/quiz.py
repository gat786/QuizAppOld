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

def parseJsonToList(data,typeData):
    listReturn=[]
    results=data["results"]
    if typeData=="multiple":
        for a in results:
            question=a["question"]
            answer=a["correct_answer"]
            options=a["incorrect_answers"]
            option1=options[0]
            option2=options[1]
            option3=options[2]
            item={"question":question,"answer":answer,"option1":option1,"option2":option2,"option3":option3}
            listReturn.append(item)
    else:
        for a in results:
            question=a["question"]
            answer=a["correct_answer"]
            item={"question":question,"answer":answer}
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


def checkExistence(name,typeData):
    mycursor=mydb.cursor()
    mycursor.execute("show "+typeData)
    items=returnListNames(mycursor)
    if name in items:
        return True

def _storeInTable(table_name,data,typeData):
    mycursor=mydb.cursor()
    mycursor.execute("create table "+table_name+"(question varchar(200), option1 varchar(100), option2 varchar(100),option3 varchar(100),answer varchar(100))")
    listQuestions=parseJsonToList(data,typeData)
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

def saveDataToDatabase(data,database_name,table_name,typeData):
    mycursor=mydb.cursor()
    
    #Check if database exists if exists then use else create 
    if checkExistence(database_name,"databases"):
        #database exists using the same
        mycursor.execute("use "+database_name)
        if checkExistence(table_name,"tables"):
            #table exists dropping table
            mycursor.execute("drop table "+table_name)
            #new table creating and saving data
            _storeInTable(table_name,data,typeData)
        else:
            #new table creating and saving data
            _storeInTable(table_name,data,typeData)        
    else:
        #database creating 
        mycursor.execute("create database "+database_name)
        #new table creating and saving data
        _storeInTable(table_name,data,typeData)



def saveMultiple():
    typeData="multiple"
    saveDataToDatabase(getDataFromUrl("17","easy","43",typeData),"trivia_db","science_easy"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("22","easy","50",typeData),"trivia_db","geography_easy"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("23","easy","35",typeData),"trivia_db","history_easy"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("20","easy","12",typeData),"trivia_db","mythology_easy"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("11","easy","50",typeData),"trivia_db","films_easy"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("21","easy","13",typeData),"trivia_db","sports_easy"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("18","easy","29",typeData),"trivia_db","computers_easy"+typeData,typeData)


    saveDataToDatabase(getDataFromUrl("17","medium","50",typeData),"trivia_db","science_medium"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("22","medium","50",typeData),"trivia_db","geography_medium"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("23","medium","50",typeData),"trivia_db","history_medium"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("20","medium","15",typeData),"trivia_db","mythology_medium"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("11","medium","50",typeData),"trivia_db","films_medium"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("21","medium","32",typeData),"trivia_db","sports_medium"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("18","medium","48",typeData),"trivia_db","computers_medium"+typeData,typeData)

    saveDataToDatabase(getDataFromUrl("17","hard","41",typeData),"trivia_db","science_hard"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("22","hard","42",typeData),"trivia_db","geography_hard"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("23","hard","46",typeData),"trivia_db","history_hard"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("20","hard","7",typeData),"trivia_db","mythology_hard"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("11","hard","28",typeData),"trivia_db","films_hard"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("21","hard","9",typeData),"trivia_db","sports_hard"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("18","hard","22",typeData),"trivia_db","computers_hard"+typeData,typeData)

def saveBoolean():
    typeData="boolean"
    saveDataToDatabase(getDataFromUrl("17","easy","43",typeData),"trivia_db","science_easy"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("22","easy","50",typeData),"trivia_db","geography_easy"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("23","easy","35",typeData),"trivia_db","history_easy"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("20","easy","12",typeData),"trivia_db","mythology_easy"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("11","easy","50",typeData),"trivia_db","films_easy"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("21","easy","13",typeData),"trivia_db","sports_easy"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("18","easy","29",typeData),"trivia_db","computers_easy"+typeData,typeData)


    saveDataToDatabase(getDataFromUrl("17","medium","50",typeData),"trivia_db","science_medium"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("22","medium","50",typeData),"trivia_db","geography_medium"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("23","medium","50",typeData),"trivia_db","history_medium"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("20","medium","15",typeData),"trivia_db","mythology_medium"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("11","medium","50",typeData),"trivia_db","films_medium"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("21","medium","32",typeData),"trivia_db","sports_medium"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("18","medium","48",typeData),"trivia_db","computers_medium"+typeData,typeData)

    saveDataToDatabase(getDataFromUrl("17","hard","41",typeData),"trivia_db","science_hard"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("22","hard","42",typeData),"trivia_db","geography_hard"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("23","hard","46",typeData),"trivia_db","history_hard"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("20","hard","7",typeData),"trivia_db","mythology_hard"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("11","hard","28",typeData),"trivia_db","films_hard"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("21","hard","9",typeData),"trivia_db","sports_hard"+typeData,typeData)
    saveDataToDatabase(getDataFromUrl("18","hard","22",typeData),"trivia_db","computers_hard"+typeData,typeData)