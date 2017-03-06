# Author's name          : Avinita Mohanty
# AndrewId               : avinitam
# Original Creation Date : 5 Mar 2017
# Last Modification Date : 5 Mar 2017
# Description            : Python Problem Statement

# Given an array of words and a length L, format the text such that each line has exactly L characters
# and is fully justified on both the left and the right. Words should be packed in a greedy approach;
# that is, pack as many words as possible in each line. Add extra spaces when necessary so that each
# line has exactly L characters.
#
# Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a
# line does not divide evenly between words, the empty slots on the left will be assigned more spaces than
# the slots on the right. For the last line of text and lines with one word only, the words should be left
# justified with no extra space inserted between them.


import datetime
import time



def user_Input():
    global response
    response = int(input("Enter the size of L"))
    userTextInput = input("Enter the string to be justified")
    global words
    words = userTextInput.split()

#words = ["This", "is", "an", "example", "of", "text", "justification."]
#response = 16


def alignment(words,response):
    currentList = []
    cummulativeLength = 0
    cleanList = []
    for word in words:
        cummulativeLength_temp = len(word) + len(currentList) + cummulativeLength
        if cummulativeLength_temp > response:
            if len(currentList) == 1:
                currentList.ljust(response, " ")
                cleanList.append(currentList)
            else:
                spaceCalculation, extraSpace = divmod((response - cummulativeLength) , len(currentList) - 1)
                result = ""
                for i in range(extraSpace):
                    currentList[i] += " "
                result = (" " * spaceCalculation).join(currentList)
                cleanList.append(result)
            currentList = []
            cummulativeLength = 0
        currentList.append(word)
        cummulativeLength += len(word)
    cleanList.append("".join(currentList).ljust(response, " "))
    print(cleanList)
    for strin in cleanList:
        print(strin, "\n")

def main():
    user_Input()
    startTime = datetime.datetime.now()
    if (not((len(words) >= 1 ) and (len(words) <= 150))):
        print("Your string of word should be of size between 1 to 150!! Exiting. . .")
    else:
        flag = False
        for word in words:
            if len(word) > response:
                flag = True
                break
        if flag == False:
            alignment(words,response)
        else:
            print("Length of one of the words is more than the sentence length")
    endTime = datetime.datetime.now()
    print("Time taken: ", (endTime-startTime)/1000000)
main()