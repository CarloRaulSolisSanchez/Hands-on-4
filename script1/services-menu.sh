while true; do
    echo "Linux Scripting"
    echo ""
    echo "----------------------------------------"
    echo "1- Lista del contenido de un fichero"
    echo "2- Crear archivo de texto"
    echo "3- Comparar dos archivos de texto"
    echo "4- Uso de awk"
    echo "5- Uso de grep"
    echo "----------------------------------------"
    echo ""
    echo "0) Salir"
    
    read -p "OPC:" option

    case $option in

        1)
            echo ""
            echo "[LISTAR EL CONTENIDO DE UN FICHERO]"
            echo ""
            read -p "Ingrese ruta del fichero: " ruta

            if [ -d "$ruta" ]; then
                echo ""
                echo ""
                echo "[$ruta]"
                echo ""
                ls
            else
                echo ""
                echo ""
                echo "No se pudo encontrar la ruta con el nombre $ruta"
            fi
            ;;
        2)
            echo ""
            echo "[CREAR ARCHIVO DE TEXTO]"
            echo ""
            read -p "Ingresar texto: " texto_ingresado
            read -p "Nombre del archivo (.txt): " archivo_nombre

            echo "$texto_ingresado" > "$archivo_nombre"
            echo ""
            echo "Archivo con el nombre $archivo_nombre fue guardado correctamente"
            echo ""
            echo "" 
            ;;
        3) 
           echo ""
           echo "[COMPARAR ARCHIVOS DE TEXTO]"
           read -p "Ruta del archivo (1): " archivo1
           read -p "Ruta del archivo (2): " archivo2
            
           if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then #se verifica si los archivos (1y2) existen
               #DIFF HACE LA COMPARACION DE LOS ARCHIVOS 
                diff "$archivo1" "$archivo2"
                if [ $? -eq 0 ]; then
                    echo ""
                    echo "Correcto, ambos archivos son iguales"
                    echo ""
                 else
                    echo ""
                    echo "Incorrecto, ambos archivos NO son iguales"
                    echo ""
                 fi
            else
                echo ""
                echo "ERROR EN LA RUTA DE LOS ARCHIVOS"
                echo ""
            fi
            ;;
        4)
            echo ""
            echo "[USO DE AWK]"
            echo ""
            echo "{Sintaxis}"
            echo "awk 'pattern { action }' fileName"
            echo ""
            echo "{Optiones}"
            echo "{ print }: Imprime todas las lineas de un codigo"
            echo "' pattern { print }': Imprime las lineas que coincidan con el patten dado"
            echo "{ print $ 1 }: Imprime la primera columna del archivo"
            ;;
        5)  
            echo ""
            echo "[USO DE GREP]"
            echo ""
            echo "{Sintaxis}"
            echo "grep [options] pattern [files name]"
            echo "Option: Mofica el comportamiento del GREP"
            echo "pattern: la palabra o expresion a la que se busca"
            echo ""
            echo "{Optiones}"
            echo "-c: Imprime un conteo de lineas que coincide con el pattern"
            echo "-h: Muestra las lineas que coinciden, pero no el nombre del archivo"
            echo "-i: Ignora mayusculas y minusculas al hacer alguna consulta"
            echo "-l: Muestra solo la lista de nonbre de archivos"
            echo "-n: Muestra las lineas coincidientes y sus nunmeros de linea"
            echo "-v: Imprime todas las lineas que no coincidan con el pattern"
            ;;

        0) 
           echo ""
           echo ""
           echo "Saliendo...";
           exit 0
            ;;

        *)
           echo ""
           echo ""
           echo "-------------------------------------"
           echo "Opcion no valida, intente nuevamente" 
           echo "-------------------------------------"            
            ;;
    esac
done
