echo ""
echo "-----------------------------------------"
echo "                GT2SBC"
echo "          v2018-03-28--1620"
echo "Google Text 2 Speak Bash Client for Linux"
echo "-----------------------------------------"
echo "          Luciano Javier Lagassa"
echo "        info@lucianolagassa.com.ar"
echo "        www.lucianolagassa.com.ar"
echo "-----------------------------------------"
if [ $# -gt 0 ]
then
{
 Temporal="/tmp/test.mp3"
 Archivo="$Temporal"
 if [ "$#" = "2" ]
 then
 {
  Archivo="$2"
  echo "Archivo: $Archivo"
 }
 fi
 Texto=`echo $1 | sed 's/^[[:space:]]*//' | tr -s '[[:space:]]' '+'`
 echo "Texto: $1"
 if [ -f "$Archivo" ]
 then
  if [  "$Archivo" = "$Temporal" ]
  then
  {
   rm $Archivo
  }
  fi
 fi
 echo "Generando Audio"
 wget -q --header="Accept: text/html" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0" "http://translate.google.com/translate_tts?ie=UTF-8&total=1&idx=0&textlen=32&client=tw-ob&q=$Texto&tl=es" -O $Archivo
 if [ -f "$Archivo" ]
 then
  echo "Reproduciendo Audio"
  cvlc -q --no-loop --no-repeat --play-and-exit $Archivo > /dev/null 2>&1
  if [  "$Archivo" = "$Temporal" ]
  then
  {
   rm $Archivo
  }
  fi
 else
  echo "Error, Archivo No Generado"
 fi
}
else
{
 echo "Error, No se Ingresaron Comandos."
}
fi
echo "-----------------------------------------" 
