
from django.db import models

class Proyecto(models.Model):
    titulo = models.CharField(max_length=100)
    descripcion = models.TextField()
    fecha = models.DateField()
    url = models.URLField(blank = True)
    
    def __str__(self):
        return self.titulo
    
NIVELES = {
    'Básico' : ('Básico'),
    'Intermedio' : ('Intermedio'),
    'Avanzado' : ('Avanzado'),
}

class Habilidad(models.Model):
    nombre = models.CharField(max_length=100)
    nivel = models.TextField(max_length=20, choices=NIVELES)
    
    def __str__(self):
        return f"{self.nombre}, {self.nivel}"