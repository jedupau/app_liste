from django.db import models

# Create your models here.
class Hotline(models.Model):
    name = models.TextField()
    available = models.BooleanField()
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['-updated']


class Commande(models.Model):
    numero = models.IntegerField()
    user = models.TextField()
    hotline = models.TextField()
    lieu = models.TextField()
    details = models.TextField()
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.user + " - " + self.hotline

    class Meta:
        ordering = ['-updated']

class CommandeTraitee(models.Model):
    numero = models.IntegerField()
    user = models.TextField()
    livreur = models.TextField()
    hotline = models.TextField()
    lieu = models.TextField()
    details = models.TextField()
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.user + ' - ' + self.hotline + ' - '

    class Meta:
        ordering = ['-updated']

class NombreCommande(models.Model):
    nombre = models.IntegerField()
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "nombre_commandes:" + str(self.nombre)

    class Meta:
        ordering = ['-updated']

class Utilisateur(models.Model):
    name = models.TextField()
    commande_en_cours = models.IntegerField(blank=True, null=True)
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['-updated']