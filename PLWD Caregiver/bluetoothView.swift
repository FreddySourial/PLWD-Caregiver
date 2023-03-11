//
//  bluetoothView.swift
//  PLWD Caregiver
//
//  Created by Freddy Sourial on 2023-03-10.
//

import SwiftUI
import CoreBluetooth





class BluetoothViewModel: NSObject, ObservableObject {
    private var centralManager: CBCentralManager?
    private var peripherals: [CBPeripheral] = []
    @Published var bleconnect = false
    @Published var peripheralNames: [String] = []
    private var timer: Timer?
    @Published var lastConnectionTime: Date?
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
        if !peripherals.contains(peripheral) {
            self.peripherals.append(peripheral)
            
            if let name = peripheral.name, name != "unnamed device" {
                DispatchQueue.main.async {
                    self.peripheralNames.append(name)
                }
                if name.lowercased().contains("ipad") {
                    bleconnect = true
                    lastConnectionTime = Date()
                    print("Found iPad!")
                } else if !self.peripheralNames.contains(where: { $0.lowercased().contains("ipad") }) {
                    bleconnect = false
                }
            }
            
//            if let name = peripheral.name, name != "unnamed device" {
//                self.peripheralNames.append(name)
//                if (name.lowercased() != "ipad") {
//                    bleconnect = false
//                }
//                if name.lowercased().contains("ipad") {
//                    bleconnect = true
//                    print("Found iPad!")
//
//                }
//
//            }
            print(bleconnect)
        }
    }
    
    
//    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
//        if !peripherals.contains(peripheral) {
//            self.peripherals.append(peripheral)
//            if let name = peripheral.name, name != "unnamed device" {
//                self.peripheralNames.append(name)
//
//
//                if name == "Freddy's iPad" {
//                               bleconnect = true
//                           }
////                if (peripheral.name=="Freddy's iPad"){
////                    //BlueNRG
////                    bleconnect = true
////                    //                                   bleconnect1 = true
////                    print("Connected OH BABBBYYYYY")
////
////
////                    //                "Freddy’s MacBook Pro"
////
////                }
//            }
//            print (bleconnect)
//
//        }
//    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        if let index = peripherals.firstIndex(of: peripheral) {
            peripherals.remove(at: index)
            if index < peripheralNames.count {
                peripheralNames.remove(at: index)
            }
        }
    }
}




struct bluetoothView: View {
    @ObservedObject private var bluetoothViewModel = BluetoothViewModel()
    var body: some View {



        NavigationView {
       
            VStack {
                Spacer()
                    .padding(.bottom, 0.0)
                
                if (bluetoothViewModel.bleconnect == true) {
                               
                                               Text("Bluetooth Connection is Established. Device is nearby.")
                                                   .fontWeight(.bold)
                                                   .multilineTextAlignment(.center)
                               
                                                   .padding(.all)
                                                   .foregroundColor(.black)
                                                   .frame(width: 300, height: 100.0)
                                                       .background(Color.green)
                                                       .cornerRadius(10)
                                           } else {
                                               Text ("BLUETOOTH CONNECTION HAS BEEN LOST! SEARCHING FOR GPS COORDINATES")
                                                   .fontWeight(.bold)
                                                   .multilineTextAlignment(.center)
                               
                                                   .padding(.all)
                                                   .foregroundColor(.black)
                                                   .frame(width: 300, height: 100.0)
                                                       .background(Color.red)
                                                       .cornerRadius(10)
                                               Spacer()
                                           }
                
                
              
                
            
                List(bluetoothViewModel.peripheralNames.filter { $0 != "unnamed device" }, id: \.self) { peripheral in
                    Text(peripheral)
                    
                    
                }
                .frame(height: 300.0) .background(Color.gray.opacity(0.1)).ignoresSafeArea()
                
                
            }.background(Color.gray.opacity(0.1)) .ignoresSafeArea()
            
//        List(bluetoothViewModel.peripheralNames, id: \.self) { peripheral in
//            Text(peripheral)
//        }
        .navigationTitle("Peripherals")
        .edgesIgnoringSafeArea(.all)
            
        }
        .padding(.bottom)
        .edgesIgnoringSafeArea(.all)
//        onDisappear {
//                    bluetoothViewModel.centralManager?.stopScan()
//                }
}
}

struct bluetoothView_Previews: PreviewProvider {
    static var previews: some View {
        bluetoothView()
    }
}
