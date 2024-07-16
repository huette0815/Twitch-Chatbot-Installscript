@echo off
chcp 1252
set /p vorinstallation="Sind Node.js und NPM bereits installiert? (J)a / (N)ein.  >>  "
echo.%vorinstallation% | findstr /i "n" > nul && goto end

echo Verzeichnis anlegen..
echo.

:: Verzeichnis erstellen
cd %HOMEDRIVE%%HOMEPATH%
mkdir bot
cd bot

:: Userinfo
echo cred.json anlegen...
echo.

:: Datei cred.json anlegen
(
    echo {
    echo "brodcaster":"[Brodcaster Name]",
    echo "brodcasterID":"[Brodcaster ID]",
    echo "bearer":"Bearer [TOKEN ID]",
    echo "clientID":"[CLIENT ID]",
    echo "botname":"[Botname]",
    echo "oauth":"[OAUTH xxxxxxx]"
    echo }
)> cred.json 

:: Userinfo

echo func.js anlegen..
echo.

:: Datei func.js mit Beispielfunktionen anlegen

echo // Begrüßung neue Chatteilnehmer >> func.js
echo exports.hello = function(target, usname ,client, chatter){ >> func.js
echo    var nachricht = 'Hallo ' + usname + ', Willkommen im Chat. Schön, dass du da bist.' >> func.js
echo    client.say(target, nachricht); >> func.js
echo    chatter.push(usname); >> func.js
echo    return; >> func.js
echo } >> func.js
echo. >> func.js
echo. >> func.js
echo exports.uppercase= function(target,client,usname,msg){ >> func.js
echo    var character = msg; >> func.js
echo    if (character === character.toUpperCase()){ >> func.js
echo        console.log(">> " +usname + ' = Cpt. Capslock'); >> func.js
echo        client.say(target,usname + ' Ahoi Cpt. Capslock.. 30 Sekunden Auszeit für dich.'); >> func.js
echo        client.timeout(target,usname,30,'Cpt. Capslock'); >> func.js
echo    } >> func.js
echo    return; >> func.js
echo } >> func.js

:: Userinfo

echo app.js anlegen..
echo.

:: Datei app.js mit grundlegenden Informationen anlegen

echo const tmi = require('tmi.js'); >> app.js
echo const func = require('./func'); >> app.js
echo const cred = require('./cred.json'); >> app.js
echo. >> app.js
echo const opts = {options: { debug: true }, >> app.js
echo connection: { >> app.js
echo  secure: true, >> app.js
echo  reconnect: true >> app.js
echo }, >> app.js
echo 	identity: { >> app.js
echo 		username: cred.botname, >> app.js
echo 		password: cred.oauth, >> app.js
echo 	}, >> app.js
echo 	channels: ['::' + cred.brodcaster] >> app.js
echo }; >> app.js
echo. >> app.js
echo var chatter = [cred.botname, cred.brodcaster] >> app.js
echo. >> app.js
echo // Create a client with our options >> app.js
echo. >> app.js
echo const client = new tmi.client(opts); >> app.js
echo. >> app.js
echo // Register our event handlers (defined below) >> app.js
echo. >> app.js
echo client.on('message', onMessageHandler); >> app.js
echo client.on('connected', onConnectedHandler); >> app.js
echo. >> app.js
echo // Connect to Twitch: >> app.js
echo. >> app.js
echo client.connect(); >> app.js
echo. >> app.js
echo // Called every time a message comes in >> app.js
echo. >> app.js
echo function onMessageHandler(target, userstate, msg, self){ >> app.js
echo    if (self) { return; } // Ignore messages from the bot >> app.js
echo. >> app.js
echo    // Remove whitespace from chat message >> app.js
echo. >> app.js
echo    const commandName = msg.trim(); >> app.js
echo    var usname = userstate.username; >> app.js
echo. >> app.js
echo    if (!(chatter.includes(usname))){ >> app.js
echo        func.hello(target, usname, client, chatter); >> app.js
echo    } >> app.js
echo. >> app.js
echo. >> app.js
echo    func.uppercase(target, client, usname, msg); >> app.js
echo. >> app.js
echo } >> app.js
echo. >> app.js
echo /* >> app.js
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~ Vorlage Befehl ~~~~~~~~~~~~~~~~~~~~~~~~~~ >> app.js
echo  if (commandName === '[!BEFEHL]'){ >> app.js
echo    func.[Function](target, client); >> app.js
echo  } >> app.js
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ >> app.js
echo */ >> app.js
echo. >> app.js
echo // Called every time the bot connects to Twitch chat >> app.js
echo function onConnectedHandler(addr, port){ >> app.js
echo  console.log('* Connected to ${addr}:${port}'); >> app.js
echo } >> app.js


:: Userinfo

echo Alle Dateien angelegt.
echo In der cred.json müssen die eigenen Nutzerdaten angelegt werden. Die Beschreibung ist in der README.md.
echo Im nächsten Schritt wird tmi.js installiert. Bitte bestätigen sie.
pause

npm install tmi.js

exit

:end
echo Bitte vorab NPM und Node.js installieren. Das Skript wird beendet. Bitte bestätigen Sie.
pause

exit