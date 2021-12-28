from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.response import Response
from .models import Commande, CommandeTraitee, Hotline, NombreCommande, Utilisateur
from .serializers import HotlineSerializer, CommandeSerializer, CommandeTraiteeSerializer, NombreCommandeSerializer, UtilisateurSerializer

# Create your views here.
@api_view(['GET'])
def getRoutes(request):
    routes = [{'body': "coucou"}]
    return Response(routes)

@api_view(['GET'])
def getHotlines(request):
    hotlines = Hotline.objects.all()
    serializer = HotlineSerializer(hotlines, many=True)
    return Response(serializer.data)

@api_view(['PUT'])
def updateHotlines(request, pk):
    hotline = Hotline.objects.get(id=pk)
    serializer = HotlineSerializer(hotline, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
def getCommandes(request):
    commandes = Commande.objects.all()
    serializer = CommandeSerializer(commandes, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def createCommandes(request):
    data = request.data
    commande = Commande.objects.create(
        numero = data['numero'],
        user=data['user'],
        lieu=data['lieu'],
        hotline=data['hotline'],
        details=data['details']
            )
    serializer = CommandeSerializer(commande, many=False)
    return Response(serializer.data)

@api_view(['DELETE'])
def deleteCommandes(request, pk):
    commande = Commande.objects.get(id=pk)
    commande.delete()
    return Response('Commande supprimée !')


@api_view(['POST'])
def createCommandeTraitee(request):
    data = request.data
    commande = CommandeTraitee.objects.create(
        user=data['user'],
        numero = data['numero'],
        livreur = data['livreur'],
        lieu=data['lieu'],
        hotline=data['hotline'],
        details=data['details']
            )
    serializer = CommandeTraiteeSerializer(commande, many=False)
    return Response(serializer.data)

@api_view(['GET'])
def getCommandeTraitee(request, pk):
    commande = CommandeTraitee.objects.get(numero = pk)
    serializer = CommandeTraiteeSerializer(commande, many = False)
    return Response(serializer.data)


@api_view(['GET'])
def getNombre(request):
    nombre = NombreCommande.objects.all()
    serializer = NombreCommandeSerializer(nombre, many=True)
    return Response(serializer.data)

@api_view(['PUT'])
def updateNombre(request):
    nombre = NombreCommande.objects.all()
    nombre = nombre[0]
    serializer = NombreCommandeSerializer(nombre, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def getUtilisateur(request, pk):
    utilisateur = Utilisateur.objects.get(name = pk)
    serializer = UtilisateurSerializer(utilisateur, many=False)
    return Response(serializer.data)


@api_view(['PUT'])
def updateUtilisateurCommande(request, pk):
    utilisateur = Utilisateur.objects.get(name=pk)
    serializer = UtilisateurSerializer(utilisateur, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
