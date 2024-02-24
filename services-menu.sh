menu() {
echo "Menu"
echo "1.- Listar contenido de un fichero"
echo "2.- Crear archivo de texto"
echo "3.- Comparar archivos de texto"
echo "4.- Uso del comando de awk"
echo "5.- Uso del comando de grep"
echo "6.- Salir"
echo "Escoge una opcion del menu"
}

liscont() {
read -p "Ingresa la ruta del fichero o directorio: " ruta
if [ -e "$ruta" ]; then
echo "Contenido de $ruta:"
if [ -d "$ruta" ]; then
ls "$ruta"
else
cat "$ruta"
fi
else
echo "La ruta $ruta no existe"
fi
}

createa() {
read -p "Ingresa lo que quieres ingresar en el archivo: " texto
read -p "Ingresa el nombre de como quieres que se llame el archivo: " archinom
echo "$texto" > "$archinom"
echo "El archivo $archinom se creo bien."
}

comparchi(){
read -p "Ingresa la ruta del primer archivo: " a1
read -p "Ingresa la ruta del segundo archivo: " a2
if [ -f "$a1" ] && [ -f "$a2" ]; then
diff "$a1" "$a2"
else
echo "Uno de los dos archivos no existe o ambos no existen."
fi
}

_awk() {
    read -p "Ingresa el nombre del archivo en el que quieres contar las líneas: " archivo
    echo "Su funcion es contar las líneas de $archivo:"
    awk 'END {print NR}' "$archivo"
}

_grep() {
    read -p "Ingresa el nombre del archivo en el que quieres buscar una palabra: " archivo
    read -p "Ingrese la palabra que desea buscar: " palabra
    echo "Su funcion es buscar '$palabra' en $archivo:"
    grep "$palabra" "$archivo"
}

while true; do
menu
read -p "Selecciona una opcion: " opcion
case $opcion in
1) liscont ;;
2) createa ;;
3) comparchi ;;
4) _awk ;;
5) _grep ;;
6) echo "Hasta luego"; exit ;;
*) echo "No es opcion valida" ;;
esac
read -p "Presiona intro para continuar"

done 
