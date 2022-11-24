//
//  MatchesListView.swift
//  World Cup
//
//  Created by Alisson Alves on 24/11/22.
//

import SwiftUI

struct MatchesListView: View {
    @StateObject var viewModel = MatchesListViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).onAppear{viewModel.fetch()}
    }
}

struct MatchesListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesListView()
    }
}
