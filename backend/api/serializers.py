from django.db import models
from rest_framework.serializers import ModelSerializer
from .models import CommandeTraitee, Hotline, Commande, NombreCommande, Utilisateur

class HotlineSerializer(ModelSerializer):
    class Meta:
        model = Hotline
        fields = "__all__"

class CommandeSerializer(ModelSerializer):
    class Meta:
        model = Commande
        fields = "__all__"

class CommandeTraiteeSerializer(ModelSerializer):
    class Meta:
        model = CommandeTraitee
        fields = "__all__"

class NombreCommandeSerializer(ModelSerializer):
    class Meta:
        model = NombreCommande
        fields = "__all__"

class UtilisateurSerializer(ModelSerializer):
    class Meta:
        model = Utilisateur
        fields = "__all__"