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
# import time

def user_Input():
    global response                                 #response variable is globally declared
    response = int(input("Enter the size of L"))    #User inputs the size of L i.e. the number of characters to be packed in one sentence
    userTextInput = input("Enter the string to be justified")       #User input for array.string of words to be packed
    global words
    words = userTextInput.split()                   #The userTextInput is separated by " ". After split , it is stored in a list

#words = ["This", "is", "an", "example", "of", "text", "justification."]        #Test Case
#response = 16


def alignment(words,response):
    currentList = []                                #currentList is a list containing the word/s in a sentence at any given point of iteration
    cummulativeLength = 0                           #Integer counter for cummulative at any given point of iteration
    cleanList = []                                  #The resultant sentences are stored in a list called cleanList
    for word in words:                              #Iterating each word(string counter) in the list words
        cummulativeLength_temp = len(word) + (len(currentList)-1) + cummulativeLength   #Preparing a temporary variable to ensure the character length in each sentence is less than "response"(i.e. L)
        if cummulativeLength_temp > response:       #if the content length(space and letters) has exceeded the desired L/response count
            if len(currentList) == 1:               #For Lists that contain single element in a sentence
                currentList.ljust(response, " ")    #Left allign the element and pad with " " characters till the length of L/response is reached
                cleanList.append(currentList)       #Append to the final list to display
            else:
                spaceCalculation, extraSpace = divmod((response - cummulativeLength) , len(currentList) - 1) # divmod() returns the evenly distributed spacing count for each of the words and the reminder after the division i.e. the extra spaces left which we have to pad again
                result = ""                         #Initializing a string variable
                for i in range(extraSpace):         #Allocating the extraspaces starting from the left index
                    currentList[i] += " "
                result = (" " * spaceCalculation).join(currentList)     #String join
                cleanList.append(result)            #Appending the string to cleanList list for display
            currentList = []                        #Resetting the final list for the sentence after execution of each sentence.
            cummulativeLength = 0                   #Resetting the counter after execution of each sentence.
        currentList.append(word)                    #Add the word to the current list if cummulativeLength_temp is not greater than response
        cummulativeLength += len(word)              #Add the length of each word to the cummulativeLength variable
    cleanList.append(" ".join(currentList).ljust(response, " "))     #Need to fix
    print(cleanList)                                #Print the cleanList variable
    for strin in cleanList:
        print(strin, "\n")

def main():
    user_Input()                                    #Calling the function for user inputs
    startTime = datetime.datetime.now()             #To calculate the start time execution. Import_required : datetime
    if (not((len(words) >= 1 ) and (len(words) <= 150))):       #Constraint: Constraints:  1 ≤ words.length ≤ 150
        print("Your string of word should be of size between 1 to 150!! Exiting. . .")
    else:
        flag = False
        for word in words:
            if len(word) > response:                #Constraint: 0 ≤ words[i].length ≤ L
                flag = True
                break
        if flag == False:                           #If all the above condtions are passed, then proceed. Else, exit.
            alignment(words,response)
        else:
            print("Length of one of the words is more than the sentence length")
    endTime = datetime.datetime.now()
    print("Time taken: ", (endTime-startTime)/1000000)          #The time taken for the execution in h:mm:ss. Allowance for 4s as per the problem statement
main()                                                      #Calling main()
