//
//  MatchesListViewModel.swift
//  World Cup
//
//  Created by Alisson Alves on 24/11/22.
//

import Foundation

struct Match: Hashable, Codable, Identifiable {
    var id: String
    var home_team_en: String
    var away_team_en: String
    var home_flag: String
    var away_flag: String
    static let mock = Match(id: "1", home_team_en: "Senegal", away_team_en: "Nederlands", home_flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Flag_of_Senegal.svg/125px-Flag_of_Senegal.svg.png", away_flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/125px-Flag_of_the_Netherlands.svg.png")
}

struct MatchesListResponse: Hashable, Codable {
    var data: [Match]
}

class MatchesListViewModel: ObservableObject {
    @Published var matchesList: [Match] = []
    func fetch() {
        guard let url = URL(string: "http://api.cup2022.ir/api/v1/match")
        else {
            return
        }
        var request = URLRequest(url: url)
        request.setValue("Bearer " + API_KEY, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request){[weak self]data, _,error in
            guard let data = data, error == nil
            else {
                return
            }
            do{
                let matchesResult = try JSONDecoder().decode(MatchesListResponse.self, from: data)
                print(matchesResult)
                DispatchQueue.main.async {
                    self?.matchesList = matchesResult.data
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
