//
//  NetworkManager.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 11/04/25.
//

import SwiftUI
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache <NSString, UIImage>()
    private let basesURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    private init () {
        
    }
    func getAppetizers(completed: @escaping (Result <[Appetizer],APError>) -> Void){
        
        guard let url = URL (string: basesURL) else{
            completed(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,response, error in
            if let _ = error  {
                completed(.failure(.unabletoCompelete))
                return
            }
            guard let response = response as? HTTPURLResponse,  response.statusCode == 200 else {
                completed(.failure(.invalidRESPONSE))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidDATA))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            }
            catch {
                completed(.failure(.invalidDATA))
            }
            
            
        }
        task.resume()
    }
    
    
    func downloadImage (fromURLString: String, completed: @escaping (UIImage?) -> Void){
        let cachekey = NSString (string: fromURLString)
        
        
        if let image = cache.object (forKey: cachekey){
            completed(image)
            return
        }
        
        guard let url = URL(string: fromURLString) else {
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cachekey )
            completed(image)
        }
        task.resume()
        
    }
}

