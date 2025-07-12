from django.urls import path
from . import views  

urlpatterns = [
    path('', views.home, name='home'),
    path('contact/', views.contact, name='contact'),
    path('projects/', views.projects, name='projects'),
    path('aboutme/', views.aboutme, name='aboutme'),
    
    # URL patterns for project management
    path('proyectos/', views.listaProyectos, name='listaProyectos'),
    path('crear-proyecto/', views.crearProyecto, name='crearProyecto'), 
    path('editar-proyecto/<int:pk>/', views.editarProyecto, name='editarProyecto'),
    path('eliminar-proyecto/<int:pk>/', views.eliminarProyecto, name='eliminarProyecto'),
]
