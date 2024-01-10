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

    func getHotelFromApi(competion: @escaping (Hotel?, Error?) -> Void) {
        let hotelUrl: String = "d144777c-a67f-4e35-867a-cacc3b827473"
        guard let url: URL = URL(string: stringUrl+hotelUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, respons, error in

            guard let unwrData = data,
                    (respons as? HTTPURLResponse)?.statusCode == 200,
                    error == nil
            else {
                print("error, can't get data to Hotel entity, \(error?.localizedDescription ?? "")")
                competion(nil, error)
                return
            }
            do {
                let decodeData = try JSONDecoder().decode(Hotel.self, from: unwrData)
                competion(decodeData, nil)
            } catch {
                print("error decode data \(error.localizedDescription)")
                competion(nil, error)
            }
            
        }
        task.resume()
        
    }

    func getRoomsFromApi(competion: @escaping (Rooms?, Error?) -> Void) {
        let roomUrl: String = "8b532701-709e-4194-a41c-1a903af00195"
        guard let url: URL = URL(string: stringUrl + roomUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let unwrData = data,
                  (response as? HTTPURLResponse)?.statusCode == 200,
                  error == nil
            else {
                print("error, can't get data to Rooms entity, \(error?.localizedDescription ?? "")")
                competion(nil, error)
                return
            }
            do {
                let decodeData = try JSONDecoder().decode(Rooms.self, from: unwrData)
                competion(decodeData, nil)
            } catch {
                print("error decode data \(error.localizedDescription)")
                competion(nil, error)
            }
        }
        task.resume()
    }
    
    func getReservationData(competion: @escaping (ReservationModel?, Error?) -> Void) {
        let roomUrl: String = "63866c74-d593-432c-af8e-f279d1a8d2ff"
        guard let url: URL = URL(string: stringUrl + roomUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let unwrData = data,
                  (response as? HTTPURLResponse)?.statusCode == 200,
                  error == nil
            else {
                print("error, can't get data to Rooms entity, \(error?.localizedDescription ?? "")")
                competion(nil, error)
                return
            }
            do {
                let decodeData = try JSONDecoder().decode(ReservationModel.self, from: unwrData)
                competion(decodeData, nil)
            } catch {
                print("error decode data \(error.localizedDescription)")
                competion(nil, error)
            }
        }
        task.resume()
    }
}
