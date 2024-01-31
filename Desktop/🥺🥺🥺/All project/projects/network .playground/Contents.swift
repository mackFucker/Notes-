import UIKit

private var token = "0fd0e482-e585-4c4a-bd33-26986a07b728"

func getFilm(id: Int) {
    guard let url = URL(string: "https://kinopoiskapiunofficial.tech/api/v1/staff?filmId=111111") else { return }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "accept")
    request.addValue("\(token)", forHTTPHeaderField: "X-API-KEY")
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            DispatchQueue.main.async {
                
            }
            return
        }
        if let str = String(data: data!, encoding: .utf8) {
//                       print(str)
                   }
        do {
            let decoded = try JSONDecoder().decode(StaffModel.self, from: data!)
//           print(decoded)
            print(decoded[0].staffId)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }

    enum NetworkError: Error {
        case emptyData
        case invalidURL
        case invalidResponse
    }
    
    getFilm(id: 123)
    
    
    
    
    
    // MARK: - StaffModelElement
    struct StaffModelElement: Codable {
        let staffId: Int
        
        enum CodingKeys: String, CodingKey {
            case staffId
        }
    }
    
    typealias StaffModel = [StaffModelElement]
