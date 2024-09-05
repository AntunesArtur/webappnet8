# Use the .NET SDK image to build and run the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
# Set the working directory
WORKDIR /app
# Copy everything to the container
COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release -o /app/out
 
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "WebAppnet8.dll"]
 
EXPOSE 8080