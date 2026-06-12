net stop "Apache Tomcat 7.0 Tomcat7"

mvn clean package org.apache.maven.plugins:maven-war-plugin:3.4.0:war "-Dmaven.buildNumber.doCheck=false" "-Dmaven.buildNumber.doUpdate=false" "-DskipTests"

Remove-Item -Recurse -Force "C:\Program Files\Apache Software Foundation\Tomcat 7.0\webapps\ZY"
Remove-Item -Force "C:\Program Files\Apache Software Foundation\Tomcat 7.0\webapps\ZY.war"
copy "C:\Users\user\Desktop\task\PretendYoureXyzzy\target\ZY.war" "C:\Program Files\Apache Software Foundation\Tomcat 7.0\webapps\"

net start "Apache Tomcat 7.0 Tomcat7"

Write-Host "Deploy concluído! Acesse http://localhost:8080/ZY"