
Set-Location "C:\Program Files\Octopus Deploy\Tentacle"

.\Tentacle.exe create-instance --instance "Tentacle" --config "D:\Octopus\Tentacle.config" --console
.\Tentacle.exe new-certificate --instance "Tentacle" --if-blank --console
.\Tentacle.exe configure --instance "Tentacle" --reset-trust --console
.\Tentacle.exe configure --instance "Tentacle" --home "D:\Octopus" --app "D:\Octopus\Applications" --port "10933" --console
.\Tentacle.exe configure --instance "Tentacle" --trust "${octopus_trust}" --console
.\Tentacle.exe register-with --instance "Tentacle" --server "https://octopus.deploy.photoconnector.net" --apiKey="${octopus_apikey}" --role "${octopus_role1}" --role "${octopus_role2}" --role "${octopus_role3}" "--environment "${octopus_environment}" --comms-style TentaclePassive --console
.\Tentacle.exe service --instance "Tentacle" --install --start --console