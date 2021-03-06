//
//  MenuController.swift
//  Ordering
//
//  Created by Angel Zambrano on 3/20/22.
//

import Foundation

class MenuController {
    // the Menuu
    enum MenuControllerError: Error, LocalizedError {
        case categoriesNotFound
        case menuItemsNotFound
        case orderRequestFailed
    }
  
    let baseURL = URL(string: "http://localhost:8080/")!
    
    //
    func fetchCategories() async throws -> [String] {
        let categoriesURL =  baseURL.appendingPathComponent("categories")
    
        let (data, response) = try await URLSession.shared.data(from:
      categoriesURL)
        
        guard let httpResponse = response as? HTTPURLResponse,  httpResponse.statusCode == 200 else {
            throw MenuControllerError.categoriesNotFound
        }
        
        let decoder = JSONDecoder()
        let categoriesResponse = try decoder.decode(CategoriesResponse.self,
           from: data)
        
        return categoriesResponse.categories
      
        
        
    }
    
    func fetchMenuItems(forCategory categoryName: String) async throws ->
       [MenuItem] {
        let baseMenuURL = baseURL.appendingPathComponent("menu")
        var components = URLComponents(url: baseMenuURL,
           resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category",
           value: categoryName)]
        let menuURL = components.url!
           
        let (data, response) = try await URLSession.shared.data(from:
                  menuURL)
           
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
               throw MenuControllerError.menuItemsNotFound
           }
        
        let decoder = JSONDecoder()
        let menuResponse = try decoder.decode(MenuResponse.self, from: data)
          
        
           return menuResponse.items
    }
    
        
    
    func submitOrder(forMenuIDs menuIDs: [Int]) async throws -> Int {
        let orderURL = baseURL.appendingPathComponent("order")
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("application/json",  forHTTPHeaderField: "Content-Type")
        
        let menuIdsDict = ["menuIds": menuIDs]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(menuIdsDict)
        request.httpBody = jsonData
        
        let (data, response) = try await URLSession.shared.data(for:
               request)
        
        guard let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode == 200 else {
            throw MenuControllerError.orderRequestFailed
        }
        
        let decoder = JSONDecoder()
        let orderResponse = try decoder.decode(OrderResponse.self, from: data)
        
        return orderResponse.prepTime
       
    
    
    }
    

  
}
