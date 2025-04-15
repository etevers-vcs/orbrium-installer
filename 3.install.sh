#!/bin/bash


WORKING_PATH=$(realpath $0)
WORKING_DIR=$(dirname $WORKING_PATH)
source $WORKING_DIR/stage.profile

EPOCH_TIME=$(date +%s)
CONF_INI="$WORKING_DIR/$EPOCH_TIME.ini"
CONF_BIN="W2RlZmF1bHRdCnRpdGxlID0gT3Jicml1bQp0ZW5hbnQgPSBvcmJyaXVtCmRvbWFpbiA9ICRERUZBVUxUX0RPTUFJTgplbmRwb2ludCA9ICRERUZBVUxUX0VORFBPSU5UCm9yaWdpbnMgPSBodHRwczovLyRERUZBVUxUX0VORFBPSU5UCgp1aV9yb3V0ZXIgPSBjbGllbnQKCmRhdGFiYXNlID0gcHlnbWEKCnZlcnNpb24gPSAxCnN0YWdlID0gJERFRkFVTFRfU1RBR0UKZGVidWcgPSAkREVGQVVMVF9ERUJVRwoKc3lzdGVtX2FjY2Vzc19rZXkgPSAkU1lTVEVNX0FDQ0VTU19LRVkKc3lzdGVtX3NlY3JldF9rZXkgPSAkU1lTVEVNX1NFQ1JFVF9LRVkKYWRtaW5fdXNlcm5hbWUgPSAkREVGQVVMVF9BRE1JTl9VU0VSTkFNRQphZG1pbl9wYXNzd29yZCA9ICRERUZBVUxUX0FETUlOX1BBU1NXT1JECmFkbWluX2dyb3VwID0gQWRtaW5pc3RyYXRvcnMKYWRtaW5fcm9sZSA9IGFkbWluCnVzZXJfZ3JvdXAgPSBVc2Vycwp1c2VyX3JvbGUgPSB1c2VyCgpoZWFsdGhfY2hlY2tfaW50ZXJ2YWwgPSA1CmhlYWx0aF9jaGVja190aW1lb3V0ID0gMgpoZWFsdGhfY2hlY2tfcmV0cmllcyA9IDMKCm1vZHVsZXMgPSBsZGFwLCBwb3N0Z3Jlc3FsLCBlbGFzdGljc2VhcmNoLCByZWRpcywga2V5Y2xvYWssIG1pbmlvLCBndWFjZCwgZ3VhY2Ftb2xlLCBjb3JlLCBhY2NvdW50LCByb3V0ZXIsIHRvb2wsIHNlY3JldCwgY2xvdWQsIGFjb2wsIGFwcngsIGJpbnQsIG5naW54CnByb3hpZXMgPSBjb3JlLCBhY2NvdW50LCByb3V0ZXIsIHRvb2wsIHNlY3JldCwgY2xvdWQsIGFjb2wsIGFwcngsIGJpbnQKCltkZWZhdWx0OmFjbF0KVXNlciA9IHIKR3JvdXAgPSByCmluZm8uUHVibGljID0gcgppbmZvLlJlc3RyaWN0ID0gY3J1ZAppbmZvLlByaXZhdGUgPSBjcnVkCmJvYXJkLkFubm91bmNlbWVudCA9IHIKYm9hcmQuTm90aWZpY2F0aW9uID0gcgpib2FyZC5Hcm91cE1lbW8gPSBjcnVkCmJvYXJkLlVzZXJNZW1vID0gY3J1ZApwdWJzLlBhcnR5ID0gY3J1ZApwdWJzLk1lbWJlciA9IHJ1CnB1YnMuQ29udGVudCA9IGNydWQKZGF0YS5Hcm91cEJ1Y2tldCA9IGNydWQKZGF0YS5Vc2VyQnVja2V0ID0gY3J1ZAoKb3JnLkVuZHBvaW50ID0gcgpvcmcuQXBwcm92YWwgPSBydQpvcmcuUmVxdWVzdCA9IHIKcmVnaW9uLlByb2plY3QgPSByCnJlZ2lvbi5EZXBsb3ltZW50ID0gcgpyZWdpb24uUmVzb3VyY2UgPSByCgpbZGVmYXVsdDpyZXN0cmljdF0KdXNlcnMgPSB7aW5pWydkZWZhdWx0LmFkbWluX3VzZXJuYW1lJ119LCBzeXN0ZW0KZ3JvdXBzID0gYWRtaW4sIEFkbWluLCBBZG1pbmlzdHJhdG9ycywgdXNlciwgVXNlcnMsIGNvbnNvbGVBZG1pbiwgZGlhZ25vc3RpY3MsIHJlYWRvbmx5LCB3cml0ZW9ubHksIHJlYWR3cml0ZQoKW2RlZmF1bHQ6c210cF0KaG9zdG5hbWUgPSAkU01UUF9IT1NUTkFNRQpob3N0cG9ydCA9ICRTTVRQX0hPU1RQT1JUCnVzZXJuYW1lID0gJFNNVFBfVVNFUk5BTUUKcGFzc3dvcmQgPSAkU01UUF9QQVNTV09SRAp0bHMgPSAkU01UUF9UTFMKc3NsID0gJFNNVFBfU1NMCgoKIyBDTE9VRCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCltjbG91ZF0KaG9zdG5hbWUgPSBjbG91ZApob3N0YWRkciA9IDAuMC4wLjAKaG9zdHBvcnQgPSA4MDgwCmhlYWx0aGNoZWNrID0gdHJ1ZQoKd29ya2VycyA9IDQKCndzYV9hZG1pbl91c2VybmFtZSA9ICRXU0FfQURNSU5fVVNFUk5BTUUKd3NhX2FkbWluX3Bhc3N3b3JkID0gJFdTQV9BRE1JTl9QQVNTV09SRAp3c2FfaG9zdG5hbWUgPSAkV1NBX0hPU1ROQU1FCndzYV9jbGllbnRfaWQgPSAkV1NBX0NMSUVOVF9JRAp3c2FfY2xpZW50X3NlY3JldCA9ICRXU0FfQ0xJRU5UX1NFQ1JFVAp3c2FfYXV0b19jbGllbnRfcHJlZml4ID0gcHJlbHVkZS11c2VyLQoKY2xvdWRfZG9tYWluID0gJENMT1VEX0RPTUFJTgphZG1pbl9wcm9qZWN0ID0gJEFETUlOX1BST0pFQ1QKcHJpbWVfcHJvamVjdCA9ICRQUklNRV9QUk9KRUNUCnN5bmNfaW50ZXJ2YWwgPSA2MDAKc3luY19yZXN0YXJ0X2ludGVydmFsID0gNjAKCltjbG91ZDpyZXNvdXJjZV90eXBlc19hbmRfcmVzdHJpY3RfYWN0aW9uc10KQ2xvdWQudlNwaGVyZS5NYWNoaW5lID0gQ2xvdWQudlNwaGVyZS5NYWNoaW5lLlVwZGF0ZS5UYWdzLCBDbG91ZC52U3BoZXJlLk1hY2hpbmUuUmVzZXQsIENsb3VkLnZTcGhlcmUuTWFjaGluZS5SZWJ1aWxkLCBDbG91ZC52U3BoZXJlLk1hY2hpbmUuVW5yZWdpc3RlciwgQ2xvdWQudlNwaGVyZS5NYWNoaW5lLkFwcGx5U2FsdENvbmZpZ3VyYXRpb24sIENsb3VkLnZTcGhlcmUuTWFjaGluZS5BdHRhY2hTYWx0U3RhY2tSZXNvdXJjZSwgQ2xvdWQudlNwaGVyZS5NYWNoaW5lLlJlbW90ZS5Db25zb2xlLCBDbG91ZC52U3BoZXJlLk1hY2hpbmUuQ2hhbmdlLlNlY3VyaXR5R3JvdXAKQ2xvdWQuTlNYLk5ldHdvcmsgPQpDbG91ZC5OU1guTG9hZEJhbGFuY2VyID0KQ2xvdWQuU2VjdXJpdHlHcm91cCA9CkNsb3VkLnZTcGhlcmUuRGlzayA9IENsb3VkLnZTcGhlcmUuRGlzay5EaXNrLkNoYW5nZS5EaXNwbGF5Lk5hbWUsIENsb3VkLnZTcGhlcmUuRGlzay5VcGRhdGUuVGFncwpDdXN0b20uUHJvamVjdCA9CkN1c3RvbS5WUEMgPQpDdXN0b20uQUlQID0KQ3VzdG9tLlBlZXJpbmcgPQpDdXN0b20uTkZTID0KQ3VzdG9tLkRTTURCID0KQ3VzdG9tLkt1YmVybmV0ZXMgPQoKW2Nsb3VkOmJ1aWxkXQppbWFnZSA9IGNvbW1vbjpiYXNlCnNjcmlwdCA9CglBREQge3NlY3Rpb24ucmVwbGFjZSgnOmJ1aWxkJywgJycpfSAvb3B0L3tzZWN0aW9uLnJlcGxhY2UoJzpidWlsZCcsICcnKX0KCUFERCB3ZWJjZXJ0IC9vcHQvd2ViY2VydAoJQUREIGNvbW1vbiAvb3B0L2NvbW1vbgoJQUREIGRyaXZlciAvb3B0L2RyaXZlcgoJQUREIHNjaGVtYSAvb3B0L3NjaGVtYQoJQUREIGNvbmZpZy5pbmkgL29wdC9jb25maWcuaW5pCglDTUQgWyJweXRob24iLCAie3NlY3Rpb24ucmVwbGFjZSgnOmJ1aWxkJywgJycpfSJdCglIRUFMVEhDSEVDSyBcCgkJLS1pbnRlcnZhbD17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja19pbnRlcnZhbCddfXMgXAoJCS0tdGltZW91dD17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja190aW1lb3V0J119cyBcCgkJLS1yZXRyaWVzPXtpbmlbJ2RlZmF1bHQuaGVhbHRoX2NoZWNrX3JldHJpZXMnXX0gXAoJCUNNRCBjdXJsIC1rIGh0dHBzOi8vbG9jYWxob3N0OjgwODAvaW50ZXJuYWwvaGVhbHRoIHx8IGV4aXQgMQoKI1tjbG91ZDptb3VudHNdCiNbY2xvdWQ6ZW52aXJvbm1lbnRdCiNbY2xvdWQ6cG9ydHNdCiNbY2xvdWQ6dm9sdW1lc10KCgojIEFVVE9NQVRJT04gQ09MTEVDVE9SICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKW2Fjb2xdCmhvc3RuYW1lID0gYWNvbApob3N0YWRkciA9IDAuMC4wLjAKaG9zdHBvcnQgPSA4MDgwCmhlYWx0aGNoZWNrID0gdHJ1ZQoKIyBkb24ndCBjaGFuZ2Ugd29ya2VycyBjb3VudAp3b3JrZXJzID0gMQoKW2Fjb2w6YnVpbGRdCmltYWdlID0gY29tbW9uOmJhc2UKc2NyaXB0ID0KCVJVTiBwaXAgaW5zdGFsbCAtLW5vLWNhY2hlLWRpciBwc3V0aWwKCUFERCB7c2VjdGlvbi5yZXBsYWNlKCc6YnVpbGQnLCAnJyl9IC9vcHQve3NlY3Rpb24ucmVwbGFjZSgnOmJ1aWxkJywgJycpfQoJQUREIHdlYmNlcnQgL29wdC93ZWJjZXJ0CglBREQgY29tbW9uIC9vcHQvY29tbW9uCglBREQgZHJpdmVyIC9vcHQvZHJpdmVyCglBREQgc2NoZW1hIC9vcHQvc2NoZW1hCglBREQgY29uZmlnLmluaSAvb3B0L2NvbmZpZy5pbmkKCUNNRCBbInB5dGhvbiIsICJ7c2VjdGlvbi5yZXBsYWNlKCc6YnVpbGQnLCAnJyl9Il0KCUhFQUxUSENIRUNLIFwKCQktLWludGVydmFsPXtpbmlbJ2RlZmF1bHQuaGVhbHRoX2NoZWNrX2ludGVydmFsJ119cyBcCgkJLS10aW1lb3V0PXtpbmlbJ2RlZmF1bHQuaGVhbHRoX2NoZWNrX3RpbWVvdXQnXX1zIFwKCQktLXJldHJpZXM9e2luaVsnZGVmYXVsdC5oZWFsdGhfY2hlY2tfcmV0cmllcyddfSBcCgkJQ01EIGN1cmwgLWsgaHR0cHM6Ly9sb2NhbGhvc3Q6ODA4MC9pbnRlcm5hbC9oZWFsdGggfHwgZXhpdCAxCgojW2Fjb2w6bW91bnRzXQojW2Fjb2w6ZW52aXJvbm1lbnRdCiNbYWNvbDpwb3J0c10KI1thY29sOnZvbHVtZXNdCgoKIyBBVVRPTUFUSU9OIFBST1hZICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjClthcHJ4XQpob3N0bmFtZSA9IGFwcngKaG9zdGFkZHIgPSAwLjAuMC4wCmhvc3Rwb3J0ID0gODA4MApoZWFsdGhjaGVjayA9IHRydWUKCndvcmtlcnMgPSA0CgpbYXByeDpidWlsZF0KaW1hZ2UgPSBjb21tb246YmFzZQpzY3JpcHQgPQoJQUREIHtzZWN0aW9uLnJlcGxhY2UoJzpidWlsZCcsICcnKX0gL29wdC97c2VjdGlvbi5yZXBsYWNlKCc6YnVpbGQnLCAnJyl9CglBREQgd2ViY2VydCAvb3B0L3dlYmNlcnQKCUFERCBjb21tb24gL29wdC9jb21tb24KCUFERCBkcml2ZXIgL29wdC9kcml2ZXIKCUFERCBzY2hlbWEgL29wdC9zY2hlbWEKCUFERCBjb25maWcuaW5pIC9vcHQvY29uZmlnLmluaQoJQ01EIFsicHl0aG9uIiwgIntzZWN0aW9uLnJlcGxhY2UoJzpidWlsZCcsICcnKX0iXQoJSEVBTFRIQ0hFQ0sgXAoJCS0taW50ZXJ2YWw9e2luaVsnZGVmYXVsdC5oZWFsdGhfY2hlY2tfaW50ZXJ2YWwnXX1zIFwKCQktLXRpbWVvdXQ9e2luaVsnZGVmYXVsdC5oZWFsdGhfY2hlY2tfdGltZW91dCddfXMgXAoJCS0tcmV0cmllcz17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja19yZXRyaWVzJ119IFwKCQlDTUQgY3VybCAtayBodHRwczovL2xvY2FsaG9zdDo4MDgwL2ludGVybmFsL2hlYWx0aCB8fCBleGl0IDEKCiNbYXByeDptb3VudHNdCiNbYXByeDplbnZpcm9ubWVudF0KI1thcHJ4OnBvcnRzXQojW2Fwcng6dm9sdW1lc10KCgojIEJVU0lORVNTIElOVEVHUkFUSU9OICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKW2JpbnRdCmhvc3RuYW1lID0gYmludApob3N0YWRkciA9IDAuMC4wLjAKaG9zdHBvcnQgPSA4MDgwCmhlYWx0aGNoZWNrID0gdHJ1ZQoKd29ya2VycyA9IDIKCltiaW50OmJ1aWxkXQppbWFnZSA9IGNvbW1vbjpiYXNlCnNjcmlwdCA9CglBREQge3NlY3Rpb24ucmVwbGFjZSgnOmJ1aWxkJywgJycpfSAvb3B0L3tzZWN0aW9uLnJlcGxhY2UoJzpidWlsZCcsICcnKX0KCUFERCB3ZWJjZXJ0IC9vcHQvd2ViY2VydAoJQUREIGNvbW1vbiAvb3B0L2NvbW1vbgoJQUREIGRyaXZlciAvb3B0L2RyaXZlcgoJQUREIHNjaGVtYSAvb3B0L3NjaGVtYQoJQUREIGNvbmZpZy5pbmkgL29wdC9jb25maWcuaW5pCglDTUQgWyJweXRob24iLCAie3NlY3Rpb24ucmVwbGFjZSgnOmJ1aWxkJywgJycpfSJdCglIRUFMVEhDSEVDSyBcCgkJLS1pbnRlcnZhbD17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja19pbnRlcnZhbCddfXMgXAoJCS0tdGltZW91dD17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja190aW1lb3V0J119cyBcCgkJLS1yZXRyaWVzPXtpbmlbJ2RlZmF1bHQuaGVhbHRoX2NoZWNrX3JldHJpZXMnXX0gXAoJCUNNRCBjdXJsIC1rIGh0dHBzOi8vbG9jYWxob3N0OjgwODAvaW50ZXJuYWwvaGVhbHRoIHx8IGV4aXQgMQoKI1tiaW50Om1vdW50c10KI1tiaW50OmVudmlyb25tZW50XQojW2JpbnQ6cG9ydHNdCiNbYmludDp2b2x1bWVzXQoKCiMgU0VDUkVUICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpbc2VjcmV0XQpob3N0bmFtZSA9IHNlY3JldApob3N0YWRkciA9IDAuMC4wLjAKaG9zdHBvcnQgPSA4MDgwCmhlYWx0aGNoZWNrID0gdHJ1ZQoKd29ya2VycyA9IDQKCltzZWNyZXQ6YnVpbGRdCmltYWdlID0gY29tbW9uOmJhc2UKc2NyaXB0ID0KCVJVTiBwaXAgaW5zdGFsbCAtLW5vLWNhY2hlLWRpciBweU9wZW5TU0wKCUFERCB7c2VjdGlvbi5yZXBsYWNlKCc6YnVpbGQnLCAnJyl9IC9vcHQve3NlY3Rpb24ucmVwbGFjZSgnOmJ1aWxkJywgJycpfQoJQUREIHdlYmNlcnQgL29wdC93ZWJjZXJ0CglBREQgY29tbW9uIC9vcHQvY29tbW9uCglBREQgZHJpdmVyIC9vcHQvZHJpdmVyCglBREQgc2NoZW1hIC9vcHQvc2NoZW1hCglBREQgY29uZmlnLmluaSAvb3B0L2NvbmZpZy5pbmkKCUNNRCBbInB5dGhvbiIsICJ7c2VjdGlvbi5yZXBsYWNlKCc6YnVpbGQnLCAnJyl9Il0KCUhFQUxUSENIRUNLIFwKCQktLWludGVydmFsPXtpbmlbJ2RlZmF1bHQuaGVhbHRoX2NoZWNrX2ludGVydmFsJ119cyBcCgkJLS10aW1lb3V0PXtpbmlbJ2RlZmF1bHQuaGVhbHRoX2NoZWNrX3RpbWVvdXQnXX1zIFwKCQktLXJldHJpZXM9e2luaVsnZGVmYXVsdC5oZWFsdGhfY2hlY2tfcmV0cmllcyddfSBcCgkJQ01EIGN1cmwgLWsgaHR0cHM6Ly9sb2NhbGhvc3Q6ODA4MC9pbnRlcm5hbC9oZWFsdGggfHwgZXhpdCAxCgojW3NlY3JldDptb3VudHNdCiNbc2VjcmV0OmVudmlyb25tZW50XQojW3NlY3JldDpwb3J0c10KI1tzZWNyZXQ6dm9sdW1lc10KCgojIEROUyBNQU5BR0VSICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKW2Ruc21dCmhvc3RuYW1lID0gZG5zbQpob3N0YWRkciA9IDAuMC4wLjAKaG9zdHBvcnQgPSA4MDgwCmhlYWx0aGNoZWNrID0gdHJ1ZQoKd29ya2VycyA9IDEKCmFjY19lbmRwb2ludCA9IGh0dHBzOi8ve2luaVsnYWNjb3VudC5ob3N0bmFtZSddfTp7aW5pWydhY2NvdW50Lmhvc3Rwb3J0J119CmFwaV9lbmRwb2ludCA9IGh0dHBzOi8ve2luaVsndG9vbC5ob3N0bmFtZSddfTp7aW5pWyd0b29sLmhvc3Rwb3J0J119CiNhY2NfZW5kcG9pbnQgPSBodHRwczovL3tpbmlbJ2RlZmF1bHQuZW5kcG9pbnQnXX0KI2FwaV9lbmRwb2ludCA9IGh0dHBzOi8ve2luaVsnZGVmYXVsdC5lbmRwb2ludCddfQoKZG9tYWluID0ge2luaVsnY2xvdWQuY2xvdWRfZG9tYWluJ119CmludGVydmFsID0gNQoKW2Ruc206cXVlcnldCiNwcm9wZXJ0aWVzLnByb3BlcnR5ID0gdmFsdWUKCltkbnNtOmJ1aWxkXQppbWFnZSA9IGNvbW1vbjpiYXNlCnNjcmlwdCA9CglBREQge3NlY3Rpb24ucmVwbGFjZSgnOmJ1aWxkJywgJycpfSAvb3B0L3tzZWN0aW9uLnJlcGxhY2UoJzpidWlsZCcsICcnKX0KCUFERCB3ZWJjZXJ0IC9vcHQvd2ViY2VydAoJQUREIGNvbW1vbiAvb3B0L2NvbW1vbgoJQUREIGRyaXZlciAvb3B0L2RyaXZlcgoJQUREIHNjaGVtYSAvb3B0L3NjaGVtYQoJQUREIGNvbmZpZy5pbmkgL29wdC9jb25maWcuaW5pCglDTUQgWyJweXRob24iLCAie3NlY3Rpb24ucmVwbGFjZSgnOmJ1aWxkJywgJycpfSJdCglIRUFMVEhDSEVDSyBcCgkJLS1pbnRlcnZhbD17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja19pbnRlcnZhbCddfXMgXAoJCS0tdGltZW91dD17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja190aW1lb3V0J119cyBcCgkJLS1yZXRyaWVzPXtpbmlbJ2RlZmF1bHQuaGVhbHRoX2NoZWNrX3JldHJpZXMnXX0gXAoJCUNNRCBjdXJsIC1rIGh0dHBzOi8vbG9jYWxob3N0OjgwODAvaW50ZXJuYWwvaGVhbHRoIHx8IGV4aXQgMQoKI1tkbnNtOm1vdW50c10KI1tkbnNtOmVudmlyb25tZW50XQojW2Ruc206cG9ydHNdCiNbZG5zbTp2b2x1bWVzXQoKCiMgRE5TIENMSUVOVCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpbZG5zY10KaG9zdG5hbWUgPSBkbnNjCmhvc3RhZGRyID0gMC4wLjAuMApob3N0cG9ydCA9IDgwODAKaGVhbHRoY2hlY2sgPSB0cnVlCgp3b3JrZXJzID0gMQoKZG5zbV9lbmRwb2ludCA9IGh0dHBzOi8ve2luaVsnZG5zbS5ob3N0bmFtZSddfTp7aW5pWydkbnNtLmhvc3Rwb3J0J119CiNkbnNtX2VuZHBvaW50ID0gaHR0cHM6Ly97aW5pWydkZWZhdWx0LmVuZHBvaW50J119Cgpkb21haW4gPSB7aW5pWydjbG91ZC5jbG91ZF9kb21haW4nXX0KaW50ZXJ2YWwgPSA1CmZpbGVfdGFnID0gZG5zYwoKW2Ruc2M6YnVpbGRdCmltYWdlID0gY29tbW9uOmJhc2UKc2NyaXB0ID0KCVJVTiBta2RpciAtcCAvaG9zdHMuZAoJQUREIHtzZWN0aW9uLnJlcGxhY2UoJzpidWlsZCcsICcnKX0gL29wdC97c2VjdGlvbi5yZXBsYWNlKCc6YnVpbGQnLCAnJyl9CglBREQgd2ViY2VydCAvb3B0L3dlYmNlcnQKCUFERCBjb21tb24gL29wdC9jb21tb24KCUFERCBkcml2ZXIgL29wdC9kcml2ZXIKCUFERCBzY2hlbWEgL29wdC9zY2hlbWEKCUFERCBjb25maWcuaW5pIC9vcHQvY29uZmlnLmluaQoJQ01EIFsicHl0aG9uIiwgIntzZWN0aW9uLnJlcGxhY2UoJzpidWlsZCcsICcnKX0iXQoJSEVBTFRIQ0hFQ0sgXAoJCS0taW50ZXJ2YWw9e2luaVsnZGVmYXVsdC5oZWFsdGhfY2hlY2tfaW50ZXJ2YWwnXX1zIFwKCQktLXRpbWVvdXQ9e2luaVsnZGVmYXVsdC5oZWFsdGhfY2hlY2tfdGltZW91dCddfXMgXAoJCS0tcmV0cmllcz17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja19yZXRyaWVzJ119IFwKCQlDTUQgY3VybCAtayBodHRwczovL2xvY2FsaG9zdDo4MDgwL2ludGVybmFsL2hlYWx0aCB8fCBleGl0IDEKCiNbZG5zYzptb3VudHNdCiNbZG5zYzplbnZpcm9ubWVudF0KI1tkbnNjOnBvcnRzXQojW2Ruc2M6dm9sdW1lc10KCgojIFRPT0wgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKW3Rvb2xdCmhvc3RuYW1lID0gdG9vbApob3N0YWRkciA9IDAuMC4wLjAKaG9zdHBvcnQgPSA4MDgwCmhlYWx0aGNoZWNrID0gdHJ1ZQoKd29ya2VycyA9IDQKClt0b29sOmJ1aWxkXQppbWFnZSA9IGNvbW1vbjpiYXNlCnNjcmlwdCA9CglSVU4gcGlwIGluc3RhbGwgLS1uby1jYWNoZS1kaXIgYWlvc210cGxpYgoJQUREIHtzZWN0aW9uLnJlcGxhY2UoJzpidWlsZCcsICcnKX0gL29wdC97c2VjdGlvbi5yZXBsYWNlKCc6YnVpbGQnLCAnJyl9CglBREQgd2ViY2VydCAvb3B0L3dlYmNlcnQKCUFERCBjb21tb24gL29wdC9jb21tb24KCUFERCBkcml2ZXIgL29wdC9kcml2ZXIKCUFERCBzY2hlbWEgL29wdC9zY2hlbWEKCUFERCBjb25maWcuaW5pIC9vcHQvY29uZmlnLmluaQoJQ01EIFsicHl0aG9uIiwgIntzZWN0aW9uLnJlcGxhY2UoJzpidWlsZCcsICcnKX0iXQoJSEVBTFRIQ0hFQ0sgXAoJCS0taW50ZXJ2YWw9e2luaVsnZGVmYXVsdC5oZWFsdGhfY2hlY2tfaW50ZXJ2YWwnXX1zIFwKCQktLXRpbWVvdXQ9e2luaVsnZGVmYXVsdC5oZWFsdGhfY2hlY2tfdGltZW91dCddfXMgXAoJCS0tcmV0cmllcz17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja19yZXRyaWVzJ119IFwKCQlDTUQgY3VybCAtayBodHRwczovL2xvY2FsaG9zdDo4MDgwL2ludGVybmFsL2hlYWx0aCB8fCBleGl0IDEKCiNbdG9vbDptb3VudHNdCiNbdG9vbDplbnZpcm9ubWVudF0KI1t0b29sOnBvcnRzXQojW3Rvb2w6dm9sdW1lc10KCgojIFJPVVRFUiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKW3JvdXRlcl0KaG9zdG5hbWUgPSByb3V0ZXIKaG9zdGFkZHIgPSAwLjAuMC4wCmhvc3Rwb3J0ID0gODA4MApoZWFsdGhjaGVjayA9IHRydWUKCndvcmtlcnMgPSA0Cgpbcm91dGVyOmJ1aWxkXQppbWFnZSA9IGNvbW1vbjpiYXNlCnNjcmlwdCA9CglBREQge3NlY3Rpb24ucmVwbGFjZSgnOmJ1aWxkJywgJycpfSAvb3B0L3tzZWN0aW9uLnJlcGxhY2UoJzpidWlsZCcsICcnKX0KCUFERCB3ZWJjZXJ0IC9vcHQvd2ViY2VydAoJQUREIGNvbW1vbiAvb3B0L2NvbW1vbgoJQUREIGRyaXZlciAvb3B0L2RyaXZlcgoJQUREIHNjaGVtYSAvb3B0L3NjaGVtYQoJQUREIGNvbmZpZy5pbmkgL29wdC9jb25maWcuaW5pCglDTUQgWyJweXRob24iLCAie3NlY3Rpb24ucmVwbGFjZSgnOmJ1aWxkJywgJycpfSJdCglIRUFMVEhDSEVDSyBcCgkJLS1pbnRlcnZhbD17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja19pbnRlcnZhbCddfXMgXAoJCS0tdGltZW91dD17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja190aW1lb3V0J119cyBcCgkJLS1yZXRyaWVzPXtpbmlbJ2RlZmF1bHQuaGVhbHRoX2NoZWNrX3JldHJpZXMnXX0gXAoJCUNNRCBjdXJsIC1rIGh0dHBzOi8vbG9jYWxob3N0OjgwODAvaW50ZXJuYWwvaGVhbHRoIHx8IGV4aXQgMQoKI1tyb3V0ZXI6bW91bnRzXQojW3JvdXRlcjplbnZpcm9ubWVudF0KI1tyb3V0ZXI6cG9ydHNdCiNbcm91dGVyOnZvbHVtZXNdCgoKIyBBQ0NPVU5UICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjClthY2NvdW50XQpob3N0bmFtZSA9IGFjY291bnQKaG9zdGFkZHIgPSAwLjAuMC4wCmhvc3Rwb3J0ID0gODA4MApoZWFsdGhjaGVjayA9IHRydWUKCndvcmtlcnMgPSA0CgpbYWNjb3VudDpidWlsZF0KaW1hZ2UgPSBjb21tb246YmFzZQpzY3JpcHQgPQoJQUREIHtzZWN0aW9uLnJlcGxhY2UoJzpidWlsZCcsICcnKX0gL29wdC97c2VjdGlvbi5yZXBsYWNlKCc6YnVpbGQnLCAnJyl9CglBREQgd2ViY2VydCAvb3B0L3dlYmNlcnQKCUFERCBjb21tb24gL29wdC9jb21tb24KCUFERCBkcml2ZXIgL29wdC9kcml2ZXIKCUFERCBzY2hlbWEgL29wdC9zY2hlbWEKCUFERCBjb25maWcuaW5pIC9vcHQvY29uZmlnLmluaQoJQ01EIFsicHl0aG9uIiwgIntzZWN0aW9uLnJlcGxhY2UoJzpidWlsZCcsICcnKX0iXQoJSEVBTFRIQ0hFQ0sgXAoJCS0taW50ZXJ2YWw9e2luaVsnZGVmYXVsdC5oZWFsdGhfY2hlY2tfaW50ZXJ2YWwnXX1zIFwKCQktLXRpbWVvdXQ9e2luaVsnZGVmYXVsdC5oZWFsdGhfY2hlY2tfdGltZW91dCddfXMgXAoJCS0tcmV0cmllcz17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja19yZXRyaWVzJ119IFwKCQlDTUQgY3VybCAtayBodHRwczovL2xvY2FsaG9zdDo4MDgwL2ludGVybmFsL2hlYWx0aCB8fCBleGl0IDEKCiNbYWNjb3VudDptb3VudHNdCiNbYWNjb3VudDp2b2x1bWVzXQojW2FjY291bnQ6ZW52aXJvbm1lbnRdCiNbYWNjb3VudDpwb3J0c10KCgojIENPUkUgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKW2NvcmVdCmhvc3RuYW1lID0gY29yZQpob3N0YWRkciA9IDAuMC4wLjAKaG9zdHBvcnQgPSA4MDgwCmhlYWx0aGNoZWNrID0gdHJ1ZQoKIyBkb24ndCBjaGFuZ2Ugd29ya2VycyBjb3VudAp3b3JrZXJzID0gMQoKY2xlYXJfdGljayA9IDYwCmNsZWFyX21vZGVsX2hvdXIgPSAyCmNsZWFyX2NhY2hlX2hvdXIgPSAyCgpbY29yZTpidWlsZF0KaW1hZ2UgPSBjb21tb246YmFzZQpzY3JpcHQgPQoJQUREIHtzZWN0aW9uLnJlcGxhY2UoJzpidWlsZCcsICcnKX0gL29wdC97c2VjdGlvbi5yZXBsYWNlKCc6YnVpbGQnLCAnJyl9CglBREQgd2ViY2VydCAvb3B0L3dlYmNlcnQKCUFERCBjb21tb24gL29wdC9jb21tb24KCUFERCBkcml2ZXIgL29wdC9kcml2ZXIKCUFERCBzY2hlbWEgL29wdC9zY2hlbWEKCUFERCBjb25maWcuaW5pIC9vcHQvY29uZmlnLmluaQoJQ01EIFsicHl0aG9uIiwgIntzZWN0aW9uLnJlcGxhY2UoJzpidWlsZCcsICcnKX0iXQoJSEVBTFRIQ0hFQ0sgXAoJCS0taW50ZXJ2YWw9e2luaVsnZGVmYXVsdC5oZWFsdGhfY2hlY2tfaW50ZXJ2YWwnXX1zIFwKCQktLXRpbWVvdXQ9e2luaVsnZGVmYXVsdC5oZWFsdGhfY2hlY2tfdGltZW91dCddfXMgXAoJCS0tcmV0cmllcz17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja19yZXRyaWVzJ119IFwKCQlDTUQgY3VybCAtayBodHRwczovL2xvY2FsaG9zdDo4MDgwL2ludGVybmFsL2hlYWx0aCB8fCBleGl0IDEKCiNbY29yZTptb3VudHNdCiNbY29yZTp2b2x1bWVzXQojW2NvcmU6ZW52aXJvbm1lbnRdCiNbY29yZTpwb3J0c10KCgojIE5HSU5YICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKW25naW54XQpob3N0bmFtZSA9IG5naW54Cmhvc3RhZGRyID0gMC4wLjAuMApob3N0cG9ydCA9IDQ0MwpoZWFsdGhjaGVjayA9IHRydWUKCltuZ2lueDpidWlsZF0KaW1hZ2UgPSBuZ2lueDpiYXNlCnNjcmlwdCA9CglBREQgd2Vicm9vdCAvd2Vicm9vdAoJQUREIHdlYmNlcnQgL3dlYmNlcnQKCUFERCBuZ2lueC9weWdtYS9jb25mLmQgL2V0Yy9uZ2lueC9jb25mLmQKCUhFQUxUSENIRUNLIFwKCQktLWludGVydmFsPXtpbmlbJ2RlZmF1bHQuaGVhbHRoX2NoZWNrX2ludGVydmFsJ119cyBcCgkJLS10aW1lb3V0PXtpbmlbJ2RlZmF1bHQuaGVhbHRoX2NoZWNrX3RpbWVvdXQnXX1zIFwKCQktLXJldHJpZXM9e2luaVsnZGVmYXVsdC5oZWFsdGhfY2hlY2tfcmV0cmllcyddfSBcCgkJQ01EIGN1cmwgLWsgaHR0cHM6Ly8xMjcuMC4wLjEgfHwgZXhpdCAxCgpbbmdpbng6cG9ydHNdCjQ0My90Y3AgPSAwLjAuMC4wOjQ0Mwo5MDAwL3RjcCA9IDAuMC4wLjA6OTAwMAoKI1tuZ2lueDptb3VudHNdCiNbbmdpbng6ZW52aXJvbm1lbnRdCiNbbmdpbng6dm9sdW1lc10KCgojIEtFWUNMT0FLICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKW2tleWNsb2FrXQpob3N0bmFtZSA9IGtleWNsb2FrCmhvc3RhZGRyID0gMC4wLjAuMApob3N0cG9ydCA9IDgwODAKaGVhbHRoY2hlY2sgPSB0cnVlCgp0aGVtZSA9IG9yYnJpdW0KCnJlZ2lzdHJhdGlvbiA9IGZhbHNlCnJlc2V0X3Bhc3N3b3JkID0gZmFsc2UKZW1haWxfbG9naW4gPSBmYWxzZQoKc2Vzc2lvbl9pZGxlX3RpbWVvdXQgPSAxODAwCnNlc3Npb25fbWF4X2xpZmVzcGFuID0gODY0MDAKdG9rZW5fbGlmZXNwYW4gPSA5MDAKCltrZXljbG9hazpidWlsZF0KaW1hZ2UgPSBrZXljbG9hazpiYXNlCnNjcmlwdCA9CglFTlYgS0VZQ0xPQUtfQURNSU49e2luaVsnZGVmYXVsdC5zeXN0ZW1fYWNjZXNzX2tleSddfQoJRU5WIEtFWUNMT0FLX0FETUlOX1BBU1NXT1JEPXtpbmlbJ2RlZmF1bHQuc3lzdGVtX3NlY3JldF9rZXknXX0KCVJVTiBlY2hvICJkYi11c2VybmFtZT17aW5pWydkZWZhdWx0LnN5c3RlbV9hY2Nlc3Nfa2V5J119IiA+PiAvb3B0L2tleWNsb2FrL2NvbmYva2V5Y2xvYWsuY29uZgoJUlVOIGVjaG8gImRiLXBhc3N3b3JkPXtpbmlbJ2RlZmF1bHQuc3lzdGVtX3NlY3JldF9rZXknXX0iID4+IC9vcHQva2V5Y2xvYWsvY29uZi9rZXljbG9hay5jb25mCglSVU4gZWNobyAiZGItdXJsPWpkYmM6cG9zdGdyZXNxbDovL3tpbmlbJ3Bvc3RncmVzcWwuaG9zdG5hbWUnXX0va2V5Y2xvYWsiID4+IC9vcHQva2V5Y2xvYWsvY29uZi9rZXljbG9hay5jb25mCglSVU4gZWNobyAiaG9zdG5hbWU9aHR0cHM6Ly97aW5pWydkZWZhdWx0LmVuZHBvaW50J119L2F1dGgiID4+IC9vcHQva2V5Y2xvYWsvY29uZi9rZXljbG9hay5jb25mCglSVU4gZWNobyAiaG9zdG5hbWUtYWRtaW49aHR0cHM6Ly97aW5pWydkZWZhdWx0LmVuZHBvaW50J119L2F1dGgiID4+IC9vcHQva2V5Y2xvYWsvY29uZi9rZXljbG9hay5jb25mCgojW2tleWNsb2FrOmVudmlyb25tZW50XQojW2tleWNsb2FrOnBvcnRzXQojW2tleWNsb2FrOnZvbHVtZXNdCiNba2V5Y2xvYWs6bW91bnRzXQoKCiMgTUlOSU8gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpbbWluaW9dCmhvc3RuYW1lID0gbWluaW8KaG9zdGFkZHIgPSAwLjAuMC4wCmhvc3Rwb3J0ID0gOTAwMQpoZWFsdGhjaGVjayA9IHRydWUKClttaW5pbzpidWlsZF0KaW1hZ2UgPSBtaW5pbzpiYXNlCnNjcmlwdCA9CglFTlYgREFUQV9TVE9SRV9MSVNUPS9kYXRhCglFTlYgTUlOSU9fUk9PVF9VU0VSPXtpbmlbJ2RlZmF1bHQuc3lzdGVtX2FjY2Vzc19rZXknXX0KCUVOViBNSU5JT19ST09UX1BBU1NXT1JEPXtpbmlbJ2RlZmF1bHQuc3lzdGVtX3NlY3JldF9rZXknXX0KCUVOViBNSU5JT19CUk9XU0VSX1JFRElSRUNUX1VSTD1odHRwczovL3tpbmlbJ2RlZmF1bHQuZW5kcG9pbnQnXX0vbWluaW8vCglIRUFMVEhDSEVDSyBcCgkJLS1pbnRlcnZhbD17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja19pbnRlcnZhbCddfXMgXAoJCS0tdGltZW91dD17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja190aW1lb3V0J119cyBcCgkJLS1yZXRyaWVzPXtpbmlbJ2RlZmF1bHQuaGVhbHRoX2NoZWNrX3JldHJpZXMnXX0gXAoJCUNNRCBjdXJsIC1mIGh0dHA6Ly9sb2NhbGhvc3Q6OTAwMC9taW5pby9oZWFsdGgvbGl2ZSB8fCBleGl0IDEKClttaW5pbzp2b2x1bWVzXQptaW5pbyA9IC9kYXRhCgojW21pbmlvOmVudmlyb25tZW50XQojW21pbmlvOnBvcnRzXQojW21pbmlvOm1vdW50c10KCgojIEdVQUNBTU9MRSAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKW2d1YWNkXQpob3N0bmFtZSA9IGd1YWNkCmhvc3RhZGRyID0gMC4wLjAuMApob3N0cG9ydCA9IDQ4MjIKCltndWFjZDpidWlsZF0KaW1hZ2UgPSBndWFjZDpiYXNlCnNjcmlwdCA9CgojW2d1YWNkOmVudmlyb25tZW50XQojW2d1YWNkOnBvcnRzXQojW2d1YWNkOnZvbHVtZXNdCiNbZ3VhY2Q6bW91bnRzXQoKW2d1YWNhbW9sZV0KaG9zdG5hbWUgPSBndWFjYW1vbGUKaG9zdGFkZHIgPSAwLjAuMC4wCmhvc3Rwb3J0ID0gODA4MAoKW2d1YWNhbW9sZTpidWlsZF0KaW1hZ2UgPSBndWFjYW1vbGU6YmFzZQpzY3JpcHQgPQoJRU5WIEdVQUNEX0hPU1ROQU1FPXtpbmlbJ2d1YWNkLmhvc3RuYW1lJ119CglFTlYgR1VBQ0RfUE9SVD17aW5pWydndWFjZC5ob3N0cG9ydCddfQoJRU5WIFBPU1RHUkVTUUxfSE9TVE5BTUU9e2luaVsncG9zdGdyZXNxbC5ob3N0bmFtZSddfQoJRU5WIFBPU1RHUkVTUUxfUE9SVD17aW5pWydwb3N0Z3Jlc3FsLmhvc3Rwb3J0J119CglFTlYgUE9TVEdSRVNRTF9VU0VSPXtpbmlbJ2RlZmF1bHQuc3lzdGVtX2FjY2Vzc19rZXknXX0KCUVOViBQT1NUR1JFU1FMX1BBU1NXT1JEPXtpbmlbJ2RlZmF1bHQuc3lzdGVtX3NlY3JldF9rZXknXX0KCUVOViBQT1NUR1JFU1FMX0RBVEFCQVNFPWd1YWNhbW9sZQoJRU5WIFBPU1RHUkVTUUxfQVVUT19DUkVBVEVfQUNDT1VOVFM9dHJ1ZQoJRU5WIE9QRU5JRF9JU1NVRVI9aHR0cHM6Ly97aW5pWydkZWZhdWx0LmVuZHBvaW50J119L2F1dGgvcmVhbG1zL3tpbmlbJ2RlZmF1bHQudGVuYW50J119CglFTlYgT1BFTklEX0NMSUVOVF9JRD1ndWFjYW1vbGUKCUVOViBPUEVOSURfVVNFUk5BTUVfQ0xBSU1fVFlQRT1wcmVmZXJyZWRfdXNlcm5hbWUKCUVOViBPUEVOSURfQVVUSE9SSVpBVElPTl9FTkRQT0lOVD1odHRwczovL3tpbmlbJ2RlZmF1bHQuZW5kcG9pbnQnXX0vYXV0aC9yZWFsbXMve2luaVsnZGVmYXVsdC50ZW5hbnQnXX0vcHJvdG9jb2wvb3BlbmlkLWNvbm5lY3QvYXV0aAoJRU5WIE9QRU5JRF9KV0tTX0VORFBPSU5UPWh0dHA6Ly97aW5pWydrZXljbG9hay5ob3N0bmFtZSddfTp7aW5pWydrZXljbG9hay5ob3N0cG9ydCddfS9hdXRoL3JlYWxtcy97aW5pWydkZWZhdWx0LnRlbmFudCddfS9wcm90b2NvbC9vcGVuaWQtY29ubmVjdC9jZXJ0cwoJRU5WIE9QRU5JRF9SRURJUkVDVF9VUkk9aHR0cHM6Ly97aW5pWydkZWZhdWx0LmVuZHBvaW50J119L3Rlcm1pbmFsL2luZGV4Lmh0bWwKCUVOViBFWFRFTlNJT05fUFJJT1JJVFk9KixvcGVuaWQKCiNbZ3VhY2Ftb2xlOmVudmlyb25tZW50XQojW2d1YWNhbW9sZTpwb3J0c10KI1tndWFjYW1vbGU6dm9sdW1lc10KI1tndWFjYW1vbGU6bW91bnRzXQoKCiMgQ09OU09MRSAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpbY29uc29sZV0KaG9zdG5hbWUgPSBjb25zb2xlCmhvc3RhZGRyID0gMC4wLjAuMApob3N0cG9ydCA9IDIyCgpbY29uc29sZTpidWlsZF0KaW1hZ2UgPSBjb25zb2xlOmJhc2UKc2NyaXB0ID0KCVJVTiBlY2hvIC1uICdyb290OntpbmlbJ2RlZmF1bHQuc3lzdGVtX3NlY3JldF9rZXknXX0nIHwgY2hwYXNzd2QKCiNbY29uc29sZTptb3VudHNdCiNbY29uc29sZTplbnZpcm9ubWVudF0KI1tjb25zb2xlOnBvcnRzXQojW2NvbnNvbGU6dm9sdW1lc10KCgojIFJFRElTICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKW3JlZGlzXQpob3N0bmFtZSA9IHJlZGlzCmhvc3RhZGRyID0gMC4wLjAuMApob3N0cG9ydCA9IDYzNzkKaGVhbHRoY2hlY2sgPSB0cnVlCgpbcmVkaXM6c2Vzc2lvbl0KZGF0YWJhc2UgPSAwCmV4cGlyZSA9IDMwMAoKW3JlZGlzOnBvY2tldF0KZGF0YWJhc2UgPSAxCgpbcmVkaXM6cXVldWVdCmRhdGFiYXNlID0gMgoKW3JlZGlzOm1vZGVsXQpkYXRhYmFzZSA9IDMKZXhwaXJlID0gMzYwMAoKW3JlZGlzOmJ1aWxkXQppbWFnZSA9IHJlZGlzOmJhc2UKc2NyaXB0ID0KCUhFQUxUSENIRUNLIFwKCQktLWludGVydmFsPXtpbmlbJ2RlZmF1bHQuaGVhbHRoX2NoZWNrX2ludGVydmFsJ119cyBcCgkJLS10aW1lb3V0PXtpbmlbJ2RlZmF1bHQuaGVhbHRoX2NoZWNrX3RpbWVvdXQnXX1zIFwKCQktLXJldHJpZXM9e2luaVsnZGVmYXVsdC5oZWFsdGhfY2hlY2tfcmV0cmllcyddfSBcCgkJQ01EIHJlZGlzLWNsaSAtLXJhdyBpbmNyIHBpbmcgfHwgZXhpdCAxCgpbcmVkaXM6dm9sdW1lc10KcmVkaXMgPSAvZGF0YQoKI1tyZWRpczplbnZpcm9ubWVudF0KI1tyZWRpczpwb3J0c10KI1tyZWRpczptb3VudHNdCgoKIyBFTEFTVElDIFNFQVJDSCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCltlbGFzdGljc2VhcmNoXQpob3N0bmFtZSA9IGVsYXN0aWNzZWFyY2gKaG9zdGFkZHIgPSAwLjAuMC4wCmhvc3Rwb3J0ID0gOTIwMApoZWFsdGhjaGVjayA9IHRydWUKCiMgc2hhcmRzIHRvdGFsID09IDEwMDAKIyBzaGFyZHMgPD0gdG90YWwgY2x1c3RlciBtZW1vcnkoaGVhcCkgKiAyMApzaGFyZHMgPSAyMApyZXBsaWNhcyA9IDAKZXhwaXJlID0gNjA0ODAwCgpbZWxhc3RpY3NlYXJjaDpidWlsZF0KaW1hZ2UgPSBlbGFzdGljc2VhcmNoOmJhc2UKc2NyaXB0ID0KCUVOViBkaXNjb3ZlcnkudHlwZT1zaW5nbGUtbm9kZQoJRU5WIFNZU1RFTV9BQ0NFU1NfS0VZPXtpbmlbJ2RlZmF1bHQuc3lzdGVtX2FjY2Vzc19rZXknXX0KCUVOViBTWVNURU1fU0VDUkVUX0tFWT17aW5pWydkZWZhdWx0LnN5c3RlbV9zZWNyZXRfa2V5J119CglIRUFMVEhDSEVDSyBcCgkJLS1pbnRlcnZhbD17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja19pbnRlcnZhbCddfXMgXAoJCS0tdGltZW91dD17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja190aW1lb3V0J119cyBcCgkJLS1yZXRyaWVzPXtpbmlbJ2RlZmF1bHQuaGVhbHRoX2NoZWNrX3JldHJpZXMnXX0gXAoJCUNNRCBjdXJsIC1rIGh0dHBzOi8vbG9jYWxob3N0OjkyMDAgfHwgZXhpdCAxCgpbZWxhc3RpY3NlYXJjaDp2b2x1bWVzXQplbGFzdGljc2VhcmNoID0gL3Vzci9zaGFyZS9lbGFzdGljc2VhcmNoCgojW2VsYXN0aWNzZWFyY2g6ZW52aXJvbm1lbnRdCiNbZWxhc3RpY3NlYXJjaDpwb3J0c10KI1tlbGFzdGljc2VhcmNoOm1vdW50c10KCgojIFBPU1RHUkVTUUwgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKW3Bvc3RncmVzcWxdCmhvc3RuYW1lID0gcG9zdGdyZXNxbApob3N0YWRkciA9IDAuMC4wLjAKaG9zdHBvcnQgPSA1NDMyCmhlYWx0aGNoZWNrID0gdHJ1ZQoKW3Bvc3RncmVzcWw6YnVpbGRdCmltYWdlID0gcG9zdGdyZXNxbDpiYXNlCnNjcmlwdCA9CglFTlYgREFUQUJBU0VfVVNFUj17aW5pWydkZWZhdWx0LnN5c3RlbV9hY2Nlc3Nfa2V5J119CglFTlYgUE9TVEdSRVNfUEFTU1dPUkQ9e2luaVsnZGVmYXVsdC5zeXN0ZW1fc2VjcmV0X2tleSddfQoJQUREIHBvc3RncmVzcWwvcHlnbWEgL3B5Z21hCglSVU4gZWNobyAiLiAvcHlnbWEvaW5pdC5zaCIgPiAvZG9ja2VyLWVudHJ5cG9pbnQtaW5pdGRiLmQvaW5pdC5zaAoJQ01EIFsiLWMiLCAiY29uZmlnX2ZpbGU9L3B5Z21hL3Bvc3RncmVzcWwuY29uZiJdCglIRUFMVEhDSEVDSyBcCgkJLS1pbnRlcnZhbD17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja19pbnRlcnZhbCddfXMgXAoJCS0tdGltZW91dD17aW5pWydkZWZhdWx0LmhlYWx0aF9jaGVja190aW1lb3V0J119cyBcCgkJLS1yZXRyaWVzPXtpbmlbJ2RlZmF1bHQuaGVhbHRoX2NoZWNrX3JldHJpZXMnXX0gXAoJCUNNRCBwZ19pc3JlYWR5IC0tdXNlcm5hbWUgcG9zdGdyZXMgfHwgZXhpdCAxCgpbcG9zdGdyZXNxbDp2b2x1bWVzXQpwb3N0Z3Jlc3FsID0gL3Zhci9saWIvcG9zdGdyZXNxbC9kYXRhCgojW3Bvc3RncmVzcWw6ZW52aXJvbm1lbnRdCiNbcG9zdGdyZXNxbDpwb3J0c10KI1twb3N0Z3Jlc3FsOm1vdW50c10KCgojIE9QRU5MREFQICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKW2xkYXBdCmhvc3RuYW1lID0ge2luaVsnZGVmYXVsdC5lbmRwb2ludCddfQpob3N0YWRkciA9IDAuMC4wLjAKaG9zdHBvcnQgPSA2MzYKCltsZGFwOmJ1aWxkXQppbWFnZSA9IGxkYXA6YmFzZQpzY3JpcHQgPQoJUlVOIHJtIC1yZiAvY29udGFpbmVyL3NlcnZpY2Uvc2xhcGQvYXNzZXRzL2NlcnRzCglBREQgd2ViY2VydCAvY29udGFpbmVyL3NlcnZpY2Uvc2xhcGQvYXNzZXRzL2NlcnRzCglBREQgbGRhcC9weWdtYS9jb25mLmQvY3VzdG9tLmxkaWYgL2NvbnRhaW5lci9zZXJ2aWNlL3NsYXBkL2Fzc2V0cy9jb25maWcvYm9vdHN0cmFwL2xkaWYvNTAtYm9vdHN0cmFwLmxkaWYKCUVOViBMREFQX0RPTUFJTj17aW5pWydkZWZhdWx0LmRvbWFpbiddfQoJRU5WIExEQVBfQkFTRV9ETj0ieycsJy5qb2luKFsnZGM9JyArIGRjIGZvciBkYyBpbiBpbmlbJ2RlZmF1bHQuZG9tYWluJ10uc3BsaXQoJy4nKV0pfSIKCUVOViBMREFQX0FETUlOX1BBU1NXT1JEPXtpbmlbJ2RlZmF1bHQuc3lzdGVtX3NlY3JldF9rZXknXX0KCUVOViBMREFQX0NPTkZJR19QQVNTV09SRD17aW5pWydkZWZhdWx0LnN5c3RlbV9zZWNyZXRfa2V5J119CglFTlYgTERBUF9UTFNfVkVSSUZZX0NMSUVOVD10cnkKCUVOViBMREFQX1RMU19DQV9DUlRfRklMRU5BTUU9Y2EuY3J0CglFTlYgTERBUF9UTFNfQ1JUX0ZJTEVOQU1FPXNlcnZlci5jcnQKCUVOViBMREFQX1RMU19LRVlfRklMRU5BTUU9c2VydmVyLmtleQoKW2xkYXA6dm9sdW1lc10KbGRhcC1tZGIgPSAvdmFyL2xpYi9sZGFwCmxkYXAtY25mID0gL2V0Yy9sZGFwL3NsYXBkLmQKCltsZGFwOnBvcnRzXQo2MzYvdGNwID0gMC4wLjAuMDo2MzYKCiNbbGRhcDplbnZpcm9ubWVudF0KCiNbbGRhcDptb3VudHNdCgpbbGRhcGFkbV0KaG9zdG5hbWUgPSBsZGFwYWRtCmhvc3RhZGRyID0gMC4wLjAuMApob3N0cG9ydCA9IDQ0MwoKW2xkYXBhZG06YnVpbGRdCmltYWdlID0gbGRhcGFkbTpiYXNlCnNjcmlwdCA9CglSVU4gcm0gLXJmIC9jb250YWluZXIvc2VydmljZS9sZGFwLWNsaWVudC9hc3NldHMvY2VydHMKCUFERCB3ZWJjZXJ0IC9jb250YWluZXIvc2VydmljZS9sZGFwLWNsaWVudC9hc3NldHMvY2VydHMKCUVOViBQSFBMREFQQURNSU5fTERBUF9IT1NUUz17aW5pWydsZGFwLmhvc3RuYW1lJ119CglFTlYgUEhQTERBUEFETUlOX0hUVFBTPXRydWUKCUVOViBQSFBMREFQQURNSU5fTERBUF9DTElFTlRfVExTX0NBX0NSVF9GSUxFTkFNRT1jYS5jcnQKCUVOViBQSFBMREFQQURNSU5fTERBUF9DTElFTlRfVExTX0NSVF9GSUxFTkFNRT1zZXJ2ZXIuY3J0CglFTlYgUEhQTERBUEFETUlOX0xEQVBfQ0xJRU5UX1RMU19LRVlfRklMRU5BTUU9c2VydmVyLmtleQoKW2xkYXBhZG06cG9ydHNdCjQ0My90Y3AgPSAwLjAuMC4wOjgzODkKCiNbbGRhcGFkbTplbnZpcm9ubWVudF0KI1tsZGFwYWRtOnZvbHVtZXNdCiNbbGRhcGFkbTptb3VudHNd"

if [ ! -f $WORKING_DIR/ca.key ] || [ ! -f $WORKING_DIR/ca.crt ] || [ ! -f $WORKING_DIR/server.key ] || [ ! -f $WORKING_DIR/server.crt ]; then
echo "SSL CERT MUST BE REQUIRED SUCH AS"
echo "  --> $WORKING_DIR/ca.key"
echo "  --> $WORKING_DIR/ca.crt"
echo "  --> $WORKING_DIR/server.key"
echo "  --> $WORKING_DIR/server.crt"
echo ""
echo "YOU CAN GENERATE PRIVATE CERTS VIA \"2.gencert.sh\""
echo ""
exit 1
fi

echo "==================================================="
echo "# ENVIRONMENTS                                    #"
echo "==================================================="
while true; do
read -p "DOCKER_SOCK [default:/var/run/docker.sock]: " DOCKER_SOCK
if [ -n "$DOCKER_SOCK" ]; then
export DOCKER_SOCK=$DOCKER_SOCK
else
export DOCKER_SOCK="/var/run/docker.sock"
fi
if [ -e $DOCKER_SOCK ]; then
echo "  --> $DOCKER_SOCK [ OK ]"
break
else
echo "  --> $DOCKER_SOCK [ Failed ]"
fi
done
while true; do read -p "ENTER SYSTEM_ACCESS_KEY: " SYSTEM_ACCESS_KEY; if [ -n "$SYSTEM_ACCESS_KEY" ]; then export SYSTEM_ACCESS_KEY=$SYSTEM_ACCESS_KEY; break; fi; done
while true; do read -p "ENTER SYSTEM_SECRET_KEY: " SYSTEM_SECRET_KEY; if [ -n "$SYSTEM_SECRET_KEY" ]; then export SYSTEM_SECRET_KEY=$SYSTEM_SECRET_KEY; break; fi; done
echo "==================================================="
echo ""

echo "==================================================="
echo "# DEFAULT SETTINGS                                #"
echo "==================================================="
while true; do read -p "ENTER DEFAULT_DOMAIN: " DEFAULT_DOMAIN; if [ -n "$DEFAULT_DOMAIN" ]; then export DEFAULT_DOMAIN=$DEFAULT_DOMAIN; break; fi; done
while true; do read -p "ENTER DEFAULT_ENDPOINT: " DEFAULT_ENDPOINT; if [ -n "$DEFAULT_ENDPOINT" ]; then export DEFAULT_ENDPOINT=$DEFAULT_ENDPOINT; break; fi; done
while true; do read -p "ENTER DEFAULT_ADMIN_USERNAME: " DEFAULT_ADMIN_USERNAME; if [ -n "$DEFAULT_ADMIN_USERNAME" ]; then export DEFAULT_ADMIN_USERNAME=$DEFAULT_ADMIN_USERNAME; break; fi; done
while true; do read -p "ENTER DEFAULT_ADMIN_PASSWORD: " DEFAULT_ADMIN_PASSWORD; if [ -n "$DEFAULT_ADMIN_PASSWORD" ]; then export DEFAULT_ADMIN_PASSWORD=$DEFAULT_ADMIN_PASSWORD; break; fi; done
echo "==================================================="
echo ""

echo "==================================================="
echo "# CLOUD SETTINGS                                  #"
echo "==================================================="
while true; do read -p "ENTER CLOUD_DOMAIN: " CLOUD_DOMAIN; if [ -n "$CLOUD_DOMAIN" ]; then export CLOUD_DOMAIN=$CLOUD_DOMAIN; break; fi; done
while true; do read -p "ENTER ADMIN_PROJECT: " ADMIN_PROJECT; if [ -n "$ADMIN_PROJECT" ]; then export ADMIN_PROJECT=$ADMIN_PROJECT; break; fi; done
while true; do read -p "ENTER PRIME_PROJECT: " PRIME_PROJECT; if [ -n "$PRIME_PROJECT" ]; then export PRIME_PROJECT=$PRIME_PROJECT; break; fi; done
while true; do read -p "ENTER WSA_HOSTNAME: " WSA_HOSTNAME; if [ -n "$WSA_HOSTNAME" ]; then export WSA_HOSTNAME=$WSA_HOSTNAME; break; fi; done
while true; do read -p "ENTER WSA_CLIENT_ID: " WSA_CLIENT_ID; if [ -n "$WSA_CLIENT_ID" ]; then export WSA_CLIENT_ID=$WSA_CLIENT_ID; break; fi; done
while true; do read -p "ENTER WSA_CLIENT_SECRET: " WSA_CLIENT_SECRET; if [ -n "$WSA_CLIENT_SECRET" ]; then export WSA_CLIENT_SECRET=$WSA_CLIENT_SECRET; break; fi; done
while true; do read -p "ENTER WSA_ADMIN_USERNAME: " WSA_ADMIN_USERNAME; if [ -n "$WSA_ADMIN_USERNAME" ]; then export WSA_ADMIN_USERNAME=$WSA_ADMIN_USERNAME; break; fi; done
while true; do read -p "ENTER WSA_ADMIN_PASSWORD: " WSA_ADMIN_PASSWORD; if [ -n "$WSA_ADMIN_PASSWORD" ]; then export WSA_ADMIN_PASSWORD=$WSA_ADMIN_PASSWORD; break; fi; done
echo "==================================================="
echo ""

echo "==================================================="
echo "# SMTP SETTINGS                                   #"
echo "==================================================="
while true; do read -p "ENTER SMTP_HOSTNAME: " SMTP_HOSTNAME; if [ -n "$SMTP_HOSTNAME" ]; then export SMTP_HOSTNAME=$SMTP_HOSTNAME; break; fi; done
while true; do read -p "ENTER SMTP_HOSTPORT: " SMTP_HOSTPORT; if [ -n "$SMTP_HOSTPORT" ]; then export SMTP_HOSTPORT=$SMTP_HOSTPORT; break; fi; done
while true; do read -p "ENTER SMTP_USERNAME: " SMTP_USERNAME; if [ -n "$SMTP_USERNAME" ]; then export SMTP_USERNAME=$SMTP_USERNAME; break; fi; done
while true; do read -p "ENTER SMTP_PASSWORD: " SMTP_PASSWORD; if [ -n "$SMTP_PASSWORD" ]; then export SMTP_PASSWORD=$SMTP_PASSWORD; break; fi; done
while true; do read -p "ENTER SMTP_TLS [true or false]: " SMTP_TLS; if [ "$SMTP_TLS" == "true" ] || [ "$SMTP_TLS" == "false" ]; then export SMTP_TLS=$SMTP_TLS; break; fi; done
while true; do read -p "ENTER SMTP_SSL [true or false]: " SMTP_SSL; if [ "$SMTP_SSL" == "true" ] || [ "$SMTP_SSL" == "false" ]; then export SMTP_SSL=$SMTP_SSL; break; fi; done
echo "==================================================="
echo ""

echo "==================================================="
echo "# Confirming                                      #"
echo "==================================================="
echo "DOCKER_SOCK            = $DOCKER_SOCK"
echo "SYSTEM_ACCESS_KEY      = $SYSTEM_ACCESS_KEY"
echo "SYSTEM_SECRET_KEY      = $SYSTEM_SECRET_KEY"
echo "---------------------------------------------------"
echo "DEFAULT_DOMAIN         = $DEFAULT_DOMAIN"
echo "DEFAULT_ENDPOINT       = $DEFAULT_ENDPOINT"
echo "DEFAULT_ADMIN_USERNAME = $DEFAULT_ADMIN_USERNAME"
echo "DEFAULT_ADMIN_PASSWORD = $DEFAULT_ADMIN_PASSWORD"
echo "---------------------------------------------------"
echo "CLOUD_DOMAIN           = $CLOUD_DOMAIN"
echo "ADMIN_PROJECT          = $ADMIN_PROJECT"
echo "PRIME_PROJECT          = $PRIME_PROJECT"
echo "WSA_HOSTNAME           = $WSA_HOSTNAME"
echo "WSA_CLIENT_ID          = $WSA_CLIENT_ID"
echo "WSA_CLIENT_SECRET      = $WSA_CLIENT_SECRET"
echo "WSA_ADMIN_USERNAME     = $WSA_ADMIN_USERNAME"
echo "WSA_ADMIN_PASSWORD     = $WSA_ADMIN_PASSWORD"
echo "---------------------------------------------------"
echo "SMTP_HOSTNAME          = $SMTP_HOSTNAME"
echo "SMTP_HOSTPORT          = $SMTP_HOSTPORT"
echo "SMTP_USERNAME          = $SMTP_USERNAME"
echo "SMTP_PASSWORD          = $SMTP_PASSWORD"
echo "SMTP_TLS               = $SMTP_TLS"
echo "SMTP_SSL               = $SMTP_SSL"
echo "==================================================="
echo ""

read -p "PRESS ENTER TO INSTALL"
echo $CONF_BIN | base64 -d | tee $CONF_INI.tmp >/dev/null
envsubst < $CONF_INI.tmp > $CONF_INI
rm -rf $CONF_INI.tmp
docker network create orbrium
docker rmi orbrium/install:$DEFAULT_STAGE-active
docker build -t orbrium/install:$DEFAULT_STAGE-active -f - / <<EOF
FROM orbrium/install:$DEFAULT_STAGE
ADD $CONF_INI /opt/orbrium/config.ini
ADD $WORKING_DIR/ca.crt /opt/orbrium/webcert/ca.crt
ADD $WORKING_DIR/ca.key /opt/orbrium/webcert/ca.key
ADD $WORKING_DIR/server.crt /opt/orbrium/webcert/server.crt
ADD $WORKING_DIR/server.key /opt/orbrium/webcert/server.key
EOF
rm -rf $CONF_INI
echo ""

read -p "PRESS ENTER TO BUILD RUNTIME CONTAINERS"
docker run -ti --rm \
	-v $DOCKER_SOCK:/var/run/docker.sock \
	orbrium/install:$DEFAULT_STAGE-active \
	python pygma.py -b all
echo ""

read -p "PRESS ENTER TO DEPLOY RUNTIME CONTAINERS"
docker run -ti --rm \
	-v $DOCKER_SOCK:/var/run/docker.sock \
	orbrium/install:$DEFAULT_STAGE-active \
	python pygma.py -d all
echo ""
echo "FINISHED"
echo ""
echo "LET'S GO ORBRIUM!!!"
echo "  --> https://$DEFAULT_ENDPOINT"
echo ""
