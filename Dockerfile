FROM openjdk:windowsservercore
RUN setx /M JAVA_OPTS $('-Xms256m -Xmx512m')
#RUN SET JAVA_OPTS="-Xms256m -Xmx512m"
RUN echo '$wc = New-Object System.Net.WebClient'  >> C:\setup.ps1 ; echo '$url = \"http://10.16.86.137:8085/admin/agent/bamboo-agent-6.2.1.jar\"' >> C:\setup.ps1 ; echo '$wc.DownloadFile($url,\"C:\bamboo-agent.jar\")' >> C:\setup.ps1 
RUN echo 'java -jar bamboo-agent.jar http://10.16.86.137:8085/agentServer/' >> C:\startup.ps1
RUN echo 'java -jar bamboo-agent.jar http://10.16.86.137:8085/agentServer/' >> C:\startup.ps1
RUN C:\setup.ps1 
CMD powershell ./startup.ps1
