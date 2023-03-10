
import SwiftUI
import MapKit
import Firebase


/// used by NavBarView to fetch latitude and longitude coordinates from firestore database and onapear to update the location with coordinates of the user.

struct testView: View {
    @StateObject var locationViewModel = LocationViewModel()

    var body: some View {
        Group {
            if let latitude = locationViewModel.latitude, let longitude = locationViewModel.longitude {
                MapView(latitude: latitude, longitude: longitude)
                    .edgesIgnoringSafeArea(.all)
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            locationViewModel.fetchLocationData()
        }
    }
}

class LocationViewModel: ObservableObject {
    @Published var latitude: Double?
    @Published var longitude: Double?

    func fetchLocationData() {
        let db = Firestore.firestore()
        //hQaQgQewO0qpyQO0X8Wn
        //6ECoNaqSHuYLlvtmpgZJ
        db.collection("Data").document("hQaQgQewO0qpyQO0X8Wn").getDocument { snapshot, error in
            guard let snapshot = snapshot, snapshot.exists, let data = snapshot.data() else {
                print("Error fetching location data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let latitude = data["latitude"] as? Double, let longitude = data["longitude"] as? Double {
                DispatchQueue.main.async {
                    self.latitude = latitude
                    self.longitude = longitude
                }
            } else {
                print("Error parsing location data")
            }
        }
    }
}



////
////  testView.swift
////  PLWD Caregiver
////
////  Created by Freddy Sourial on 2023-03-10.
////
//
//import SwiftUI
//import MapKit
//import Firebase
//
//
////struct testView1: View {
////    var body: some View {
////        MapView(latitude: 37.7749, longitude: -122.4194)
////            .edgesIgnoringSafeArea(.all)
////    }
////}
//
//
//
//
//
//
//
//struct testView: View {
//
//    //
//    //    @State var latitude: Double = 45.3876
//    //    @State var longitude: Double = -75.6960
//
//    @State private var latitude: Double = 45.3876
//    @State private var longitude: Double = -75.6960
//
//
//    var body: some View {
//        //                MapView(latitude: 45.3876, longitude: -75.6960)
//        //                    .edgesIgnoringSafeArea(.all)
//        //            }
//
////        VStack {
////            Text("Latitude: \(latitude)")
////            Text("Longitude: \(longitude)")
////        }
////        .onAppear {
////            fetchLocationData()
////
////
////
////        }
//
//
//        MapView(latitude: latitude, longitude: longitude)
//            .edgesIgnoringSafeArea(.all)
//            .onAppear {
//
//                fetchLocationData()
////                let db = Firestore.firestore()
////                db.collection("Data").document("6ECoNaqSHuYLlvtmpgZJ").getDocument { snapshot, error in
////                    guard let snapshot = snapshot, snapshot.exists, let data = snapshot.data() else {
////                        print("Error fetching location data: \(error?.localizedDescription ?? "Unknown error")")
////                        return
////                    }
////
////                    if let latitude = data["latitude"] as? Double, let longitude = data["longitude"] as? Double {
////                        self.latitude = latitude
////                        self.longitude = longitude
////                    } else {
////                        print("Error parsing location data")
////                    }
////                }
//            }
//
//
//    }
//
//
//    func fetchLocationData() {
//            let db = Firestore.firestore()
//            db.collection("Data").document("6ECoNaqSHuYLlvtmpgZJ").getDocument { snapshot, error in
//                guard let snapshot = snapshot, snapshot.exists, let data = snapshot.data() else {
//                    print("Error fetching location data: \(error?.localizedDescription ?? "Unknown error")")
//                    return
//                }
//
//                if let latitude = data["latitude"] as? Double, let longitude = data["longitude"] as? Double {
//                    self.latitude = latitude
//                    self.longitude = longitude
//                } else {
//                    print("Error parsing location data")
//                }
//            }
//        }
//
//}
//
//struct testView_Previews: PreviewProvider {
//    static var previews: some View {
//        testView()
//    }
//}
