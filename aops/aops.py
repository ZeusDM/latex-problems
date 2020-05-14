from bs4 import BeautifulSoup
from os import listdir
import os

def main(page, filename):
    soup = BeautifulSoup(page, features="lxml")

    idk = soup.find_all('div', class_= "cmty-view-posts-item")

    for block in idk:
        text = block.find_all("div", class_="cmty-view-post-item-text")
        label = block.find_all("div", class_="cmty-view-post-item-label")
        if len(label) > 0:
            if label[0].string != None:
                question(text, label[0].string, filename)
    return 0;

def fix(result):
    Result = []

    noParagraphEnv = False
    hyphen = False
    for x in result:
        x = x.replace("&gt;",">")
        x = x.replace("&lt;","<")
        x = x.replace("&amp;","&")
        x = x.replace("[asy]", "\\begin{center}\\begin{asy}")
        x = x.replace("[/asy]", "\\end{asy}\\end{center}")

        if noParagraphEnv:
            x = x.replace("\n", "")
        
        if x == "." or x == " ." or x == ". " or x == " . ":
            x = Result.pop()
            Result.append(x+".")
        elif x == "," or x == " ," or x == ", " or x == " , ":
            x = Result.pop()
            Result.append(x+", ")
        elif x == ")" or x == " )" or x == ") " or x == " ) ":
            x = Result.pop()
            Result.append(x+")")
        elif x == "?" or x == " ?" or x == "? " or x == " ? ":
            x = Result.pop()
            Result.append(x+"?")
        elif x == "\\[" or x == " \\[" or x == "\\[ " or x == " \\[ ":
            x = Result.pop()
            Result.append(x+"\\[")
            print("-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-o-")
        elif x == "\\]" or x == " \\]" or x == "\\] " or x == " \\] ":
            x = Result.pop()
            Result.append(x+"\]")
            print("-p-p-p-p-p-p-p-p-p-p-p-p-p-p-p-p-p-p-p-p-p-")
        elif x == "-":
            x = Result.pop()
            Result.append(x+"-")
            hyphen = True
        elif hyphen:
            y = Result.pop()
            Result.append(y+x)
            hyphen = False
        elif "Proposed" not in x and "Author" not in x:
            Result.append(x)
        if "\\[" in x:
            noParagraphEnv = True
            x = x.replace("\n", "")
        if "\\]" in x:
            noParagraphEnv = False
    return Result



def question(text, label, filename):
    print(filename + " - " + label)
    text = str(text[0])
    result = []
    opening = []
    closing = []
    for x in range(len(text)):
        if text[x] == "<":
            opening += [x]
        elif text[x] == ">":
            closing += [x]
    for x in range(len(opening)-1):
        inside  = text[opening[x]+1:closing[ x ]]
        outside = text[closing[x]+1:opening[x+1]]
        if "alt" in inside:
            result.append(inside[inside.find('"')+1:inside.find('"',inside.find('"')+1)])
        if outside != "" and outside != "\n":
            result.append(outside)
    result = fix(result)
    numero = label #bodge for hmmt exams
    while os.path.exists(filename + "/" + label + "/"):
        try:
            label = "x/" + label #bodge for hmmt exams
            #label = str(int(label)+1)
        except:
            label += "x"
    os.makedirs(os.path.dirname(filename + "/" + label + "/")) #exist_ok = True
    with open(filename + "/" + label + "/" + "problem_en.tex", "w+") as f:
        for x in result:
            f.write(x) 
    with open(filename + "/" + label + "/" + "number.tex", "w+") as f:
        f.write(numero) #bodge for hmmt exams
        #f.write(label)
    return 0;

def doit(file):
    with open(file + ".html", "r") as f:
        page = f.readlines()
    page = "\n".join(page)
    folder = file.replace("-", "/")
    result = main(page, folder)
    #with open(file + ".tex", "w+") as f:
    #    for x in result:
    #        f.write(x)
    #os.remove(file + ".html")

files = listdir(".")
txt = []

for x in files:
    if x.endswith(".html"):
        txt += [x[0:len(x)-5]]

for x in txt:
    doit(x)
