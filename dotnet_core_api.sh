#!/bin/bash

# Change this line with the name of the project you want
PROJECT_NAME='R3M_PROJECT_NAME'


dotnet new sln -n "${PROJECT_NAME}"
dotnet new webapi -o "${PROJECT_NAME}_WebApi" --no-restore
dotnet new classlib -o "${PROJECT_NAME}_ApiModels" --no-restore
dotnet new classlib -o "${PROJECT_NAME}_App" --no-restore
dotnet new classlib -o "${PROJECT_NAME}_Services" --no-restore
dotnet new classlib -o "${PROJECT_NAME}_ExternalServices" --no-restore
dotnet new classlib -o "${PROJECT_NAME}_Domain" --no-restore

dotnet add "${PROJECT_NAME}_WebApi" reference "${PROJECT_NAME}_ApiModels"
dotnet add "${PROJECT_NAME}_WebApi" reference "${PROJECT_NAME}_App"

dotnet add "${PROJECT_NAME}_App" reference "${PROJECT_NAME}_Services"
dotnet add "${PROJECT_NAME}_App" reference "${PROJECT_NAME}_Domain"

dotnet add "${PROJECT_NAME}_Services" reference "${PROJECT_NAME}_Domain"
dotnet add "${PROJECT_NAME}_Services" reference "${PROJECT_NAME}_ExternalServices"

dotnet sln add "${PROJECT_NAME}_WebApi"
dotnet sln add "${PROJECT_NAME}_ApiModels" 
dotnet sln add "${PROJECT_NAME}_App" 
dotnet sln add "${PROJECT_NAME}_Services" 
dotnet sln add "${PROJECT_NAME}_ExternalServices" 
dotnet sln add "${PROJECT_NAME}_Domain"

dotnet restore
