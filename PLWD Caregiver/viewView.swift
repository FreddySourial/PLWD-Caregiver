//
//  viewView.swift
//  test.app
//
//  Created by Freddy Sourial on 2023-03-01.
//

import SwiftUI

struct viewView: View {
    @StateObject var mapController = MapController()
    var body: some View {
        
        
        NavigationStack{
            MapView1(mapController: mapController)
        }
        .searchable(text: $mapController.searchTerm)
        .onSubmit(of: .search) {
            mapController.search()
        }
    }
    
    struct viewView_Previews: PreviewProvider {
        static var previews: some View {
            viewView()
        }
    }
}
