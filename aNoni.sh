#!/bin/bash
#coding by:Cr1pto9

trap ctrl_c INT
function ctrl_c(){
        tput civis
        echo -e '\e[1:32mNos vemos'
}
#dependencias
function dependencias(){
        tput civis
        clear
        depen=(wget, curl)
        echo -e '\e[1;34mComprobando paquetes necesarios'
        sleep 3
        for paquet in "${depen[@]}" ; do
                echo -e 'Paquetes: wget, curl'
                sleep 2
                test -f /usr/bin/$paquet
                if [[ "$echo $?" == '0' ]]; then
                        echo -e '\e[1;34m[√]'
                else
                        echo -e '\e[1;32m[X]'
                        echo -e 'Instalando paquetes necesarios'
                        apt-get install $paquet
                        sleep 2
                fi

        done
}
dependencias
#cargar
function loader(){
        chmod +x load.sh
        clear
        sleep 0.3
        bash load.sh
}
loader
#color
verde='\e[1;32m'
cyan='\e[1;36'
blanco='\e[1;37m'
end='\e[1:0m'
#banner
clear
echo -e '\e[1;34m  __ _| \ | | ___  _ __(_)'
echo -e '\e[1;31m / _` |  \| |/ _ \| _ \| |'
echo -e '\e[1;33m| (_| | |\  | (_) | || | |'
echo -e '\e[1;32m \__,_|_| \_|\___/|_||_|_|'
echo -e '        \e[1;45mby:\e[37mCr1pto9 \e[1;0m'

#menu

echo -e '\tMenu \n\e[1;36m[1]\e[1;32mInstalar tor \n\e[1;36m[2]\e[1;33mInstalar proxychains \n\e[1;36m[3]\e[1;33mInstalar prixoxy \n\e[1;36m[4]\e[1;32mObservar manuales \n\e[1;36m[5]\e[1;33mSalir'
echo
#tiempo
date
echo
#tor
function tor(){
#       echo -e '\e[1;34mDebe configurar manualmente a el puerto\e[1;35m:9050'
        clear
                echo -e '\t[*]\e[1;35mConexion realizada con tor'
        clear
        tor
}
#proxychains
function proxychains(){
        apt-get install proxychains -y
        echo -e '\e[1;36mConfigurar manualmente en el puerto 9050'
        cd
        echo 'debe configuarar manualmente \n\e[1;33mA continuancion un pequeño manual'
        sleep 3
        sleep 5
        cd ../usr/etc/;nano proxychains.conf

}
#privoxy
function privoxy(){
        apt install prixoxy -y
        cd
        echo -e 'debe condigurar manualmente'
        sleep 3
        echo -e '\e[1;32m acontinuacion un pequeño manual'
        cd ../usr/etc/;ls/;nano privoxy.conf
}
#material de ayuda
function descarga(){
        echo -e '[*]\e[1;32mVerifique una buena conexion de internet'
        git clone https://github.com/Cr1pto9/gu-a-tor-proxychains
        sleep 2.3
        if [[ -d gu-a-tor-proxychains ]];then
                echo -e '[√]\e[1;33mdescarga completa'
                read -p '\e[1;36mDesea abrir el archivo? {y/n }' abrir
                if [[ $abrir == 'y' || 'Y' ]]; then
                        cd gu-a-tor-proxychains
                        cat Guía.txt
                elif [[ $abrir == 'n' || 'N' ]]; then
                        echo -e '\e[1;36m√'
                        exit
                else
                        echo -e 'X\e[1:34mOpcion incorrecta'
                fi
        else
                echo -e '[X]\e[1;34mEl archivo no se encuentra'
        fi
}
read -p '\aNoni ==>' opcion
if [[ $opcion == '1' ]];then
        loader
        tor
elif [[ $opcion == '2' ]]; then
    loader
    proxychains
elif [[ $opcion == '3' ]]; then
        loader
        privoxy
elif [[ $opcion == '4' ]]; then
        loader
        descarga
elif [[ $opcion == '5'  ]]; then
        loader
        exit
else
        echo
    echo -e '\e[;35m[*]\e[1;34mUps!\e[1;33m Hubo un error'
    echo
fi
