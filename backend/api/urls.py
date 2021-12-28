from django.urls import path
from . import views

urlpatterns = [
    path('', views.getRoutes),
    path('hotlines/', views.getHotlines),
    path('hotlines/update/<str:pk>/', views.updateHotlines),
    path('commandes/', views.getCommandes),
    path('commandes/create/', views.createCommandes),
    path('commandes/delete/<str:pk>/', views.deleteCommandes),
    path('commandes_traitees/create/', views.createCommandeTraitee),
    path('commandes_traitees/<str:pk>/',views.getCommandeTraitee),
    path('nombre_commandes/',views.getNombre),
    path('nombre_commandes/update/', views.updateNombre),
    path('utilisateur/<str:pk>/', views.getUtilisateur),
    path('utilisateur/<str:pk>/update/', views.updateUtilisateurCommande)

]