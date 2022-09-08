class Country {
  final String title;
  final String urlImage;

  const Country({
    required this.title,
    required this.urlImage,
  });
}

extension MyIterable<E> on Iterable<E> {
  Iterable<E> sortedBy(Comparable key(E e)) =>
      toList()..sort((a, b) => key(a).compareTo(key(b)));
}

const List<Country> allCountries = [
  Country(
    title: 'Afryka,Park Narodowy Serengeti, Tanzania,  ',
    urlImage:
        'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAXDYCJ.img?h=768&w=1366&m=6&q=60&o=f&l=f',
  ),
  Country(
    title: 'Australia,Tasman National Park ',
    urlImage:
        'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAKlNiA.img?h=768&w=1366&m=6&q=60&o=f&l=f',
  ),
  Country(
    title: 'Chile,Park Narodowy Torres del Paine ',
    urlImage:
        'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAXCrct.img?h=768&w=1366&m=6&q=60&o=f&l=f',
  ),
  Country(
    title: 'Hiszpania,Park Narodowy Picos de Europa ',
    urlImage:
        'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1a2Kh4.img?h=768&w=1366&m=6&q=60&o=f&l=f',
  ),
  Country(
    title: 'Japonia,Park Narodowy Oze ',
    urlImage:
        'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAWasH9.img?h=768&w=1366&m=6&q=60&o=f&l=f',
  ),
  Country(
    title: 'Kanada,Park Narodowy Waterton Lakes ',
    urlImage:
        'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAXCvWG.img?h=768&w=1366&m=6&q=60&o=f&l=f',
  ),
  Country(
    title: 'Kostaryka,Park Narodowy Arenal ',
    urlImage:
        'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAYOMbN.img?h=768&w=1366&m=6&q=60&o=f&l=f',
  ),
  Country(
    title: 'Tajlandia,Park Narodowy Erawan ',
    urlImage:
        'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAXCaak.img?h=768&w=1366&m=6&q=60&o=f&l=f',
  ),
  Country(
    title: 'Usa,Park Narodowy Acadia, Maine ',
    urlImage:
        'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAOo7ln.img?h=768&w=1080&m=6&q=60&o=f&l=f',
  ),
  Country(
    title: 'Włochy,Park krajobrazowy Tre Cime di Lavaredo ',
    urlImage:
        'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AAU9T6R.img?h=768&w=1366&m=6&q=60&o=f&l=f',
  ),
];
