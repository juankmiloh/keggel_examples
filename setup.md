# Infraestructura como código para el reconocimiento de imágenes

Se trae del repo de apdaza https://github.com/apdaza/image_recognition_infrastructure.git

## Preparndo docker
Si se desea ejecutar docker sin el usuario _root_ o sin permisos de super usuario, se deben seguir los siguientes pasos:

- Agregar el grupo docker
<pre>
    sudo groupadd docker
</pre>

- Agregar al usuario actual al grupo docker
<pre>
    sudo gpasswd -a $USER docker
</pre>

- Agregar al usuario que tiene privilegios de root al grupo docker
<pre>
    sudo usermod -aG docker $USER
</pre>

## Crear la imagen
Usamos el comando _docker build_ para la creación de la imagen con la etiqueta _-t_ para especificar un tag para la imagen

<pre>
    docker build -t image_recognition:v1 .
</pre>

## Ejecutar el contenedor

Crear el directorio para Jupyter Notebooks:

<pre>
    mkdir notebooks
</pre>

Ejecutar el contenedor Docker:

<pre>
    docker run -it -p 8888:8888 -p 6006:6006 -d -v "$(pwd)/notebooks":/notebooks image_recognition:v1
    docker run -it -p 8888:8888 -d -v "$(pwd)/notebooks":/notebooks image_recognition:v1
</pre>

Parámetros:
<pre>
-p 8888:8888 to export Jupyter Web interface
-p 6006:6006 to export TensorflowDashboard Web interface
-d to run Docker container in background
-v notebooks:/notebooks to mount just created notebooks folder Docker inside container
</pre>
