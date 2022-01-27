//
//  UserModel.swift
//  MVVM-Unit-Test
//
//  Created by Alex Paul on 1/26/22.
//

import Foundation
class NetworkService{
    
    func getData(urlString:String, completion:@escaping(Result<[Data]?, Error>)->Void){
        guard let url = URL(string: urlString) else{
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription, "Error getting data")
                return
            }
            if let error = error {
                print(error,"Error from the server")
            }
            let decoder = JSONDecoder()
            
            do{
                let decodedJson = try decoder.decode(UserResposne.self, from: data).data
                DispatchQueue.main.async {
                    completion(.success(decodedJson))
                }
                
            }catch let error{
                print(error.localizedDescription,"error converting json")
                return
            }

        }.resume()
    }
    
    
}
