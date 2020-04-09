{
  "Version": "2012-10-17",
  "Statement": [
  %{ for statement in policy_statements ~}
    {
      "Effect": "${statement["Effect"]}",
      %{ if contains(keys(statement),"Principal") == true}
      "Principal": "${statement["Principal"]}",
      %{ endif ~}
      "Action": [
        %{ for action in statement["Action"] ~}
        "${action}"%{ if index(statement["Action"], action) < length(statement["Action"]) - 1},%{ endif ~}
        %{ endfor ~}
      ],
      "Resource": "${resource}"
      %{ if contains(keys(statement),"Condition") == true}
      ,
      "Condition": {
        %{ for condition in keys(statement["Condition"]) ~}
        "${condition}" : {
          %{ for attribute in keys(statement["Condition"][condition]) ~}
            "${attribute}": "${statement["Condition"][condition][attribute]}"
          %{ endfor ~}
        }
        %{ endfor ~}
      }
      %{ endif ~}
    }%{ if index(policy_statements, statement) < length(policy_statements) - 1},%{ endif ~}
  %{ endfor ~}
  ]
}