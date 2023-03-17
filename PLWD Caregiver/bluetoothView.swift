//
//  bluetoothView.swift
//  PLWD Caregiver
//
//  Created by Freddy Sourial on 2023-03-10.
//

import SwiftUI
import CoreBluetooth
import Foundation




class BluetoothViewModel: NSObject, ObservableObject {
    private var centralManager: CBCentralManager?
    private var peripherals: [CBPeripheral] = []
//    @Published var bleconnect = false
    @Published var bleconnect = false
    @Published var bleconnect1 = false
    @Published var nowww = "Test"
    @Published var blenot = true
    @Published var peripheralNames: [String] = []
    private var timer: Timer?
//    override init() {
//        super.init()
//        self.centralManager = CBCentralManager(delegate: self, queue: .main)
//        startScanningTimer()
//    }
    override init() {
            super.init()
            self.centralManager = CBCentralManager(delegate: self, queue: .main)
            
            // Start the timer to trigger the scan every 10 seconds
            timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { [weak self] _ in
                self?.centralManager?.stopScan()
                self?.peripherals.removeAll()
                self?.peripheralNames.removeAll()
                self?.centralManager?.scanForPeripherals(withServices: nil)
                
            }
        }
    
    deinit {
          // Invalidate the timer when the view model is deallocated
          timer?.invalidate()
      }
    
//    func stopScan() {
//         self.centralManager?.stopScan()
//     }
    
    
    private func startScanningTimer() {
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            if self.centralManager?.state == .poweredOn {
                self.centralManager?.scanForPeripherals(withServices: nil)
            }
        }
    }
}

extension BluetoothViewModel: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            self.centralManager?.scanForPeripherals(withServices: nil)
           
        }
    }
    
    
  
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        //
        if !peripherals.contains(peripheral) {
            self.peripherals.append(peripheral)
            //
            if let name = peripheral.name, name != "unnamed device" {
               //
                DispatchQueue.main.async {
                    self.peripheralNames.append(name)
               //
                }
                if name.lowercased().contains("ipad") {
                    bleconnect = true
                    print("Found iPad!")
                } else if !self.peripheralNames.contains(where: { $0.lowercased().contains("ipad") }) {
                                blenot = false
                                bleconnect = false
                      nowww = getCurrentTime()
                            
                  
                }
                
            }
            
        }
        

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
            print(bleconnect)
            
            bleconnect1 =  bleconnect
            print("BLENOT: \(blenot)")
            print("time: \(nowww)")
        }
    }
    
    

    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        if let index = peripherals.firstIndex(of: peripheral) {
            peripherals.remove(at: index)
            if index < peripheralNames.count {
                peripheralNames.remove(at: index)
            }
        }
    }
}


func getCurrentTime() -> String {
    let date = Date()
    let calendar = Calendar.current
    let day = calendar.component(.day, from: date)
    let month = calendar.component(.month, from: date)
    let year = calendar.component(.year, from: date)
    let hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)
    let second = calendar.component(.second, from: date)
    var minutetwo = "\(minute)"
    if(minutetwo.count == 1){
        minutetwo = "0\(minute)"
    }
    var hourtwo = "\(hour)"
    if(hourtwo.count == 1){
        hourtwo = "0\(hour)"
    }
    var secondtwo = "\(second)"
    if(secondtwo.count == 1){
        secondtwo = "0\(second)"
    }
    let thedate = "\(hourtwo):\(minutetwo):\(secondtwo) \(day)/\(month)/\(year) "
   
    return thedate
}

struct bluetoothView: View {
    @ObservedObject private var bluetoothViewModel = BluetoothViewModel()
    var body: some View {

        ZStack {
           
                       
            NavigationView {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6759886742, green: 0.9469802976, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                                          
                                          LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.6), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                   .edgesIgnoringSafeArea(.all)
                    
                        VStack {
//                            Text (" ").bold(true)
//                                .font(.title2)
//                                .multilineTextAlignment(.center)
//                                .padding(.top)
//
                            Text ("Connection Status").fontWeight(.black) .bold(true) .foregroundColor(.white)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .padding(.vertical, 16.0)
                                .padding(.bottom, 7.0)
                            
                            
                            Spacer()
                            
                            if (bluetoothViewModel.bleconnect1 == true) {
                                if (bluetoothViewModel.bleconnect1 != false){
                                    Text("Bluetooth Connection is Established. Device is nearby.")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white.opacity(0.9))
                                        .multilineTextAlignment(.center)
                                    
                                        .padding(.all)
                                        .foregroundColor(.black)
                                        .frame(width: 300, height: 100.0)
                                        .background(Color.green.opacity(0.5).blur(radius: 2))
                                        
                                        .cornerRadius(10)
                                }
                            }else if (bluetoothViewModel.bleconnect1 == false && bluetoothViewModel.blenot == false) {
                                
                                Text ("BLUETOOTH CONNECTION HAS BEEN LOST! SEARCHING FOR GPS COORDINATES")
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .padding(.all)
                                    .foregroundColor(.black)
                                    .frame(width: 300, height: 100.0)
                                    .background(Color.red)
                                    .cornerRadius(10)
//                                Text ("Last connected on: \(getCurrentTime())")
//                                Text("Attempting to recconect...")
                                Text ("Last Connected: \(bluetoothViewModel.nowww)")
                                Text("Attempting to recconect...")
                                Spacer()
                                
                            }

                            Spacer()
                            
                            Text ("List of Bluetooth Devices").fontWeight(.black) .font(.title2).bold(true) .foregroundColor(.white).padding(.top, 10.0)
                            
                            List(bluetoothViewModel.peripheralNames.filter { $0 != "unnamed device" }, id: \.self) { peripheral in
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(Color.white)
                                    .overlay(
                                
                                Text(peripheral)
                                
                               )
                                    .listRowInsets(EdgeInsets())
                                    .listRowBackground(Color.clear)
                            }
                            .padding(.top, 0.0)
                            .cornerRadius(7)
                            .frame(height: 300.0)
                            .listStyle(PlainListStyle())
                            .background(
                                ZStack {
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: [
                                                Color(#colorLiteral(red: 0.6759886742, green: 0.9469802976, blue: 1, alpha: 1)),
                                                Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                                            ]
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: [
                                                Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.6),
                                                Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.3)
                                            ]
                                        ),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                }
                                    .blur(radius: 11)
                            )
                            //                    .frame(height: 300.0)
                            .edgesIgnoringSafeArea(.all)
                            
                        }
                        .padding(.top, 50.0)
                        
                    

                }
                

            
            .edgesIgnoringSafeArea(.all)
            
            }
            .navigationBarHidden(true)
            
            .edgesIgnoringSafeArea(.all)
        }


}
}

struct bluetoothView_Previews: PreviewProvider {
    static var previews: some View {
        bluetoothView()
    }
}
