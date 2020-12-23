package Cx

CxPolicy [ result ] {
  resource := input.document[i].command[name]
  cmdInst := [x | resource[j].Cmd == "cmd"; x := resource[j]]
  count(cmdInst) > 1


	result := {
                "documentId": 		input.document[i].id,
                "searchKey": 	    sprintf("FROM={{%s}}.{{%s}}", [name, cmdInst[0].Original]),
                "issueType":		"RedundantAttribute",  #"MissingAttribute" / "RedundantAttribute"
                "keyExpectedValue": "There is only one CMD instruction",
                "keyActualValue": 	sprintf("There are %d CMD instructions", [count(cmdInst)])
              }
}