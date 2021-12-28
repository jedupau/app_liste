from django.contrib import admin

# Register your models here.
from .models import Commande, CommandeTraitee, Hotline, NombreCommande, Utilisateur
admin.site.register(Hotline)
admin.site.register(Commande)
admin.site.register(CommandeTraitee)
admin.site.register(NombreCommande)
admin.site.register(Utilisateur)