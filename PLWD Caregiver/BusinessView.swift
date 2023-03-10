//
//  BusinessView.swift
//  test.app
//
//  Created by Freddy Sourial on 2023-03-01.
//

import SwiftUI

struct BusinessView: View {
    @ObservedObject var mapController: MapController
    
    var body: some View {
        VStack {
            HStack (alignment: .top) {
                VStack(alignment: .leading){
                    Text(mapController.selectedBusinessName)
                        .font(.title)
                    
                    Text(mapController.selectedBusinessPlacemark)
                }
                Spacer()
                Button {
                    mapController.isBusinessViewShowing.toggle()
                } label: {
                    Image (systemName: "xmark.circle.fill")
                    
                }
            }
            HStack{
                ForEach(mapController.actions){action in Button {
                    action.handler()
                } label: {
                    Image(systemName: action.image)
                    Text(action.title)
                }
                .frame(maxWidth: .infinity)
                    
                }
                .buttonStyle(.bordered)
            } .padding()
        }
        .padding()
    }

}

struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessView(mapController: MapController())
           
    }
}
