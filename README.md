# Twitch Chatbot Installscript
 Installationsscript für Node.js, npm, tmi.js und Erstellung der Botfiles.
 <br>
 <span style="color:RED"> Achtung: es handelt sich um ein Script für Linux. getestet wurde es mit dem Raspberry Pi </span>

----
# cred.json - Infos
Hier geht es um den Inhalt der 'cred.json' und wie man an die Daten kommt.

Inhalt: 

{<br>
&nbsp;&nbsp;"brodcaster":"[Brodcaster Name]",<br>
&nbsp;&nbsp;"brodcasterID":"[Brodcaster ID]",<br>
&nbsp;&nbsp;"bearer":"Bearer [TOKEN ID]",<br>
&nbsp;&nbsp;"clientID": "[CLIENT ID]",<br>
&nbsp;&nbsp;"botname": "[Botname]",<br>
&nbsp;&nbsp;"oauth": "[OAUTH xxxxxxx]"<br>
}<br>

Die 2 einfachsten Felder sind "brodcaster" und "botname".<br>
Im Feld "brodcaster" wird der Name des Streamers eingetragen.<br>
Im Feld "botname" wird der Name des Botaccounts eingetragen. Wenn es keinen Botaccount gibt, kann auch der Name des Streamers eingetragen werden.

Für "oauth" muss für den Botuser(wenn nicht vorhanden den Streamer) ein oauth Token angefordert werden. dies erfolgt über: https://twitchapps.com/tmi/

Für die 3 IDs benötigen wir zugriff auf die API.<br>
Dazu muss man sich mit dem Streameraccount auf https://dev.twitch.tv einloggen.<br>
Ist das erfolgt legt man eine neue App an: (Link: https://dev.twitch.tv/console/apps/create)

- Name = Name der App
- OAuth Redirect URLs = "https://localhost" (ohne Anführungszeichen)
- Kategorie = Chatbot
- Client-Typ = vertraulich


Nach der Anlage gehst du auf https://dev.twitch.tv/console/apps/ und klickst dort auf den Button "Verwalten".

Nun Findest du die Client-ID, die du in "clientID" einträgst

Jetzt benötigen wir die twitch-cli. Wie diese für dein System installiert wird findest du hier:<br> https://dev.twitch.tv/docs/cli/

Wenn die Installation erfolgreich war, kann die CLI eingerichtet werden. hierzu benötigt man die ClientID und das zugehörige Geheimnis.<br>
Ist die Einrichtung erfolgt bekommst du mit dem befehl "twitch token" die Id, die hinter "Bearer" eingetragen werden muss.

Es fehlt jetzt nur noch die Brodcaster ID. diese bekommst du über den Befehl "twitch api get /users?login=" gefolgt vom Brodcaster. <br>
Unter dem Punkt "id" in der Antwort findest du die BrodcasterID die in "brodcasterID" eingetragen wird.


Am Ende sollte die Datei mit deinen Daten befüllt sein: hier ein Beispiel:<br>
{<br>
&nbsp;&nbsp;"brodcaster":"huetteplays",<br>
&nbsp;&nbsp;"brodcasterID":"111112222333",<br>
&nbsp;&nbsp;"bearer":"Bearer 12345678912asdf",<br>
&nbsp;&nbsp;"clientID": "123a456b789c123defghijk",<br>
&nbsp;&nbsp;"botname": "huetteplays",<br>
&nbsp;&nbsp;"oauth": "OAUTH 123a456b789c123defgh"<br>
}<br>

Somit hast du die Credentials vollständig gepflegt und kannst eigene Befehle im Bot erstellen. In der func.js findest du zwei beispiele, wie eine Funktion aussehen kann und in der app.js ist ein Beispiel, wie der Aufruf der Funktion erfolgt.



# Viel Spaß mit dem Bot.
