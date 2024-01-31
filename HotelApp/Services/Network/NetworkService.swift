//
//  NetworkService.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private let stringUrl: String = "https://run.mocky.io/v3/"

    func getHotelFromApi(completion: @escaping (Hotel?, Error?) -> Void) {
        let hotelUrl: String = "d144777c-a67f-4e35-867a-cacc3b827473"
        
        getJsonFromApi(partUrl: hotelUrl) { (data: Hotel?, error) in
            if error != nil {return completion(nil, error)}
            completion(data, nil)
        }
    }

    func getRoomsFromApi(completion: @escaping (Rooms?, Error?) -> Void) {
        let roomUrl: String = "8b532701-709e-4194-a41c-1a903af00195"
        
        getJsonFromApi(partUrl: roomUrl) { (data: Rooms?, error) in
            if error != nil {return completion(nil, error)}
            completion(data, nil)
        }
    }
    
    func getReservationData(completion: @escaping (ReservationModel?, Error?) -> Void) {
        let roomUrl: String = "63866c74-d593-432c-af8e-f279d1a8d2ff"
        
        getJsonFromApi(partUrl: roomUrl) { (data: ReservationModel?, error) in
            if error != nil {return completion(nil, error)}
            completion(data, nil)
        }
    }
    
    private func getJsonFromApi<T: Codable>(partUrl: String, completion: @escaping (T?, Error?) -> Void) {
        guard let url: URL = URL(string: stringUrl + partUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let responseCode = (response as? HTTPURLResponse)?.statusCode
            guard let unwrData = data,
                  responseCode == 200,
                  error == nil
            else {
                let networkError = NetworkError.generateError(responseCode)
                print("error, can't get data, \(networkError.description)")
                completion(nil, networkError)
                return
            }
            do {
                let decodeData = try JSONDecoder().decode(T.self, from: unwrData)
                completion(decodeData, nil)
            } catch {
                print("error decode data \(error.localizedDescription)")
                completion(nil, error)
            }
        }
        task.resume()
    }
}
