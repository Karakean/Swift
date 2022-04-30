import Foundation

class City {
    var id: Int
    var name: String
    var latitude: Double
    var longitude: Double
    var tags: [String]

    init(_ id: Int, _ name: String, _ latitude: Double, _ longitude: Double, _ tags: [String] ) {
        self.id = id;
        self.name = name;
        self.latitude = latitude;
        self.longitude = longitude;
        self.tags = tags; 
    }
}

let cities = [City( 0,"Gdansk", 54.3520, 18.6466, ["seaside", "Baltic Sea", "music", "ships", "Europe", "Poland", "The Crane"]),
          City(1, "Gdynia", 54.5189, 18.5305, ["seaside", "Baltic Sea", "cliffs", "ships", "Europe", "Poland","Modernism"]),
          City(2, "Swinoujscie", 53.9100, 14.2476, ["seaside", "Baltic Sea", "party", "nature", "ships", "yachts", "Europe","Poland", "Border town"]),
          City(3, "Warsaw", 52.2297, 21.0122, ["capital", "party", "music", "Europe", "Poland","The Palace of Culture and Science"]),
          City(4, "Vancouver", 49.2827, -123.1207, ["seaside", "Pacific Ocean", "sport", "party", "mountains", "North America", "Canada","North Shore Mountains"]),
          City(5, "Las Vegas", 36.1699, -115.13987, ["gambling", "party", "music", "North America", "USA"]),
          City(6, "Sydney", -33.8688, 151.2093, ["seaside", "Pacific Ocean", "sport", "party", "nature", "Blue Mountains", "Australia"]),
          City(7, "Sao Paulo", -23.5558, -46.6396, ["very populated", "party", "music", "Atlantic Ocean", "South America", "Brazil"]),
          City(8, "Kinshasa", -4.4419, 15.26633, ["very populated", "nature", "party", "capital", "Africa", "Congo"]),
          City(9, "Cairo", 30.0444, 31.2357, ["capital","Great Pyramids", "Sphinx", "Africa", "Egypt"]),
          City(10, "New York", 40.7128, -74.0060, ["seaside", "Atlantic", "business", "party", "North America", "USA"]),
          City(11, "Los Angeles", 34.0522, -118.2437, ["seaside", "Pacific Ocean", "mountains","North America", "USA", "California"]),
          City(12, "Oslo", 59.9139, 10.7522, ["seaside", "sport", "nature", "capital", "Europe", "Norway"]),
          City(13, "Stockholm", 59.3293, 18.0686, ["seaside", "sport", "nature", "capital", "Europe", "Sweden"]),
          City(14, "Berlin", 52.5200, 13.4050, ["capital", "party", "music", "Europe", "Germany"]),
          City(15, "Bialystok", 53.1325, 23.1688, ["Szkolna 17", "Kononowicz", "party", "nature", "Nitro Forest", "Europe", "Poland"]),
          City(16, "Paris", 48.8566, 2.3522, ["party", "food", "music", "Louvre", "Notre-Dame", "Eiffel Tower", "capital", "Europe", "France"]),
          City(17, "Rome", 41.9028, 12.4964, ["party", "music", "Colosseum", "Pantheon", "capital", "food", "Europe", "Italy"]),
          City(18, "Naples", 40.8518, 14.2681, ["party", "nature", "Gulf of Naples","Europe", "food", "pizza", "Italy"]),
          City(19, "Athens", 37.9838, 23.7275, ["music", "nature", "sport", "party", "capital", "Europe", "Greece"])]

func search_name(_ name: String, _ cities: [City]) -> [City]{
    var list: [City] = [];
    for city in cities{
        if city.name.lowercased() == name.lowercased(){
            list.append(city);
        }
    }
    return list;
}
var found = search_name("WarSaw", cities)
for f in found{
    print(f.name);
}

func search_tag(_ tag: String, _ cities: [City]) -> [City]{
    var list: [City] = [];
    for city in cities{
        for t in city.tags{
            if t.lowercased() == tag.lowercased(){
                list.append(city);
            }
        }
    }
    return list;
}
var found1 = search_tag("seAsiDe", cities);
print("\nCities with seaside:", terminator: " ");
for f in found1{
    print(f.name, terminator: ", ");
} 
print();

func distance(_ latitude: Double, _ latitude2: Double, _ longitude: Double, _ longitude2: Double) -> Double{
    var y = (latitude - latitude2)*110.574;
    var x = (longitude*cos(latitude*Double.pi/180) - longitude2*cos(latitude2*Double.pi/180))*111.320;
    var z = sqrt(x*x + y*y);
    return z;
}

func city_distance(_ first_city: City, _ second_city: City) -> Double{
    var dist = distance(first_city.latitude, second_city.latitude, first_city.longitude, second_city.longitude);
    return dist;
}
var d = city_distance(cities[0], cities[2]);
print("\nThere is \(d) kilometers between \(cities[0].name) and \(cities[2].name)");

func closest_farthest(_ latitude: Double, _ longitude: Double, _ cities: [City]) -> (City, City){
    var max: Double = 0.0;
    var min: Double = 41000.0;
    var closest: City = cities[0];
    var farthest: City = cities[0];
    for city in cities{
        var x = distance(latitude, city.latitude, longitude, city.longitude);
        if max.isLess(than: x){
            max = x;
            farthest = city;
        }
        if x.isLess(than: min){
            min = x;
            closest = city;
        }
    }
    return (closest, farthest);
}
var (a, b) = closest_farthest(0, 0, cities);
print("\nClosest to 0,0 : \(a.name), farthest: \(b.name)");

func farthest_cities(_ cities: [City]) -> (City, City){
    var farthest1: City = cities[0];
    var farthest2: City = cities[0];
    var max: Double = 0;
    for city1 in cities{
        for city2 in cities{
            var x = distance(city1.latitude, city2.latitude, city1.longitude, city2.longitude)
            if max.isLess(than: x){
                max = x;
                farthest1 = city1;
                farthest2 = city2;
            }
        }
    }
    return (farthest1, farthest2);
}
var (f1, f2) = farthest_cities(cities);
print("\nThe cities that are farthest from each other are \(f1.name) and \(f2.name)");

class Attraction {
    var id: Int
    var type: String
    var name: String
    var rating: Int

    init(_ id: Int, _ type: String, _ name: String, _ rating: Int ) {
        self.id = id;
        self.type = type;
        self.name = name;
        self.rating = rating;
    }
}

class ExtendedCity {
    var city: City
    var attractions: [Attraction]

    init(_ city: City, _ attractions: [Attraction]){
        self.city = city;
        self.attractions = attractions;
    }
}

let extendedCities = [ExtendedCity(cities[0],  [Attraction(0, "restaurant", "OSTRO", 5), Attraction(1, "monument", "The Crane", 2), Attraction(2, "museum", "Museum of the WW2", 3)]),
                      ExtendedCity(cities[1],  [Attraction(3, "pub", "FYRTEL", 5), Attraction(4, "restaurant", "enoki", 5), Attraction(5, "museum", "Museum of Emigration", 3)]), 
                      ExtendedCity(cities[2],  [Attraction(6, "pub", "u Kazika", 5), Attraction(7, "monument", "Stawa Mlyny", 4), Attraction(8, "restaurant", "Muszla", 3)]),
                      ExtendedCity(cities[3],  [Attraction(9, "club", "Luzztro", 3), Attraction(10, "restaurant", "Vege Miasto", 4), Attraction(11, "museum", "Warsaw Uprising Museum", 3)]),
                      ExtendedCity(cities[4],  [Attraction(12, "restaurant", "Heirloom Vegetarian Restaurant", 4), Attraction(13, "museum", "Museum of Anthropology", 4), Attraction(14, "monument", "Brockton Point Totem Pole", 4)]),
                      ExtendedCity(cities[5],  [Attraction(15, "restaurant", "Heart Attack Grill", 2), Attraction(16, "casino", "The Bellagio", 3), Attraction(17, "museum", "The Neon Museum", 3)]),
                      ExtendedCity(cities[6],  [Attraction(18, "restaurant", "Bodhi", 4), Attraction(19, "gallery", "Art Gallery of NSW", 4), Attraction(20, "monument", "Sydney Opera House", 4)]),
                      ExtendedCity(cities[7],  [Attraction(21, "pub", "O'Malley's", 4), Attraction(22, "restaurant", "Lotus", 4), Attraction(23, "monument", "Obelisco do Ibirapuera", 3)]),
                      ExtendedCity(cities[8],  [Attraction(24, "monument", "Mausoleum of Laurent-Desire Kabila", 3), Attraction(25, "restaurant", "Loving Hut", 4), Attraction(26, "museum", "National Museum of the DROTC", 4)]),
                      ExtendedCity(cities[9],  [Attraction(27, "monument", "Great Pyramids", 5), Attraction(28, "monument", "Sphinx", 5), Attraction(29, "museum", "The Egyptian Museum", 5)]),
                      ExtendedCity(cities[10], [Attraction(30, "pub", "McSorley's", 5), Attraction(31, "restaurant", "Urban Vegan Kitchen", 4), Attraction(32, "monument", "Statue of Liberty", 5)]),
                      ExtendedCity(cities[11], [Attraction(33, "museum", "The Natural History Museum", 5), Attraction(34, "restaurant", "Crossroads Kitchen", 4), Attraction(35, "amusement park", "Disneyland", 4)]),
                      ExtendedCity(cities[12], [Attraction(36, "museum", "The Vigeland Park", 4), Attraction(37, "restaurant", "Nordvegan", 4), Attraction(38, "museum", "Viking Ship Museum", 4)]),
                      ExtendedCity(cities[13], [Attraction(39, "museum", "Skansen", 4), Attraction(40, "museum", "Vasa Museum", 3), Attraction(41, "restaurant", "Hermans", 3)]),
                      ExtendedCity(cities[14], [Attraction(42, "restaurant", "Mustafa's Gemuse Kebap", 3), Attraction(43, "museum", "Pergamonmuseum", 3), Attraction(44, "club", "Berghain", 4)]),
                      ExtendedCity(cities[15], [Attraction(45, "museum", "Warmian's belvedere", 5), Attraction(46, "museum", "Nitro Forest", 5), Attraction(47, "restaurant", "Tereska's little dinners", 5)]),
                      ExtendedCity(cities[16], [Attraction(48, "monument", "Eiffel Tower", 5), Attraction(49, "restaurant", "Jah Jah By Le Tricycle", 4), Attraction(50, "museum", "Louvre Musem", 4), Attraction(60, "monument", "Notre-Dame", 4)]),
                      ExtendedCity(cities[17], [Attraction(51, "monument", "Colosseum", 5), Attraction(52, "monument", "Pantheon", 5), Attraction(53, "restaurant", "Flower Burger", 3)]),
                      ExtendedCity(cities[18], [Attraction(54, "restaurant", "Gino e Toto Sorbillo", 5), Attraction(55, "restaurant", "L'Antica Pizzeria da Michele", 5), Attraction(56, "hiking trail", "Mount Vesuvius", 5)]),
                      ExtendedCity(cities[19], [Attraction(57, "monument", "Parthenon", 5), Attraction(58, "monument", "Acropolis", 5), Attraction(59, "restaurant", "Vegan Beat Athens", 4)])]

func citiesWithBestRestaurants(_ cities: [ExtendedCity]) -> Void{
    var list: [String] = [];
    for ecity in cities{
        for attraction in ecity.attractions{
            if attraction.type == "restaurant" && attraction.rating == 5 && !(list.contains(ecity.city.name)){
                list.append(ecity.city.name);
            }
        }
    }
    print("\nCities with best restaurants:", terminator: " ");
    for x in list{
        print(x, terminator: ", ");
    }
    print();
    return;
}
citiesWithBestRestaurants(extendedCities);
func bestAttractionsIn(_ city: ExtendedCity, _ cities: [ExtendedCity]) -> [Attraction]{
    let list: [Attraction] = city.attractions.sorted{$0.rating > $1.rating};
    return list;
}
let bai = bestAttractionsIn(extendedCities[2], extendedCities);
print("\nBest attractions in \(extendedCities[2].city.name):", terminator: " ");
for b in bai{
    print("\(b.name)(\(b.rating)/5)", terminator: ", ");
}
print();

func citiesWithBestLocations(_ cities: [ExtendedCity]) -> Void{
    var list: [(ExtendedCity, Int, [Attraction])] = [];
    for city in cities{
        var attractionCounter = 0;
        var attractionList: [Attraction] = [];
        for attraction in city.attractions{
            if attraction.rating == 5{
                attractionCounter += 1;
                attractionList.append(attraction);
            }
        }
        if attractionCounter > 0{
            list.append((city, attractionCounter, attractionList));
        }
    }
    print("\nCities with most attractive (5 star)  locations:");
    for element in list{
        print("\(element.0.city.name)(\(element.1)), locations:", terminator: " ");
        for att in element.2{
            print(att.name, terminator: ", ");
        }
        print();
    }
    return;
}
citiesWithBestLocations(extendedCities);
