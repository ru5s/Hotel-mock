//
//  Combine.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 10/01/24.
//

import Combine

class DataStore {
    static let shared = DataStore()
    
    private init() {}
    
    var value = CurrentValueSubject<Hotel, Never>(Hotel(id: 1, name: "Лучший пятизвездочный отель в Хургаде, Египет", adress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет", minimalPrice: 134268, priceForIt: "За тур с перелётом", rating: 5, ratingName: "Превосходно", imageUrls: [
        "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg",
        "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
        "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"
    ], aboutHotel: AboutHotel(description: "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!", peculiarities: ["Бесплатный Wifi на всей территории отеля", "1 км до пляжа", "Бесплатный фитнес-клуб", "20 км до аэропорта"])))
    
}
