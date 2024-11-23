const users = [
  {
    "id": 1,
    "nom": "Dupont",
    "prenom": "Jean",
    "email": "jean.dupont@example.com",
    "phone": "+33612345678",
    "statut": "actif",
    "chargingTimes": 12
  },
  {
    "id": 2,
    "nom": "Martin",
    "prenom": "Sophie",
    "email": "sophie.martin@example.com",
    "phone": "+33698765432",
    "statut": "block",
    "chargingTimes": 5
  },
  {
    "id": 3,
    "nom": "Durand",
    "prenom": "Alice",
    "email": "alice.durand@example.com",
    "phone": "+33611223344",
    "statut": "actif",
    "chargingTimes": 20
  },
  {
    "id": 4,
    "nom": "Lemoine",
    "prenom": "Pierre",
    "email": "pierre.lemoine@example.com",
    "phone": "+33622334455",
    "statut": "actif",
    "chargingTimes": 8
  },
  {
    "id": 5,
    "nom": "Morel",
    "prenom": "Julie",
    "email": "julie.morel@example.com",
    "phone": "+33633445566",
    "statut": "block",
    "chargingTimes": 3
  },
  {
    "id": 6,
    "nom": "Garcia",
    "prenom": "Antoine",
    "email": "antoine.garcia@example.com",
    "phone": "+33644556677",
    "statut": "actif",
    "chargingTimes": 15
  },
  {
    "id": 7,
    "nom": "Bernard",
    "prenom": "Claire",
    "email": "claire.bernard@example.com",
    "phone": "+33655667788",
    "statut": "block",
    "chargingTimes": 7
  },
  {
    "id": 8,
    "nom": "Petit",
    "prenom": "Lucas",
    "email": "lucas.petit@example.com",
    "phone": "+33666778899",
    "statut": "actif",
    "chargingTimes": 9
  },
  {
    "id": 9,
    "nom": "Roux",
    "prenom": "Emma",
    "email": "emma.roux@example.com",
    "phone": "+33677889900",
    "statut": "actif",
    "chargingTimes": 14
  },
  {
    "id": 10,
    "nom": "Fournier",
    "prenom": "Thomas",
    "email": "thomas.fournier@example.com",
    "phone": "+33688990011",
    "statut": "block",
    "chargingTimes": 6
  },
  {
    "id": 11,
    "nom": "Girard",
    "prenom": "Sarah",
    "email": "sarah.girard@example.com",
    "phone": "+33699001122",
    "statut": "actif",
    "chargingTimes": 17
  },
  {
    "id": 12,
    "nom": "Blanc",
    "prenom": "Hugo",
    "email": "hugo.blanc@example.com",
    "phone": "+33610012233",
    "statut": "block",
    "chargingTimes": 4
  },
  {
    "id": 13,
    "nom": "Henry",
    "prenom": "Laura",
    "email": "laura.henry@example.com",
    "phone": "+33620023344",
    "statut": "actif",
    "chargingTimes": 10
  },
  {
    "id": 14,
    "nom": "Perrin",
    "prenom": "David",
    "email": "david.perrin@example.com",
    "phone": "+33630034455",
    "statut": "block",
    "chargingTimes": 2
  },
  {
    "id": 15,
    "nom": "Renaud",
    "prenom": "Camille",
    "email": "camille.renaud@example.com",
    "phone": "+33640045566",
    "statut": "actif",
    "chargingTimes": 19
  },
  {
    "id": 16,
    "nom": "Marchand",
    "prenom": "Louis",
    "email": "louis.marchand@example.com",
    "phone": "+33650056677",
    "statut": "actif",
    "chargingTimes": 11
  },
  {
    "id": 17,
    "nom": "Vidal",
    "prenom": "Charlotte",
    "email": "charlotte.vidal@example.com",
    "phone": "+33660067788",
    "statut": "block",
    "chargingTimes": 3
  },
  {
    "id": 18,
    "nom": "Aubert",
    "prenom": "Julien",
    "email": "julien.aubert@example.com",
    "phone": "+33670078899",
    "statut": "actif",
    "chargingTimes": 12
  },
  {
    "id": 19,
    "nom": "Lucas",
    "prenom": "Nathalie",
    "email": "nathalie.lucas@example.com",
    "phone": "+33680089900",
    "statut": "block",
    "chargingTimes": 4
  },
  {
    "id": 20,
    "nom": "Barbier",
    "prenom": "Marc",
    "email": "marc.barbier@example.com",
    "phone": "+33690091122",
    "statut": "actif",
    "chargingTimes": 13
  },
  // {
  //   "id": 21,
  //   "nom": "Lemoine",
  //   "prenom": "Eva",
  //   "email": "eva.lemoine@example.com",
  //   "phone": "+33610112233",
  //   "statut": "actif",
  //   "chargingTimes": 9
  // },
  // {
  //   "id": 22,
  //   "nom": "Renault",
  //   "prenom": "Victor",
  //   "email": "victor.renault@example.com",
  //   "phone": "+33620223344",
  //   "statut": "block",
  //   "chargingTimes": 5
  // },
  // {
  //   "id": 23,
  //   "nom": "Gauthier",
  //   "prenom": "Elodie",
  //   "email": "elodie.gauthier@example.com",
  //   "phone": "+33630334455",
  //   "statut": "actif",
  //   "chargingTimes": 16
  // },
  // {
  //   "id": 24,
  //   "nom": "Chevalier",
  //   "prenom": "Paul",
  //   "email": "paul.chevalier@example.com",
  //   "phone": "+33640445566",
  //   "statut": "actif",
  //   "chargingTimes": 18
  // },
  // {
  //   "id": 25,
  //   "nom": "Clément",
  //   "prenom": "Isabelle",
  //   "email": "isabelle.clement@example.com",
  //   "phone": "+33650556677",
  //   "statut": "block",
  //   "chargingTimes": 7
  // },
  // {
  //   "id": 26,
  //   "nom": "Moreau",
  //   "prenom": "Simon",
  //   "email": "simon.moreau@example.com",
  //   "phone": "+33660667788",
  //   "statut": "actif",
  //   "chargingTimes": 20
  // },
  // {
  //   "id": 27,
  //   "nom": "Lambert",
  //   "prenom": "Alice",
  //   "email": "alice.lambert@example.com",
  //   "phone": "+33670778899",
  //   "statut": "block",
  //   "chargingTimes": 8
  // },
  // {
  //   "id": 28,
  //   "nom": "Fontaine",
  //   "prenom": "Leo",
  //   "email": "leo.fontaine@example.com",
  //   "phone": "+33680889900",
  //   "statut": "actif",
  //   "chargingTimes": 15
  // },
  // {
  //   "id": 29,
  //   "nom": "Masson",
  //   "prenom": "Clara",
  //   "email": "clara.masson@example.com",
  //   "phone": "+33690991122",
  //   "statut": "block",
  //   "chargingTimes": 6
  // },
  // {
  //   "id": 30,
  //   "nom": "Dupuis",
  //   "prenom": "Adrien",
  //   "email": "adrien.dupuis@example.com",
  //   "phone": "+33610111213",
  //   "statut": "actif",
  //   "chargingTimes": 10
  // }
];
