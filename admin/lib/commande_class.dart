class Commande {
  int id;
  int numero;
  String user;
  String lieu;
  String hotline;
  String details;
  Commande(
      {required this.user,
      required this.lieu,
      required this.id,
      required this.numero,
      required this.hotline,
      required this.details});
}
