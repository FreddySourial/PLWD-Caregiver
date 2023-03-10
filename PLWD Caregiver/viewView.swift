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
                .edgesIgnoringSafeArea(.all)
        }.edgesIgnoringSafeArea(.all)
            .padding(.vertical, 0.0)
        .searchable(text: $mapController.searchTerm)
        .navigationBarTitleDisplayMode(.inline)
       
        .onSubmit(of: .search) {
            mapController.search()
            
        }
            .navigationBarHidden(true)
            .navigationBarItems(leading: EmptyView())
    }
    
    struct viewView_Previews: PreviewProvider {
        static var previews: some View {
            viewView()
        }
    }
}
