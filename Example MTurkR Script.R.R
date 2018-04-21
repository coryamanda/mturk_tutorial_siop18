
#Replace the ID and secret with those unique to your specific account
Sys.setenv(AWS_ACCESS_KEY_ID = "")
Sys.setenv(AWS_SECRET_ACCESS_KEY = "")
library(MTurkR)

AccountBalance()

#Create HIT returns a unique ID for that specific HIT
CreateHIT(hit.type = "ExampleHITType",
          hitlayoutid = "ExampleLayoutID",
          expiration = 3600,
          assignments = 5)


#Checks the status of the HIT
HITStatus("ExampleHITID")

#Returns any existing data from the HIT
mydata <- GetAssignment(hit = "ExampleHITID")

#Subsets the data returned to include the Assignment and Worker data and the 
#Workers response to the question
mydata[,c("AssignmentId", "WorkerId","Color")]

#Approve valid assignments
ApproveAssignment(assignments = mydata$AssignmentId,
                  feedback = "Thank you so much for answering our question! Have a great day.")

#Take the time to thank workers
ContactWorker(subjects = "Thanks for your contribution",
              msgs = "You're the best! We really appreciate your time.",
              workers = mydata$WorkerId)

#Give the Workers who completed a qualification so you can manage your pool
AssignQualification(qual = "QualID",
                    workers = mydata$WorkerId,
                    value = "100",
                    notify = FALSE)

