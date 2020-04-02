NOTA: se debe tener instalado python en el equipo

abrir una consola de comandos para descargar el proyecto desde el repositorio en github

-link repositorio "https://github.com/azreizor/Vacunatorio"

en la consola escribir:

	-git clone https://github.com/azreizor/Vacunatorio

dirigirse a la carpeta del proyecto por consola y escribir el siguiente comando:

	pip install -r requirements.txt
	
una vez instalado lo necesario, buscar en el ordenador un programa llamado HeidiSQL, que fue instalado junto con mariadb
y en este programa importaremos un archivo SQL (SQL Vacunatorio.sql) con nuestra base de datos. 

Los datos de conexion para HeidiSQL son los siguientes:
	hostname = "120.0.0.1"
	user = "root"
	pass = ""

como paso final, solo queda ejecutar el archivo "main.py" que se encuentra en la raiz de nuestra carpeta del proyecto
	
	ejecutar comando "python main.py"

y luego dirigirse a la direccion entregada por consola junto a se correspondiente puerto. 
por ejemplo: http://127.0.0.1:5000/



