FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /sevilla
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release

FROM mcr.microsoft.com/dotnet/aspnet:6.0
COPY --from=build /output/ /app
WORKDIR /app
ENTRYPOINT [ "dotnet", "AspNetCoreOnDocker.dll" ]
